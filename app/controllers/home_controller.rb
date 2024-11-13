class HomeController < ApplicationController
  def index
    @techs = [
      {
        icon: "devicon-ruby-plain",
        title: "Ruby"
      },
      {
        icon: "devicon-rails-plain",
        title: "Ruby on Rails"
      },
      {
        icon: "devicon-html5-plain",
        title: "HTML5"
      },
      {
        icon: "devicon-css3-plain",
        title: "CSS3"
      },
      {
        icon: "devicon-javascript-plain",
        title: "JavaScript"
      },
      {
        icon: "devicon-react-plain",
        title: "React"
      },
      {
        icon: "devicon-python-plain",
        title: "Python"
      },
      {
        icon: "devicon-tailwindcss-plain",
        title: "Tailwindcss"
      },
      {
        icon: "devicon-bootstrap-plain",
        title: "Bootstrap"
      },
      {
        icon: "devicon-mysql-plain",
        title: "MySQL"
      },
      {
        icon: "devicon-mongodb-plain",
        title: "MongoDB"
      },
      {
        icon: "devicon-firebase-plain",
        title: "Firebase"
      },
      {
        icon: "devicon-git-plain",
        title: "Git"
      },
      {
        icon: "devicon-postman-plain",
        title: "Postman"
      },
      {
        icon: "devicon-wordpress-plain",
        title: "WordPress"
      },
      {
        icon: "devicon-docker-plain",
        title: "Docker"
      },
      {
        icon: "devicon-figma-plain",
        title: "Figma"
      }
    ]
  end
end
