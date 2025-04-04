here::i_am(
  "code/code_plot2.R"
)
data <- read.csv(here::here("data", "heart.csv"), header = TRUE)
library(knitr)
library(dplyr)
library(ggplot2)
library(tidyverse)

plot2<- ggplot(data, aes(x = factor(HeartDisease), y = Age, fill = factor(HeartDisease))) +
        geom_boxplot(outlier.shape = NA, alpha = 0.6) + 
        scale_fill_manual(values = c("blue", "red"), labels = c("No Heart Disease", "Heart Disease")) +
        labs(title = "Age Distribution by Heart Disease Status",
              x = "Heart Disease Status",
              y = "Age (years)",
              fill = "Heart Disease") +
        theme_minimal(base_size = 14)  


ggsave(
  filename = here::here("output", "plot2.png"),
  plot = plot2
)