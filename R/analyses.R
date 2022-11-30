

make_sp_ecoreg <- function(table){

  res <- list()
for (i in table$sci_name){
  res[[i]] <- length(unique(table$ecoregion[table$sci_name == i]))
}

sp_ecoreg <- as.data.frame(t(as.data.frame(res))) 
sp_ecoreg <- sp_ecoreg |>
  tibble::rownames_to_column(var = "species") |> 
  dplyr::rename(n_ecoregions = V1)
sp_ecoreg$species <- gsub("\\.", " ", sp_ecoreg$species)
sp_ecoreg <- sp_ecoreg |>
  dplyr::mutate(species = as.factor(species))

sp_ecoreg$species <- forcats::fct_reorder(sp_ecoreg$species, sp_ecoreg$n_ecoregions)

sp_ecoreg

}

