
# read file
turnout_geocoded <- read.csv("CrowdEstimates_Geocoded.csv")

# map data
library(maps)
library(mapdata)
library(ggplot2)

# world map
map('worldHires')
points(turnout_geocoded$lon,
       turnout_geocoded$lat,
       pch=19,
       col = "hot pink",cex=.3)
title(main="Womens' Marches around the World")

# state map
state_map <- map('state')

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
         ifelse(states_avg_turnout$Average[i]<500000&states_avg_turnout$Average[i]>=250000,2,
                ifelse(states_avg_turnout$Average[i]<250000&states_avg_turnout$Average[i]>=100000,3,
                       ifelse(states_avg_turnout$Average[i]<100000&states_avg_turnout$Average[i]>=50000,4,
                              ifelse(states_avg_turnout$Average[i]<50000&states_avg_turnout$Average[i]>=25000,5,
                                     ifelse(states_avg_turnout$Average[i]<25000&states_avg_turnout$Average[i]>=10000,6,
                                            ifelse(states_avg_turnout$Average[i]<10000,7,0)))))))
}
states_avg_turnout <- states_avg_turnout[order(states_avg_turnout$Group),]

# map states
map('state',region=c(states_avg_turnout$StateName[states_avg_turnout$Group==1]),col=c("gray51"),fill=TRUE,add=TRUE)
map('state',region=c(states_avg_turnout$StateName[states_avg_turnout$Group==2]),col=c("gray58"),fill=TRUE,add=TRUE)
map('state',region=c(states_avg_turnout$StateName[states_avg_turnout$Group==3]),col=c("gray65"),fill=TRUE,add=TRUE)
map('state',region=c(states_avg_turnout$StateName[states_avg_turnout$Group==4]),col=c("gray72"),fill=TRUE,add=TRUE)
map('state',region=c(states_avg_turnout$StateName[states_avg_turnout$Group==5]),col=c("gray79"),fill=TRUE,add=TRUE)
map('state',region=c(states_avg_turnout$StateName[states_avg_turnout$Group==6]),col=c("gray86"),fill=TRUE,add=TRUE)
map('state',region=c(states_avg_turnout$StateName[states_avg_turnout$Group==7]),col=c("gray95"),fill=TRUE,add=TRUE)
points(states_turnout_geocoded$lon,
       states_turnout_geocoded$lat,
       pch=19,
       col = "hot pink",cex=0.35)

