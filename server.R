about <- "This website is part of tsdata5.webnode.com project that can be supported by visiting, sharing, giving some ideas or else ... :)"
about1 <- "Attention:"
about2 <- "All information provided on the site https://tsdata5.shinyapps.io/sample_size/ are intended solely for the testing purposes."

shinyServer(
  function(input, output) {
    output$text1 <- renderText({
      cl = input$cl
      cl = cl + (1 - cl) / 2
      ceiling(qnorm(cl)^2 * 0.5^2 / (input$er / 100)^2)
    })
    
    output$about <- renderText({about})
    output$about1 <- renderText({about1})
    output$about2 <- renderText({about2})
    
  }
)
