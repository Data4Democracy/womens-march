
# read file
turnout_geocoded <- read.csv("Data/CrowdSize/CrowdEstimates_Geocoded.csv")

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
statecolors <- paste0("gray", c(48, 55, 62, 69, 76, 83, 92))
map('state')
for(i in 1:7){
  map('state',
      region = c(states_avg_turnout$StateName[states_avg_turnout$Group == i & !is.na(states_avg_turnout$Group)]),
      col = statecolors[i],
      fill = TRUE,
      add = TRUE)  
}

pointsizes <- c(2.5, 2.2, 1.8, 1.4, 1, 0.6, 0.2)
for(i in 1:7){
  points(states_turnout_geocoded$lon[states_turnout_geocoded$Group == i & !is.na(states_turnout_geocoded$Group)],
         states_turnout_geocoded$lat[states_turnout_geocoded$Group == i & !is.na(states_turnout_geocoded$Group)],
         pch = 19,
         col = "hot pink", cex = pointsizes[i])
}
title(main="Women's Marches around the States")

