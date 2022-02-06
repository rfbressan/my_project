# functions_tables.R

hello_tbl <- function(hello_dt) {
  kbl(hello_dt, format = "latex", booktabs = TRUE,
      caption = "Hello world number of characters",
      label = "hello",
      col.names = c("String", "# characters")) |> 
    kable_classic(latex_options = "HOLD_position") |> 
    save_kable("Article/Tables/hello.tex")
  
  return("Article/Tables/hello.tex")
}