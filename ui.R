shinyUI(pageWithSidebar(
  headerPanel("Sample Size"),
  sidebarPanel(
    sliderInput('er', 'Margin of Error (±)',value = 3, min = 0.05, max = 20, step = 0.05),
    helpText("The margin of error is usually defined as the 'radius' (or half the width) of a confidence interval for a particular statistic from a survey. One example is the percent of people who prefer product A versus product B. When a single, global margin of error is reported for a survey, it refers to the maximum margin of error for all reported percentages using the full sample from the survey."),
    hr(),
    numericInput('cl', 'Confidence Level', value=0.95, min=0.6, max=0.99, step=0.01),
    helpText("The confidence level tells you how sure you can be. If you choose 0.95 then in roughly 95% of the samples, the method produces an interval that contains the population parameter.")),
  
  mainPanel(
    tabsetPanel(
      tabPanel("Sample size", p("This application help you to determine",
                 strong("how many respondents you need to interview"),
                 "in order to get results that reflect the target population as precisely as needed.",
                 style = "font-size:28px; line-height:200%; text-align:center"),
               br(),br(),
               h1(textOutput("text1"), style = "font-size:72px; color:red; line-height:200%; text-align:center")),
      tabPanel("About", textOutput("about"),br(),a("tsdata5.webnode.com/", href="http://tsdata5.webnode.com/"),
               br(), br(), textOutput("about1"), textOutput("about2"), a("More information.", href="https://dl.dropboxusercontent.com/u/198110768/poznamka_akciove_pary.txt"))
    )
  )
))
