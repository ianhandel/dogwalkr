library(tidyverse)
library(sf)
library(leaflet)

ca <- read_sf("Local_Authority_Districts__December_2017__Boundaries_GB_BUC-shp/Local_Authority_Districts__December_2017__Boundaries_GB_BUC.shp")

st_crs(ca)

ca %>% 
  st_buffer(dist = 8000) %>% 
  filter(LAD17NM %in% c("Scottish Borders", "City of Edinburgh")) %>%
  st_transform(ca1, crs = "+proj=latlon +datum=WGS84") %>% 
  leaflet() %>% 
  addTiles() %>% 
  addPolygons()
