class AboutController < ApplicationController
  def index
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
  end
end
