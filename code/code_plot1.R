here::i_am(
  "code/code_plot1.R"
)
data <- read.csv(here::here("data", "heart.csv"), header = TRUE)
library(knitr)
library(dplyr)
library(ggcorrplot)
numeric_data <- data |> select(where(is.numeric))
cor_matrix <- cor(numeric_data, use = "complete.obs", method = "pearson")
colnames(cor_matrix) <- c("Age", "resting blood pressure", "serum cholesterol", "fasting blood sugar",  "maximum heart rate achieved", "Oldpeak", "Heart Disease")

rownames(cor_matrix) <- colnames(cor_matrix)
plot1<-ggcorrplot(cor_matrix, 
           method = "square",  
           type = "lower", 
           lab = TRUE,  
           title = "Correlation Matrix of Numerical Variables",
           colors = c("blue", "white", "red"))  

ggsave(
  filename = here::here("output", "plot1.png"),
  plot = plot1
)











