
# Heart Failure Prediction

## Project Overview

This project analyzes the **Heart Failure Prediction Dataset** from Kaggle to explore risk factors associated with heart disease.
The analysis includes **summary statistics and visualization** of key variables.

## Data

-   The dataset is sourced from [Kaggle](https://www.kaggle.com/datasets/fedesoriano/heart-failure-prediction/data).
-   The dataset (`heart.csv`) is stored in the `data/` directory.

## Analysis

**Tables:**

-   `code/code_table1.R`: create table1 and save in output.
-   `code/code_table2.R`: create table2 and save in output.
-   `output/table1.rds`: Summary statistics of the dataset.
-   `output/table2.rds`: Statistical tests comparing groups (with p-values).

**Plots:**

-   `code/code_plot1.R`: create plot1 and save in output.
-   `code/code_plot2.R`: create plot2 and save in output.
-   `output/plot1.png`: Correlation matrix of numerical variables.
-   `output/plot2.png`: Boxplot showing age distribution by heart disease status.

**Report:**

-   `code/render_report.R`: render the final report.

## How to Generate the Final Report

First clone this repository to your local machine.

Set up your working directory to point to the repository folder.

#### Package Environment Setup
This project uses `renv` to ensure package reproducibility.

Before building the project, confirm that you has the renv package installed, run the following code in Console:

``` r
"renv" %in% row.names(installed.packages())
``` 

If the above command returns `FALSE`, install the renv package in Console.

```r
install.packages("renv")
```

To install the correct versions of all required packages as specified in the renv.lock file, do it via command line (bash)

```r
make install
```

This will ensure all required packages are installed with the correct versions for full reproducibility.

1.**Install Required Packages**: If you haven’t installed the required packages, run the following command in R:

``` r
install.packages(c("knitr","dplyr","tidyverse", "gtsummary", "labelled","kableExtra", "ggplot2", "ggcorrplot", "here"))
```

2.  **Run the Makefile**:

The project uses a `makefile` to automate the process.
In terminal, you can generate the report by running:

``` bash
make
```

3.  **Clean Up**:

If you want to remove the generated files (tables, plots, or the report), you can clean the project by running:

``` bash
make clean
```

## Report Description

Introduction: Overview of the dataset.

Objectives of the analysis: descript the purposes of this report.

Table Analysis:

Table 1: Summary statistics of key variables in the dataset (age, cholesterol, etc.).

Table 2: Heart disease analysis, comparing variables by heart disease status and calculating p-values.

Graphical analysis:

Plot 1: Correlation matrix heatmap of numerical variables.

Plot 2: Boxplot comparing age distributions for individuals with and without heart disease.

## Conclusion

The analysis reveals key insights into the relationships between heart disease and various health indicators.
By following the steps outlined above, you can reproduce the analysis, generate the final report, and gain a deeper understanding of the dataset.


##  Docker Image
This project includes a Dockerfile that builds an image to fully reproduce the analysis in a containerized environment using R, renv, and Make.

### Pull the image from DockerHub
1.Using the Pre-Built DockerHub Image
You can pull the image directly from DockerHub:

```bash
docker pull yuchi7/project_image
```
**DockerHub link**:: https://hub.docker.com/repository/docker/yuchi7/project_image/general

To run the full pipeline inside a container:

```bash
make report
```

2. Building the Image Locally 
If you want to rebuild the image locally, and you have Docker installed:

```bash
docker build -t project_image .
```
Or simply use the Makefile:

```bash
make project_image
```
Then bulid the final report:

```bash
make report/final_project.html
```





