# Analysis

hello_an_fun <- function(hello_vec) {
  dt <- data.table(vec = hello_vec)
  dt[, n_char := nchar(vec)]
  return(dt)
}