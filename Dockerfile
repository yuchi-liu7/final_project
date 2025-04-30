FROM rocker/tidyverse as base

RUN mkdir -p /home/rstudio/project
WORKDIR /home/rstudio/project

RUN mkdir -p renv
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE renv/.cache

RUN Rscript -e "renv::restore(prompt = FALSE) "


###### DO NOT EDIT STAGE 1 BUILD LINES ABOVE ######
FROM rocker/tidyverse

WORKDIR /home/rstudio/project
COPY --from=base /home/rstudio/project .

RUN Rscript -e "install.packages('cardx')"
RUN Rscript -e "install.packages('broom')"
RUN Rscript -e "install.packages('broom.helpers')"
RUN Rscript -e "install.packages('car')"
RUN Rscript -e "install.packages('parameters')"

RUN Rscript -e "renv::snapshot()"


COPY makefile .
COPY final_project.Rmd .

RUN mkdir code
RUN mkdir output
RUN mkdir data
RUN mkdir report

COPY data/heart.csv data
COPY code code

RUN apt-get update && apt-get install -y pandoc

CMD make && mv final_project.html report