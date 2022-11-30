#' read_wildfinder
#' a fuction to return a list with imported tables from all csv files read by fyunction read_csv from readr package
#'
#' @param fam select a single family from the databse
#'
#' @return
#' @export
#'
read_wildfinder <- function(fam = NULL){
  path <- here::here("data", "wildfinder")
  filenames <- list.files(path = path, full.names = TRUE)
  list_elem_names <- basename(filenames)
  list_elem_names <- gsub(".csv", "", list_elem_names)
  list_elem_names <- gsub("-", "_", list_elem_names)
  res <- list()
  for (i in 1:length(filenames)) {
    
      ## Read the csv ----
      
      res[[i]] <- readr::read_csv(filenames[i])
  }
  #return(res)
  names(res) <- list_elem_names
  
  if(is.null(fam)){
    final_table <- res$wildfinder_mammals_list |>
      dplyr::left_join(res$wildfinder_ecoregions_species) |>
      dplyr::left_join(res$wildfinder_ecoregions_list)
  } else{
    res$wildfinder_mammals_list <- res$wildfinder_mammals_list |> 
      dplyr::filter(family == fam)
    final_table <- res$wildfinder_mammals_list |>
      dplyr::left_join(res$wildfinder_ecoregions_species) |>
      dplyr::left_join(res$wildfinder_ecoregions_list)
    }
  final_table
}
