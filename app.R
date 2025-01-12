library(shiny)

ui <- fluidPage(
  tags$head(
    tags$style(HTML("
      .container-card {
        display: grid;
        grid-template-columns: repeat(4, 1fr); /* 4 kolom di layar besar */
        gap: 20px;
        margin-top: 20px;
      }
      
      .profile-card {
        background-color: #ffffff;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        overflow: hidden;
        text-align: center;
      }

      /* Media query untuk layar kurang dari 1100px */
      @media (max-width: 1100px) {
        .container-card {
          grid-template-columns: repeat(2, 1fr); /* 2 kolom saat layar kecil */
        }
      }

      /* Untuk menata kartu gambar */
      .profile-card-header img {
        width: 150px;
        height: 150px;
        border-radius: 50%;
        object-fit: cover;
      }
    "))
  ),
  
  div(class = "container-card",
      div(class = "row-card",
          div(class = "col-card",
              div(id = "profile_card", class = "profile-card",
                  div(class = "profile-card-header",
                      img(src = "Tampak_dada.jpg", alt = "Profile Picture", class = "profile-picture")
                  ),
                  div(class = "profile-card-body",
                      h2(class = "name", "John Doe"),
                      p(class = "role", "Software Engineer"),
                      p(class = "bio", "Passionate about building scalable web applications and exploring AI. Loves hiking and photography during weekends."),
                      div(class = "social-links",
                          a(href = "https://linkedin.com", "LinkedIn", target = "_blank"),
                          a(href = "https://github.com", "GitHub", target = "_blank"),
                          a(href = "https://twitter.com", "Twitter", target = "_blank")
                      )
                  )
              )
          ),
          div(class = "col-card",
              div(id = "profile_card", class = "profile-card",
                  div(class = "profile-card-header",
                      img(src = "https://via.placeholder.com/150", alt = "Profile Picture", class = "profile-picture")
                  ),
                  div(class = "profile-card-body",
                      h2(class = "name", "John Doe"),
                      p(class = "role", "Software Engineer"),
                      p(class = "bio", "Passionate about building scalable web applications and exploring AI. Loves hiking and photography during weekends."),
                      div(class = "social-links",
                          a(href = "https://linkedin.com", "LinkedIn", target = "_blank"),
                          a(href = "https://github.com", "GitHub", target = "_blank"),
                          a(href = "https://twitter.com", "Twitter", target = "_blank")
                      )
                  )
              )
          ),
          div(class = "col-card",
              div(id = "profile_card", class = "profile-card",
                  div(class = "profile-card-header",
                      img(src = "https://via.placeholder.com/150", alt = "Profile Picture", class = "profile-picture")
                  ),
                  div(class = "profile-card-body",
                      h2(class = "name", "John Doe"),
                      p(class = "role", "Software Engineer"),
                      p(class = "bio", "Passionate about building scalable web applications and exploring AI. Loves hiking and photography during weekends."),
                      div(class = "social-links",
                          a(href = "https://linkedin.com", "LinkedIn", target = "_blank"),
                          a(href = "https://github.com", "GitHub", target = "_blank"),
                          a(href = "https://twitter.com", "Twitter", target = "_blank")
                      )
                  )
              )
          ),
          div(class = "col-card",
              div(id = "profile_card", class = "profile-card",
                  div(class = "profile-card-header",
                      img(src = "https://via.placeholder.com/150", alt = "Profile Picture", class = "profile-picture")
                  ),
                  div(class = "profile-card-body",
                      h2(class = "name", "John Doe"),
                      p(class = "role", "Software Engineer"),
                      p(class = "bio", "Passionate about building scalable web applications and exploring AI. Loves hiking and photography during weekends."),
                      div(class = "social-links",
                          a(href = "https://linkedin.com", "LinkedIn", target = "_blank"),
                          a(href = "https://github.com", "GitHub", target = "_blank"),
                          a(href = "https://twitter.com", "Twitter", target = "_blank")
                      )
                  )
              )
          )
      )
  )
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)