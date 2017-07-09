library(ggplot2)
library(ggmap)

draw_ggmap = function(location, zoom, data) {
  '
  Function to draw a ggmap and a KDE on top of the map based on the 
  data points passed to the function 
  location: string indicating the location for the map to be retrieved
  using get_map
  zoom: map zoom, an integer from 3 (continent) to 21 (building)
  data: data points with lon and lat columns
  '
  query = get_map(location = location, zoom = zoom)
  map = ggmap(query, extent = "device")
  map +
    geom_density2d(data = data, aes(x = lon, y = lat), size = 0.3) + 
    stat_density2d(data = data, 
                   aes(x = lon, y = lat, fill = ..level.., alpha = ..level..), size = 0.01, 
                   bins = 16, geom = "polygon") + 
    scale_fill_gradient(low = "green", high = "red") +
    scale_alpha(range = c(0, 0.3), guide = FALSE)
}

UK = get_map(location = c(-4.121072, 53.919044), zoom = 6, maptype = "roadmap")

plor_year = function(y) {
  '
  Function to draw a ggmap of the UK with the yearly data points on top of it 
  y: year of interest
  '
  sub = ct %>% 
    filter(year == y)
  
  ggmap(UK) +
    geom_point(data = sub, aes(x = lon, y = lat), alpha = 0.2, color = "red", size = .5) +
    ggtitle(y) + 
    theme(plot.title = element_text(hjust = 0.5))
}