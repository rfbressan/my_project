
# my_project

<!-- badges: start -->
<!-- badges: end -->

The goal of my_project is to ...


1. Fork this project to your Github account
2. Create a new R project (in RStudio) from Version Control

2.1 Choose a directory and paste the https url of your Github repo

3. Restore the development environment with `renv::restore()`
4. In Tools -> Project Options -> Build tools, select Website and define your `my_project/Article` as the site directory

4.1 The Build pane will be available, from where you can build your article (Ctrl+Shif+B) **when your pipeline is up to date**

After this initial setup your workflow would consist of creating new functions to perform a task, declare a target for such a task, run the pipeline with `targets::tar_make()`, update your manuscript in the Article folder and, compile the article (Build Book or Ctrl+Shif+B).

## Structure

The folder and files structure is chosen to benefit from the data analysis pipeline tool, the [`targets`](https://books.ropensci.org/targets/) package and, with the writting of a research article using [`bookdown`](https://bookdown.org/yihui/bookdown/) in mind.

|--- _targets/          : where `tar_make()` writes target storage and metadata 

|--- _targets.R         : [target script file](https://docs.ropensci.org/targets/reference/tar_script.html)

|--- _targets.yaml      : default arguments to functions like `tar_make()`

|--- .gitignore

|--- .Rbuildignore

|--- .Rprofile          : automatically created by `renv`

|--- .Renviron          : environment variables, e.g. API keys

|--- Article/           : where the files of your article will be

|------ _bookdown.yml   : `bookdown` configuration of your article

|------ _output.yml     : output formats compatible with `bookdown`

|------ article/        : corresponds to the `output_dir` option in _bookdown.yml

|------ Figs/           : figures created in the pipeline should be saved here

|------ index.Rmd       : the first Rmd file of your article. THIS IS NOT a [Target Markdown](https://books.ropensci.org/targets/markdown.html#markdown) file

|------ preamble.tex    : custom preamble to be inserted into your article TEX file

|------ Tables/         : LaTEX tables generated in the pipeline should be saved here 

|------ references.bib  : your BIB file

|--- Data/              : folder where all your data is saved for ingestion

|----- input_data.csv

|--- index.Rmd          : optional file. The basis of your website

|--- LICENSE.md

|--- R/                 : folder of scripts with user-defined R code (functions)

|----- functions_data.R       : data pre-processing functions
  
|----- functions_analysis.R   : data analysis (i.e., regressions, ML models)
  
|----- functions_tables.R     : generating LaTEX tables from results

|----- functions_plots.R      : functions creating figures

|--- README.md
  
|--- renv/                    : dependency management for improved reproducibility

|--- renv.lock
