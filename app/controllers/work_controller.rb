class WorkController < ApplicationController
  def index
    @personal_projects = [
      {
        stacks: ['Ruby on Rails', 'Tailwindcss', 'Docker', 'PostgreSQL'],
        title: 'Rails Tailwind Postgres Project Setup in Docker',
        description: 'A template for setting up a Rails project with Tailwind CSS and PostgreSQL in Docker.',
      },
      {
        stacks: ['Ruby on Rails', 'MySQL', 'Bootstrap'],
        title: 'Lottery App',
        description: 'A lottery app that allows users to buy tickets, check results, and claim prizes.',
      },
    ]

    @other_projects = [
      {
        stacks: ['Express', 'NodeJS', 'MongoDB'],
        title: 'Just Another Computer Shop API',
        description: 'An API for a computer shop. Users can view products, add products to cart, and checkout.',
        role: 'Backend Developer',
      },
      {
        stacks: ['NextJS', 'Tailwindcss'],
        title: 'Cuyo Blockchain Website (Energy Grid Management)',
        description: 'A website for a blockchain project that aims to manage energy grids in Cuyo, Palawan.',
        role: 'Fullstack Developer',
      },
    ]
  end
end
