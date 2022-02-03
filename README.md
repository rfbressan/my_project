
# my_project

<!-- badges: start -->
<!-- badges: end -->

The goal of my_project is to provide a minimal infrastructure for writing a research paper using [R]() packages [`targets`](https://books.ropensci.org/targets/index.html) as the main build automation data analysis pipeline and [`bookdown`](https://bookdown.org/yihui/bookdown/) for authoring the manuscript.

## How to use it

1. Fork this project to your Github account
2. Create a new R project (in RStudio) from Version Control

2.1 Choose a directory and paste the https url of your Github repo

3. Restore the development environment with `renv::restore()`
4. In Tools -> Project Options -> Build tools, select Website and define your `my_project/Article` as the site directory

4.1 The Build pane will be available, from where you can build your article (Ctrl+Shif+B) **when your pipeline is up to date**

After this initial setup your workflow would consist of creating new functions to perform a task, declare a target for such a task, run the pipeline with `targets::tar_make()`, update your manuscript in the Article folder and, compile the article (Build Book or Ctrl+Shif+B). Your can check your workflow using the `targets` functions `tar_visnetwork()` or `tar_manifest()`. For more advanced uses you should check the [`targets`](https://books.ropensci.org/targets/index.html) manual.

The data analysis pipeline is used to produce artifacts (e.g. intermediary data, data frames, regression results, etc.), [LaTEX](https://www.ctan.org/) tables (i.e., .tex files) and figures, which can be consumed in the article source RMarkdown. For example, the pipeline would create a LaTEX table file in the directory `Article/Tables` named `hello.tex` and, the `index.Rmd` in the Article folder, which will compile into the paper PDF, would call `\input{Tables/hello}` to insert the table into the final document.


## Structure

The folder and files structure is chosen to benefit from the data analysis pipeline tool, the [`targets`](https://books.ropensci.org/targets/) package and, the writting of a research article using [`bookdown`](https://bookdown.org/yihui/bookdown/). 

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

## Separation of data analysis and article

I have opted to keep separate workflows, data analysis using `targets` and, article authoring using `bookdown` and the Build pane, mainly because `tarchetypes::tar_render()` does not support a `bookdown::pdf_book:` with many files (e.g., one file for each paper section). Another good reason not to put the article compilation into the pipeline is the time it takes to complete the task and, we usually do not want to recompile the whole article every single time we create or adjust an intermediary result. Keeping the data analyis apart from the article authoring lets us interactively make our analysis and debug results without worrying about the article's format and other details. Only when we are happy with our analysis, we can put everything together in the manuscript and build it (CTRL+SHIFT+B) to check on the result.

Of course, we still have the ability to introduce the compilation of an RMarkdown file into the pipeline, see the section on [Literate Programming](https://books.ropensci.org/targets/files.html#literate-programming) from the `targets` documentation. In this case, we rather compile a lightweight report which depends on other targets in the pipeline. Those targets are usually loaded through functions like `tar_load()` and used throughout the report. Unless your research article falls into the *lightweight* category, I suggest you keep the article's build process and the data analysis apart.