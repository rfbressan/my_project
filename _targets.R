library(targets)
library(tarchetypes)
# This is an example _targets.R file. Every
# {targets} pipeline needs one.
# Use tar_script() to create _targets.R and tar_edit()
# to open it again for editing.
# Then, run tar_make() to run the pipeline
# and tar_read(summary) to view the results.

# Define custom functions and other global objects.
# This is where you write source(\"R/functions.R\")
# if you keep your functions in external scripts.
source("R/functions_data.R")
source("R/functions_analysis.R")
source("R/functions_tables.R")

# Set target-specific options such as packages.
tar_option_set(
  packages = c("data.table", "kableExtra"))

# End this file with a list of target objects.
list(
  tar_target(hello_vec, hello_dt_fun()),
  tar_target(hello_dt, hello_an_fun(hello_vec), format = "fst_dt"),
  tar_target(hello_tex, hello_tbl(hello_dt), format = "file")
  # Call your custom functions as needed.
)
