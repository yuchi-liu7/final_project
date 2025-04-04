final_project.html: final_project.Rmd code/render_report.R data/heart.csv table_analysis plot_analysis
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
	rm -f output/*.rds && rm -f output/*.png && rm -f *.html
	
	