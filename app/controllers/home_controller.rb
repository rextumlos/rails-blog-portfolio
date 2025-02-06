class HomeController < ApplicationController
  def index
    @techs = [
      "Ruby",
      "Ruby on Rails",
      "HTML5",
      "CSS3",
      "JavaScript",
      "React",
      "Python",
      "TailwindCSS",
      "Bootstrap",
      "MySQL",
      "MongoDB",
      "Firebase",
      "Git",
      "Postman",
      "WordPress",
      "Docker",
      "Figma"
    ]

    @technical_skills = {
      title: "TECHNICAL SKILLS",
      data: [
        {
          title: "BACKEND DEVELOPMENT",
          skills: ["Ruby on Rails", "ExpressJS", "Python Tornado", "REST API"]
        },
        {
          title: "FRONTEND DEVELOPMENT",
          skills: ["React JS, ERB, Tailwind CSS, Bootstrap"]
        },
        {
          title: "DATABASES",
          skills: ["MySQL, PostgreSQL", "MongoDB", "Firebase Storage"]
        },
        {
          title: "BASIC PROGRAMMING",
          skills: ["Python, C, C++, C#"]
        },
        {
          title: "TOOLS",
          skills: ["Git, Postman, WordPress, Docker, Figma"]
        }
      ]
    }

    @educations = {
      title: "EDUCATION",
      data: [
        {
          title: "Bachelor Of Science in Computer Engineering",
          educations: [
            {
              school: "Polytechnic University of the Philippines - Manila",
              date: "2019 - 2023"
            }
          ]
        }
      ]
    }

    @achievements = {
      title: "ACHIEVEMENTS",
      data: [
        {
          title: "PRESIDENT'S LISTER",
          achievements: [
            {
              date: "2023"
            }
          ]
        },
        {
          title: "DOST SEI SCHOLAR 2019",
          achievements: [
            {
              date: "2019 - 2023"
            }
          ]
        },
      ]
    }

    @experiences = {
      title: "EXPERIENCE",
      data: [
        {
          title: "Software Engineer (ON-SITE)",
          experiences: [
            {
              company: "Secure Smarter Services Inc",
              date: "September 2023 - Present",
              descriptions: [
                "Develop and maintain robust, scalable web applications using Ruby on Rails and Python, ensuring high performance and seamless user experience.",
                "Integrated third-party platforms including payment gateways and gaming services, enhancing system interoperability and client satisfaction.",
                "Collaborated with clients to analyze requirements, delivering custom web service solutions aligned with business goals and technical specifications.",
                "Created tailored business solutions for APIs, optimizing data flow and communication between external systems and internal services to meet operational demands and client objectives.",
                "Designed and implemented dynamic, responsive pages using WordPress, improving the user interface, SEO, and overall site functionality."
              ]
            }
          ]
        }
      ]
    }

    @personal_projects = [
      {
        stacks: ['Ruby on Rails', 'TailwindCSS', 'MySQL'],
        title: 'Rails Blog Portfolio Website',
        description: 'A blog portfolio website made using Ruby on Rails and TailwindCSS.',
      },
      {
        stacks: ['Ruby on Rails', 'TailwindCSS', 'Docker', 'PostgreSQL'],
        title: 'Rails Tailwind Postgres Project Setup in Docker',
        description: 'A template for setting up a Rails project with Tailwind CSS and PostgreSQL in Docker.',
      },
      {
        stacks: ['Ruby on Rails', 'MySQL', 'Bootstrap'],
        title: 'Lottery App',
        description: 'A lottery app that allows users to buy tickets, check results, and claim prizes.',
      },
      {
        stacks: ['NextJS', 'TailwindCSS'],
        title: 'NextJS Portfolio Website',
        description: 'A portfolio of me made using NextJS and TailwindCSS deployed in Vercel.',
      }
    ]

    @other_projects = [
      {
        stacks: ['Express', 'NodeJS', 'MongoDB'],
        title: 'Just Another Computer Shop API',
        description: 'An API for a computer shop. Users can view products, add products to cart, and checkout.',
        role: 'Backend Developer',
      },
      {
        stacks: ['NextJS', 'TailwindCSS'],
        title: 'Cuyo Blockchain Website (Energy Grid Management)',
        description: 'A website for a blockchain project that aims to manage energy grids in Cuyo, Palawan.',
        role: 'Fullstack Developer',
      },
    ]
  end
end
