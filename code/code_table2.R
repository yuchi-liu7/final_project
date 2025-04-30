
here::i_am(
  "code/code_table2.R"
)

data <- read.csv(here::here("data", "heart.csv"), header = TRUE)
library(knitr)
library(labelled)
library(gtsummary)
library(kableExtra)

var_label(data) <- list(
  Age = "age",
  RestingBP = "resting blood pressure",
  Cholesterol = "serum cholesterol",
  MaxHR = "maximum heart rate achieved"
)

table2<- data |>
         select("Age", "Sex","RestingBP", "Cholesterol","MaxHR","HeartDisease") |>
          tbl_summary(by = HeartDisease,
              missing="no"
           ) |>
        modify_spanning_header(c("stat_1", "stat_2") ~ "**Heart Disease Analysis**") |>
        add_overall() |>
        add_p()

saveRDS(
  table2,
  file = here::here("output", "table2.rds")
)
