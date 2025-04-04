
here::i_am(
  "code/code_table1.R"
)
data <- read.csv(here::here("data", "heart.csv"), header = TRUE)
library(knitr)
library(labelled)
library(gtsummary)
library(kableExtra)
summary<-summary(data)

table1<- kable(summary, caption = "Summary Statistics of Heart Failure Dataset", 
                format = "html", digits = 2, align = "c") |>  
          kable_styling(bootstrap_options = c("striped", "hover", "bordered", "condensed"), 
                full_width = FALSE) |>  
         column_spec(1, bold = TRUE, color = "white", background = "#0073C2") |> 
         column_spec(2, color = "#000000", background = "#E0E0E0") 

saveRDS(
  table1,
  file = here::here("output", "table1.rds")
)