library(shiny)

shinyUI(
  navbarPage("Data Products Assignment",
             tabPanel("Analysis",
                      fluidPage(
                        titlePanel("Relationship Between MPG and the other Variables"),
                        sidebarLayout(
                          sidebarPanel(
                            selectInput("variable", "Variable:",
                                        c("Number of cylinders" = "cyl",
                                          "Displacement (cu.in.)" = "disp",
                                          "Gross horsepower" = "hp",
                                          "Rear axle ratio" = "drat",
                                          "Weight (lb/1000)" = "wt",
                                          "1/4 mile time" = "qsec",
                                          "V/S" = "vs",
                                          "Transmission" = "am",
                                          "Number of forward gears" = "gear",
                                          "Number of carburetors" = "carb"
                                        )),
                            
                            checkboxInput("outliers", "Show BoxPlot's outliers", FALSE)
                          ),
                          
                          mainPanel(
                            h3(textOutput("caption")),
                            
                            tabsetPanel(type = "tabs", 
                                        tabPanel("BoxPlot", plotOutput("mpgBoxPlot")),
                                        tabPanel("Regression model", 
                                                 plotOutput("mpgPlot"),
                                                 verbatimTextOutput("fit")
                                        )
                            )
                          )
                        )
                      )
             ),
             tabPanel("Application Documentation",
                      h3("Application Overview"),
                      p("The application is used for understanding the relationship between miles per gallon (MPG) and the other variables in the dataset. The relationship can be visualised using a box plot as well as a regression model. There is a selector using which the user can select the variable that needs to be used for the comparison. Also the user has the flexibility to show the outliers or to hide them in the analysis. The outliers check box is applicable only to the box plot and all outliers are always included in the regression model. The user can toggle between the box plot and the regression model by clicking on the appropriate tabs. Also there are separate pages available in this application describing in detail about the source data and the application itself."),
                      h3("Link to the Github Reposotory"),
                      p("The following link takes you to the Github repository where the code for this shiny application is available.\n"),
                      a("https://github.com/suriyanrr/DataProducts")
             ),
             tabPanel("Understanding the Source Data",
                      h2("Motor Trend Car Road Tests"),
                      hr(),
                      h3("Description"),
                      helpText("The data was extracted from the 1974 Motor Trend US magazine,",
                               " and comprises fuel consumption and 10 aspects of automobile design and performance",
                               " for 32 automobiles (1973-74 models)."),
                      h3("Format"),
                      p("A data frame with 32 observations on 11 variables."),
                      
                      p("  [, 1]   mpg: Miles/(US) gallon"),
                      p("  [, 2]   cyl: Number of cylinders"),
                      p("  [, 3]	 disp: Displacement (cu.in.)"),
                      p("  [, 4]	 hp: Gross horsepower"),
                      p("  [, 5]	 drat: Rear axle ratio"),
                      p("  [, 6]	 wt: Weight (lb/1000)"),
                      p("  [, 7]	 qsec: 1/4 mile time"),
                      p("  [, 8]	 vs: V/S"),
                      p("  [, 9]	 Transmission: (0 = automatic, 1 = manual)"),
                      p("  [,10]	 gear: Number of forward gears"),
                      p("  [,11]	 carb: Number of carburetors"),
                      
                      h3("Source"),
                      
                      p("Henderson and Velleman (1981), Building multiple regression models interactively. Biometrics, 37, 391-411.")
             )
  )
)