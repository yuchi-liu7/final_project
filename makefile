final_project1.html: final_project.Rmd code/render_report.R data/heart.csv table_analysis plot_analysis
	Rscript code/render_report.R
	
output/table1.rds: code/code_table1.R data/heart.csv
	Rscript code/code_table1.R
output/table2.rds: code/code_table2.R data/heart.csv
	Rscript code/code_table2.R
 
output/plot1.png: code/code_plot1.R data/heart.csv
	Rscript code/code_plot1.R
output/plot2.png: code/code_plot2.R data/heart.csv
	Rscript code/code_plot2.R 


.PHONY: table_analysis
table_analysis: output/table1.rds output/table2.rds

.PHONY: plot_analysis
plot_analysis: output/plot1.png output/plot2.png



.PHONY: clean
clean:
	rm -f output/*.rds && rm -f output/*.png && rm -f *.html && rm -f report/*.html
	
  
.PHONY: install
install:	
	Rscript -e "renv::restore(prompt=FALSE)"



# Docker
PROJECTFILES = final_project.Rmd code/code_plot1.R code/code_plot2.R code/code_table1.R code/code_table2.R code/render_report.R makefile
RENVFILES = renv.lock renv/activate.R renv/settings.json

project_image: Dockerfile $(PROJECTFILES) $(RENVFILES)
	docker build -t project_image .
	touch $@
	
report/final_project.html:project_image
	docker run -v "$$(pwd)/report":/home/rstudio/project/report project_image


.PHONY: report
report: 
	docker run -v "$$(pwd)/report":/home/rstudio/project/report yuchi7/project_image



	