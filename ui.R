shinyUI(pageWithSidebar(
        headerPanel('Single Nucleotide Polymorphism (SNP) Explorer'),
        sidebarPanel(
                selectInput('xvar', 'X Variable', choices=axis_vars,selected=axis_vars[2]),
                selectInput('yvar', 'Y Variable', choices=axis_vars,selected=axis_vars[1]),
                tags$small(paste0(
                        "Note: BMI is body mass index. WHR is waist to height ratio"
                )),
                sliderInput("SNPs", "Minimum Number of SNPs to consider",
                            10, 10000, 1000, step = 10)
        ),
        mainPanel(
                plotOutput('plot1')
        )
))