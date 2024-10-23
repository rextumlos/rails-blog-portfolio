# Rails Docker Setup

Tech Stack:
Ruby on Rails
TailwindCSS
MariaDB

Tailwind Setup: https://dev.to/phawk/the-best-way-to-run-tailwind-css-on-rails-302c

## Files needed:

### Dockerfile
```dockerfile=
FROM ruby:3.3.5
RUN bundle config --global frozen 0

RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash && \
    apt-get update && apt-get install -y python3-pip nodejs mariadb-client cron yarn --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

ENV APP_PATH /usr/src/app
RUN mkdir -p $APP_PATH
WORKDIR $APP_PATH

COPY Gemfile* $APP_PATH/
RUN gem update --system && bundle install
COPY . $APP_PATH/

EXPOSE 3000
```

### docker-compose.yml
```yaml=
version: '3'
services:
  db:
    image: mariadb:10.6.9
    restart: always
    ports:
      - 3306:3306
    environment:
      MYSQL_ROOT_PASSWORD: qwer4321
    command: |
      --character-set-server=utf8mb4
      --collation-server=utf8mb4_unicode_ci
      --default-authentication-plugin=mysql_native_password
    volumes:
      - mariadb-data-volume:/var/lib/mysql
      - ./docker/db:/docker-entrypoint-initdb.d

  app:
    build:
      context: .
      dockerfile: ./docker/app/Dockerfile
    command: |
      bash -c
      "yarn install --check-files && \
       bundle install && \
       rake db:migrate && \
       rm -f tmp/pids/server.pid && \
       ./bin/dev"
    stdin_open: true
    tty: true
    volumes:
      - .:/usr/src/app
      - ~/.ssh:/root/.ssh:ro
      - bundle-volume:/usr/local/bundle
    ports:
      - 3000:3000
      - 1234:1234
    environment:
      - REDIS_URL=redis://redis:6379/0
    depends_on:
      - db
      - redis

  sidekiq:
    build:
      context: .
      dockerfile: ./docker/app/Dockerfile
    volumes:
      - .:/usr/src/app
      - bundle-volume:/usr/local/bundle
    depends_on:
      - db
      - redis
    environment:
      - REDIS_URL=redis://redis:6379/0
    command: bundle exec sidekiq -C config/sidekiq.yml

  # Redis
  redis:
    image: redis
    command: ["redis-server", "--appendonly", "yes"]
    ports:
      - 6379:6379
    volumes:
      - redis:/data

#Volumes
volumes:
  bundle-volume:
  mariadb-data-volume:
  redis:
```

### Gemfile
```ruby=
source 'https://rubygems.org'
gem 'rails', '~> 7.2', '>= 7.2.1.1'
```


## Steps to setup docker
1. `docker-compose build`
2. `docker-compose run app rails new . -d mysql -T -j esbuild -c tailwind`
3. Configure your template paths. Add the paths to all of your template files to your ./config/tailwind.config.js file.
```javascript=
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*',
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
```
4. Add the Tailwind directives to your CSS. Add the @tailwind directives for each of Tailwind's layers to your `application.tailwind.css` file located in the `./app/assets/stylesheets` directory.
```css=
- @tailwind base;
- @tailwind components;
- @tailwind utilities;

+ @import "tailwindcss/base";
+ @import "tailwindcss/components";
+ @import "tailwindcss/utilities";
```
5. Adjust `package.json` for bundling tailwind css.
```yaml=
"scripts": {
    "build": "esbuild app/javascript/*.* --bundle --sourcemap --format=esm --outdir=app/assets/builds --public-path=/assets",
    "build:css": "tailwindcss --postcss -i ./app/assets/stylesheets/application.tailwind.css -o ./app/assets/builds/application.css --minify"
  },
``` 

6. Install a few dependencies.
   `yarn add postcss postcss-flexbugs-fixes postcss-import postcss-nested postcss-preset-env`

7. Create `postcss.config.js` at the root project directory.
```javascript=
module.exports = {
  plugins: [
    require("autoprefixer"),
    require("postcss-import"),
    require("tailwindcss"),
    require("postcss-nested"),
    require("postcss-flexbugs-fixes"),
    require("postcss-preset-env")({
      autoprefixer: {
        flexbox: "no-2009",
      },
      stage: 3,
    }),
  ],
};
```

8. Setup `database.yml` that contains your database config, change the content to:
```yaml=
# config/database.yml
   
default: &default
   adapter: mysql2
   encoding: utf8mb4
   pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
   username: root
   password: qwer4321
   host: db
   
development:
   <<: *default
   database: database_name_development
   
test:
   <<: *default
   database: database_name_test
   
production:
   <<: *default
   database: database_name_production
   username: app
   password: <%= ENV["APP_DATABASE_PASSWORD"] %>
```
9. Edit `Procfile.dev`, bind localhost IP.
```dev=
  web: bin/rails server -p 3000 -b '0.0.0.0'
  js: yarn build --watch
  css: yarn build:css --watch
```
10. Type `docker-compose up -d` on your terminal and hit enter to up your container.
11. Open your terminal within container with `docker-compose exec app bash`.
12. Run `bundle install` in container to install the gems of your Gemfile project.
13. On your container, run `rails db:create` to create database and `rails db:migrate` to run migration files. Or `docker-compose run app rails db:create`
14. Try `localhost:3000` on your browser and see if it works.

# Cloning and building the docker

1. `docker-compose build`
2. Update `database.yml` with chosen name for database
3. `docker-compose run app rails db:create`