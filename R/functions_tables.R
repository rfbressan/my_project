# functions_tables.R

hello_tbl <- function(hello_dt) {
  kbl(hello_dt, booktabs = TRUE) |> 
    save_kable("Article/Tables/hello.tex")
  
  return("Article/Tables/hello.tex")
}