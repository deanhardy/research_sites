rm(list=ls())

library(tidyr)
# library(tidycensus)
# library(tigris)
# options(tigris_use_cache = TRUE)
library(sf)
library(leaflet)
library(leaflet.providers)
library(tidygeocoder)

## define data directory
datadir <- '/Users/dhardy/Dropbox/r_data/research_sites'

addr <- c('Sapelo Island, GA', 'Atlanta, GA', 'Charlston, SC', 'Rolling Fork, MS')
desc <- c('Racial coastal formation',  'Socio-ecological segregation', 'Conservation justice', 'Climate justice')
# lbl <- c('Lowcountry conservation', 'Coastal vulnerability', 'Urban watersheds')

rs <- data.frame(desc, addr)

geo.rs <- rs %>%
  geocode(addr, method = 'arcgis', lat = latitude , long = longitude) %>%
  st_as_sf(coords = c("longitude", "latitude"),
                     crs = 4326, agr = "constant")

leaflet(options = leafletOptions(zoomControl = FALSE)) %>%
  # addTiles(group = 'OpenStreetMap') %>%
  addProviderTiles(providers$Stadia.StamenWatercolor) %>%
  setView(lng = -84, lat = 33, zoom = 6) %>%
  #addMarkers(group = 'Research Sites', data = sites) %>%
  addMarkers(group = 'Research Locations', data = geo.rs, 
             # popup = desc, 
             label = desc, 
             labelOptions = labelOptions(noHide = T, direction = "right",
                                         style = list(
                                           "color" = "green",
                                           "font-family" = "serif",
                                           "font-style" = "italic",
                                           "box-shadow" = "3px 3px rgba(0,0,0,0.25)",
                                           "font-size" = "12px",
                                           "border-color" = "rgba(0,0,0,0.5)"
                                           ))) %>%
  addScaleBar('bottomright')



