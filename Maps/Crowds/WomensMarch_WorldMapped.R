
# read file
turnout_geocoded <- read.csv("Data/CrowdSize/CrowdEstimates_Geocoded.csv")

# map data
library(maps)
library(mapdata)
library(ggplot2)

# groups
for (i in 1:nrow(turnout_geocoded)) {
  turnout_geocoded$Group[i] <- ifelse(turnout_geocoded$Average[i]>=500000,1,
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
points(turnout_geocoded$lon[turnout_geocoded$Group==1&!is.na(turnout_geocoded$Group)],
       turnout_geocoded$lat[turnout_geocoded$Group==1&!is.na(turnout_geocoded$Group)],
       pch=19,
       col = "hot pink",cex=1.8)
points(turnout_geocoded$lon[turnout_geocoded$Group==2&!is.na(turnout_geocoded$Group)],
       turnout_geocoded$lat[turnout_geocoded$Group==2&!is.na(turnout_geocoded$Group)],
       pch=19,
       col = "hot pink",cex=1.5)
points(turnout_geocoded$lon[turnout_geocoded$Group==3&!is.na(turnout_geocoded$Group)],
       turnout_geocoded$lat[turnout_geocoded$Group==3&!is.na(turnout_geocoded$Group)],
       pch=19,
       col = "hot pink",cex=1)
points(turnout_geocoded$lon[turnout_geocoded$Group==4&!is.na(turnout_geocoded$Group)],
       turnout_geocoded$lat[turnout_geocoded$Group==4&!is.na(turnout_geocoded$Group)],
       pch=19,
       col = "hot pink",cex=1.2)
points(turnout_geocoded$lon[turnout_geocoded$Group==5&!is.na(turnout_geocoded$Group)],
       turnout_geocoded$lat[turnout_geocoded$Group==5&!is.na(turnout_geocoded$Group)],
       pch=19,
       col = "hot pink",cex=0.9)
points(turnout_geocoded$lon[turnout_geocoded$Group==6&!is.na(turnout_geocoded$Group)],
       turnout_geocoded$lat[turnout_geocoded$Group==6&!is.na(turnout_geocoded$Group)],
       pch=19,
       col = "hot pink",cex=0.6)
points(turnout_geocoded$lon[turnout_geocoded$Group==7&!is.na(turnout_geocoded$Group)],
       turnout_geocoded$lat[turnout_geocoded$Group==7&!is.na(turnout_geocoded$Group)],
       pch=19,
       col = "hot pink",cex=0.3)
title(main="Womens' Marches around the World")

