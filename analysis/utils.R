library(ggplot2)
library(ggmap)
library(dplyr)

legend_theme = theme(legend.title = element_text(size=10, face="bold"))

draw_ggmap = function(location, zoom, data, scale_color_lims=NULL) {
  '
  Function to draw a ggmap and a KDE on top of the map based on the
  data points passed to the function
  location: string indicating the location for the map to be retrieved
  using get_map
  zoom: map zoom, an integer from 3 (continent) to 21 (building)
  data: data points with lon and lat columns
  '
  query = get_map(location = location, zoom = zoom, color = "bw",
                  source = "stamen", maptype = "toner-lite")
  map = ggmap(query, extent = "device")
  map +
    stat_density2d(data = data,
                   aes(x = lon, y = lat, fill = ..level.., alpha = ..level..), size = 0.01,
                   bins = 16, geom = "polygon") +
    scale_fill_gradient(low = "#a1dab4", high = "#225ea8", limits = scale_color_lims,
                        name = "Cell Tower\nDensity") +
    scale_alpha(range = c(0, 0.7), guide = FALSE) +
    legend_theme
}

UK = get_map(location = c(-4.121072, 53.919044), zoom = 6,
             source = "stamen", maptype = "terrain-background")

plor_year = function(y, ct) {
  '
  Function to draw a ggmap of the UK with the yearly data points on top of it
  y: year of interest
  '
  sub = ct %>%
    filter(year == y)

  ggmap(UK) +
    geom_point(data = sub, aes(x = lon, y = lat), alpha = 0.2, color = "red", size = .5) +
    ggtitle(y) +
  theme(plot.title = element_text(hjust = 0.5, vjust = 0.5, size = 50, margin = margin(0, 0, 0.5, 0, "cm")),
          axis.title = element_blank(),
          axis.text = element_blank(),
          axis.ticks = element_blank())
}

monthStart <- function(x) {
  x <- as.POSIXlt(x, origin="1970-01-01")
  x$mday <- 1
  return(as.Date(x))
}
