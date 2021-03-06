---
title: "Part2: Kernel Density estimation"
author: "Alessandra Sozzi"  
date: "2017-10-12"
output:  github_document
---

This notebook follows along the 3.4 Section produced for the publication *Comparing the density of mobile phone cell towers with population* part of the [ONS Methodology Working Paper Series](https://www.ons.gov.uk/methodology/methodologicalpublications/generalmethodology/onsworkingpaperseries/onsmethodologyworkingpaperseriesnumber13comparingthedensityofmobilephonecelltowerswithpopulationestimates)

The relationship between official estimates of UK residential and [workday population](https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates/articles/theworkdaypopulationofenglandandwales/2013-10-31#data)<sup>1</sup> density and the density of mobile phone cell-towers is investigated using freely available and open-sourced data on cell-tower locations from [OpenCellID](https://opencellid.org/).



Using the cell-tower location measurements and the [ggmap](https://cran.r-project.org/web/packages/ggmap/ggmap.pdf) library<sup>2</sup>, a density estimation technique was used to make inferences about the underlying probability density functions. 

In [Kernel Density Estimation](https://en.wikipedia.org/wiki/Kernel_density_estimation), the contribution of each data point is smoothed out from a single point into a region of space surrounding it. Aggregating the individually smoothed contributions gives an overall picture of the structure of the data and its density function. 


```r
head(London_ct)
```

```
##    cell radio mcc net  lon lat range samples changeable    created
## 1 53052   GSM 234  30 0.36  51  7046       6          1 1311336248
## 2  3121   GSM 234  30 0.35  51   749       2          1 1311336248
## 3 52088   GSM 234  30 0.30  51  4362       4          1 1311336248
## 4 31459   GSM 234  15 0.33  51 14987     182          1 1311336248
## 5 10191   GSM 234  15 0.17  51 17715     397          1 1311336248
## 6 20327   GSM 234  15 0.27  51 11009      75          1 1311336248
##      updated
## 1 1338353836
## 2 1311336248
## 3 1314561467
## 4 1458934876
## 5 1345639189
## 6 1276359333
```


### Heathrow Airport

Although Heathrow Terminals 2 & 3 have a high density of cell towers, it is of note that higher densities are observed at major road junctions around the airport. This may be attributed to it being cheaper to site cell-towers on roads rather than in the airport. It may also be that larger cell-towers are allowed on roads than around the built environment, that there are very high numbers of people expected at these junctions, or possibly that OpenCellID receives GPS location information from travellers on these roads rather than in the airport itself. 


```r
draw_ggmap(location = "Heathrow Airport", zoom = 13, London_ct)
```

![plot of chunk HeathrowAirportKDE](figures//HeathrowAirportKDE-1.png)

### London’s main stations

This technique was also applied to areas of London containing the major mainline stations: areas where high population densities would be expected during the day. 
The next plots reveal the high density of cell towers positioned in some of London’s main stations.

#### Waterloo Train Station


```r
draw_ggmap(location = "Waterloo Train Station, London", 
           zoom = 15, London_ct, scale_color_lims = c(0, 7000))
```

![plot of chunk WaterlooTrainStationKDE](figures//WaterlooTrainStationKDE-1.png)

#### King's Cross Train Station


```r
draw_ggmap(location = "King's Cross Train Station, London", zoom = 15, 
           London_ct, scale_color_lims = c(0, 7000))
```

![plot of chunk KingsCrossTrainStationKDE](figures//KingsCrossTrainStationKDE-1.png)

#### Liverpool Street Train Station


```r
draw_ggmap(location = "Liverpool Street Train Station, London", zoom = 15, 
           London_ct, scale_color_lims = c(0, 7000))
```

![plot of chunk LiverpoolStreetTrainStationKDE](figures//LiverpoolStreetTrainStationKDE-1.png)

#### Victoria Train Station


```r
draw_ggmap(location = "Victoria Train Station, London", zoom = 15, 
           London_ct, scale_color_lims = c(0, 7000))
```

![plot of chunk VictoriaTrainStationKDE](figures//VictoriaTrainStationKDE-1.png)

---

<sup>1</sup> Based on Census 2011

<sup>2</sup> D. Kahle and H. Wickham. ggmap: Spatial Visualization with ggplot2. The R Journal,
  5(1), 144-161. URL http://journal.r-project.org/archive/2013-1/kahle-wickham.pdf
