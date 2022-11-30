# _targets.R
library(targets)
library(tarchetypes)
tar_source()

list(
  tar_target(final_table, read_wildfinder(fam = "Ursidae")),
  tar_target(sp_ecoreg, make_sp_ecoreg(final_table)),
  tar_target(
    plot,
    make_plot(
      sp_ecoreg,
      x = sp_ecoreg$species,
      y =  sp_ecoreg$n_ecoregions,
      fill_manual = sp_ecoreg$species
    )
  ),
  tar_render(Exercise_3, "Exercise_3.Rmd")
)

# Here is our call to tar_render()
