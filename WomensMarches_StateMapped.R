
# read file
turnout_geocoded <- read.csv("CrowdEstimates_Geocoded.csv")

# map data
library(maps)
library(mapdata)
library(ggplot2)

# turnout by state
turnout <- read.csv("CrowdEstimates.csv")
states <- turnout[1:517,]
states_avg_turnout <- aggregate(states$Average[!is.na(states$Average)],by=list(states$State[!is.na(states$Average)]),sum)
names(states_avg_turnout) <- c("State","Average")
states_turnout_geocoded <- turnout_geocoded[1:517,]

# prepare to map states - data prep
states_avg_turnout$StateName <- state.name[match(states_avg_turnout$State,state.abb)]
states_avg_turnout[order(states_avg_turnout$Average,decreasing=TRUE),]
for (i in 1:nrow(states_avg_turnout)) {
  states_avg_turnout$Group[i] <- ifelse(states_avg_turnout$Average[i]>=500000,1,
                                        ifelse(states_avg_turnout$Average[i]<500000&states_avg_turnout$Average[i]>=400000,2,
                                               ifelse(states_avg_turnout$Average[i]<400000&states_avg_turnout$Average[i]>=300000,3,
                                                      ifelse(states_avg_turnout$Average[i]<300000&states_avg_turnout$Average[i]>=200000,4,
                                                             ifelse(states_avg_turnout$Average[i]<200000&states_avg_turnout$Average[i]>=100000,5,
                                                                    ifelse(states_avg_turnout$Average[i]<100000&states_avg_turnout$Average[i]>=10000,6,
                                                                           ifelse(states_avg_turnout$Average[i]<10000,7,0)))))))
}
states_avg_turnout <- states_avg_turnout[order(states_avg_turnout$Group),]
for (i in 1:nrow(states_turnout_geocoded)) {
  states_turnout_geocoded$Group[i] <- ifelse(states_turnout_geocoded$Average[i]>=500000,1,
                                             ifelse(states_turnout_geocoded$Average[i]<500000&states_turnout_geocoded$Average[i]>=400000,2,
                                                    ifelse(states_turnout_geocoded$Average[i]<400000&states_turnout_geocoded$Average[i]>=300000,3,
                                                           ifelse(states_turnout_geocoded$Average[i]<300000&states_turnout_geocoded$Average[i]>=200000,4,
                                                                  ifelse(states_turnout_geocoded$Average[i]<200000&states_turnout_geocoded$Average[i]>=100000,5,
                                                                         ifelse(states_turnout_geocoded$Average[i]<100000&states_turnout_geocoded$Average[i]>=10000,6,
                                                                                ifelse(states_turnout_geocoded$Average[i]<10000,7,0)))))))
}
states_turnout_geocoded <- states_turnout_geocoded[order(states_turnout_geocoded$Group),]

# map states
map('state')
map('state',region=c(states_avg_turnout$StateName[states_avg_turnout$Group==1&!is.na(states_avg_turnout$Group)]),col=c("gray48"),fill=TRUE,add=TRUE)
map('state',region=c(states_avg_turnout$StateName[states_avg_turnout$Group==2&!is.na(states_avg_turnout$Group)]),col=c("gray55"),fill=TRUE,add=TRUE)
map('state',region=c(states_avg_turnout$StateName[states_avg_turnout$Group==3&!is.na(states_avg_turnout$Group)]),col=c("gray62"),fill=TRUE,add=TRUE)
map('state',region=c(states_avg_turnout$StateName[states_avg_turnout$Group==4&!is.na(states_avg_turnout$Group)]),col=c("gray69"),fill=TRUE,add=TRUE)
map('state',region=c(states_avg_turnout$StateName[states_avg_turnout$Group==5&!is.na(states_avg_turnout$Group)]),col=c("gray76"),fill=TRUE,add=TRUE)
map('state',region=c(states_avg_turnout$StateName[states_avg_turnout$Group==6&!is.na(states_avg_turnout$Group)]),col=c("gray83"),fill=TRUE,add=TRUE)
map('state',region=c(states_avg_turnout$StateName[states_avg_turnout$Group==7&!is.na(states_avg_turnout$Group)]),col=c("gray92"),fill=TRUE,add=TRUE)
points(states_turnout_geocoded$lon[states_turnout_geocoded$Group==1&!is.na(states_turnout_geocoded$Group)],
       states_turnout_geocoded$lat[states_turnout_geocoded$Group==1&!is.na(states_turnout_geocoded$Group)],
       pch=19,
       col = "hot pink",cex=2.5)
points(states_turnout_geocoded$lon[states_turnout_geocoded$Group==2&!is.na(states_turnout_geocoded$Group)],
       states_turnout_geocoded$lat[states_turnout_geocoded$Group==2&!is.na(states_turnout_geocoded$Group)],
       pch=19,
       col = "hot pink",cex=2.2)
points(states_turnout_geocoded$lon[states_turnout_geocoded$Group==3&!is.na(states_turnout_geocoded$Group)],
       states_turnout_geocoded$lat[states_turnout_geocoded$Group==3&!is.na(states_turnout_geocoded$Group)],
       pch=19,
       col = "hot pink",cex=1.8)
points(states_turnout_geocoded$lon[states_turnout_geocoded$Group==4&!is.na(states_turnout_geocoded$Group)],
       states_turnout_geocoded$lat[states_turnout_geocoded$Group==4&!is.na(states_turnout_geocoded$Group)],
       pch=19,
       col = "hot pink",cex=1.4)
points(states_turnout_geocoded$lon[states_turnout_geocoded$Group==5&!is.na(states_turnout_geocoded$Group)],
       states_turnout_geocoded$lat[states_turnout_geocoded$Group==5&!is.na(states_turnout_geocoded$Group)],
       pch=19,
       col = "hot pink",cex=1)
points(states_turnout_geocoded$lon[states_turnout_geocoded$Group==6&!is.na(states_turnout_geocoded$Group)],
       states_turnout_geocoded$lat[states_turnout_geocoded$Group==6&!is.na(states_turnout_geocoded$Group)],
       pch=19,
       col = "hot pink",cex=0.6)
points(states_turnout_geocoded$lon[states_turnout_geocoded$Group==7&!is.na(states_turnout_geocoded$Group)],
       states_turnout_geocoded$lat[states_turnout_geocoded$Group==7&!is.na(states_turnout_geocoded$Group)],
       pch=19,
       col = "hot pink",cex=0.2)
title(main="Women's Marches around the States")

