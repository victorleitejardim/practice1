library(ggplot2)
make_plot <- function(table, x, y, fill_manual) {
  plot <- ggplot(table) + 
    geom_bar(aes(x = x, 
                 y = y,
                 fill = fill_manual),
                 stat = "identity")+
    labs(x = "Species", y = "Number of ecoregions")+
    theme(legend.position = "bottom"
         , axis.text.x = element_text(angle = 45, vjust = 0.4))
  
  ggsave(here::here("outputs", "plot.png"), plot)
  
  here::here("outputs", "plot.png")
  
}