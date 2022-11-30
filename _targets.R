# _targets.R
library(targets)
library(tarchetypes)
tar_source() 

list(
  tar_target(final_table, read_wildfinder(fam = "Ursidae")),
  tar_target()
)

