
# read file
turnout_geocoded <- read.csv("Data/CrowdSize/CrowdEstimates_Geocoded.csv")

# map data
library(maps)
library(mapdata)
library(ggplot2)

# groups
for (i in 1:nrow(turnout_geocoded)) {
  turnout_geocoded$Group[i] <- ifelse(turnout_geocoded$Average[i] >= 500000, 1,
                                        ifelse(turnout_geocoded$Average[i]<500000&turnout_geocoded$Average[i]>=400000,2,
                                               ifelse(turnout_geocoded$Average[i]<400000&turnout_geocoded$Average[i]>=300000,3,
                                                      ifelse(turnout_geocoded$Average[i]<300000&turnout_geocoded$Average[i]>=200000,4,
                                                             ifelse(turnout_geocoded$Average[i]<200000&turnout_geocoded$Average[i]>=100000,5,
                                                                    ifelse(turnout_geocoded$Average[i]<100000&turnout_geocoded$Average[i]>=10000,6,
                                                                           ifelse(turnout_geocoded$Average[i]<10000,7,0)))))))
}
turnout_geocoded <- turnout_geocoded[order(turnout_geocoded$Group),]

# world map
map('worldHires')

pointsizes <- c(1.8, 1.5, 1, 1.2, 0.9, 0.6, 0.3)
for(i in 1:7){
  points(turnout_geocoded$lon[turnout_geocoded$Group == i & !is.na(turnout_geocoded$Group)],
         turnout_geocoded$lat[turnout_geocoded$Group == i & !is.na(turnout_geocoded$Group)],
         pch = 19,
         col = "hot pink", cex = pointsizes[i])
}
title(main = "Womens' Marches around the World")

