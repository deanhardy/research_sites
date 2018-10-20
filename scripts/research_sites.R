rm(list=ls())

library(tidycensus)
library(tigris)
options(tigris_use_cache = TRUE)
library(sf)
library(tmap)
library(leaflet)

## define data directory
datadir <- 'C:/Users/dhardy/Dropbox/r_data/research_sites'

st <- get_decennial(geography = 'state', variables = 'P001001', geometry = TRUE)

sites <- st_read(file.path(datadir, 'research_sites.geojson'))

desc <- c('Lowcountry conservation justice', 'Racial coastal formation',  'Urban socio-ecological segregation')
lbl <- c('Lowcountry conservation', 'Coastal vulnerability', 'Urban watersheds')
  
m <- leaflet(options = leafletOptions(zoomControl = FALSE)) %>%
  #addTiles(group = 'OpenStreetMap') %>%
  addProviderTiles(providers$Stamen.TerrainBackground) %>%
  setView(lng = -82, lat = 33, zoom = 6) %>%
  #addMarkers(group = 'Research Sites', data = sites) %>%
  addMarkers(group = 'Research Locations', data = sites, 
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
m

