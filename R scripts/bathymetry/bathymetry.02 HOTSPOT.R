
# Create an object defining the geographic extent of the model domain

#### Set up ####

rm(list=ls())                                                   

Packages <- c("tidyverse", "sf", "stars", "rnaturalearth", "raster")        # List handy packages
lapply(Packages, library, character.only = TRUE)                            # Load packages

source("./R scripts/@_Region file.R")                                       # Define project region 

domain <- readRDS("./Objects/Domains.rds")

hotspot <- read.csv("./Data/Fishing hotspot.csv") %>%                       # Import coordinates
  rbind(slice_head(.)) %>%                                                  # Close the polygon by repeating first point
  as.matrix() %>%                                                           # Change format for shape()
  shape() %>%                                                               # Convert to sf
  st_transform(crs) %>% 
  mutate(Region = "Fishing Hotspot")

ggplot() +
  geom_sf(data = domain, aes(colour = Shore), fill = NA, size = 0.25) + 
  geom_sf(data = hotspot, aes(colour = Region), fill = NA, size = 0.25) + 
  theme_minimal() +
  theme(legend.position = "bottom") +
  NULL

ggsave_map("./Figures/bathymetry/Case study start.png", last_plot())
