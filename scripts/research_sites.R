rm(list=ls())

library(tidycensus)
library(tigris)
library(sf)
library(tmap)

## define data directory
datadir <- 'C:/Users/Juncus/Dropbox/r_data/research_sites'

st <- get_decennial(geography = 'state', variables = 'P0010001', geometry = TRUE)

sites <- st_read(file.path(datadir, 'research_sites.geojson'))

data(land)

tmap_mode("plot")
tm_shape(sites) + 
  tm_dots(size = 20) + 
tm_shape(st) + 
  tm_borders()
                    
