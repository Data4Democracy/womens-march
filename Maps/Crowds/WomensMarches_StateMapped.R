# turnout by point location, for pink dots
states_turnout_geocoded <- read.csv("Data/CrowdSize/CrowdEstimates_Geocoded.csv")[1:517,] %>%
  mutate(Group = 8 - as.numeric(cut(Average, 
                                    breaks = c(0, 10, 100, 200, 300, 400, 500, 10000) * 1000,
                                    right = FALSE))) %>%
  arrange(Group)


# turnout by state, for choropleth
states_avg_turnout <- read.csv("Data/CrowdSize/CrowdEstimates.csv") %>%
  slice(1:517) %>%
  filter(!is.na(Average)) %>%
  group_by(State) %>%
  summarise(Average = sum(Average)) %>%
  mutate(StateName = state.name[match(State, state.abb)]) %>%
  mutate(Group = 8 - as.numeric(cut(Average, 
                                    breaks = c(0, 10, 100, 200, 300, 400, 500, 10000) * 1000,
                                    right = FALSE))) %>%
  arrange(Group)

svg("output/WomensMarch-StateMap.svg", 8, 5)
# map states shaded as grey, for choropleth
statecolors <- paste0("gray", c(48, 55, 62, 69, 76, 83, 92))
maps::map('state')
for(i in 1:7){
  maps::map('state',
      region = c(states_avg_turnout$StateName[states_avg_turnout$Group == i & !is.na(states_avg_turnout$Group)]),
      col = statecolors[i],
      fill = TRUE,
      add = TRUE)  
}

# add pink points for each state
pointsizes <- c(2.5, 2.2, 1.8, 1.4, 1, 0.6, 0.2)
for(i in 1:7){
  points(states_turnout_geocoded$lon[states_turnout_geocoded$Group == i & !is.na(states_turnout_geocoded$Group)],
         states_turnout_geocoded$lat[states_turnout_geocoded$Group == i & !is.na(states_turnout_geocoded$Group)],
         pch = 19,
         col = "hot pink", cex = pointsizes[i])
}
title(main="Women's Marches around the States")
dev.off()
