# Variables that can be put on the x and y axes
#axis_vars <<- c(
#        "-log10(p-value) BMI",
#        "-log10(p-value) Height",
#        "-log10(p-value) Men BMI",
#        "-log10(p-value) Women BMI"
#)

axis_vars <<- c(
        "BMI" = "-log10(p-value) BMI",
        "Height" = "-log10(p-value) Height",
        "Men BMI" = "-log10(p-value) Men BMI",
        "Women BMI" = "-log10(p-value) Women BMI",
        "Men WHR" = "-log10(p-value) Men WHR",
        "Women WHR" = "-log10(p-value) Women WHR"
)

