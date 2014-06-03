shinyUI(pageWithSidebar(
  headerPanel("Sample Size"),
  sidebarPanel(
    sliderInput('er', 'Confidence Interval (Margin of Error (±))',value = 3, min = 0.05, max = 20, step = 0.05),
    helpText("The plus-or-minus figure usually reported in newspaper or television opinion poll results. For example, if you use a confidence interval of 3 and 24% percent of your sample picks an answer you can be 'sure' that if you had asked the question of the entire relevant population between 21% (24-3) and 27% (24+3) would have picked that answer."),
    hr(),
    numericInput('cl', 'Confidence Level', value=0.95, min=0.6, max=0.99, step=0.01),
    helpText("The confidence level tells you how sure you can be. If you choose 0.95 then in roughly 95% of the samples, the method produces an interval that contains the population parameter.")),
  
  mainPanel(
    tabsetPanel(
      tabPanel("Sample size", p("This application help you to determine",
                 strong("how many respondents you need to interview"),
                 "in order to get results that reflect the target population as precisely as needed.",
                 style = "font-size:28px; line-height:200%; text-align:center"),
               br(),br(),br(),br(),br(),
               h1(textOutput("text1"), align = "center")),
      tabPanel("About", textOutput("about"),br(),a("tsdata5.webnode.com/", href="http://tsdata5.webnode.com/"),
               br(), br(), textOutput("about1"), textOutput("about2"), a("More information.", href="https://dl.dropboxusercontent.com/u/198110768/poznamka_akciove_pary.txt"))
    )
  )
))
