# read file and create Groups variable
turnout_geocoded <- read.csv("Data/CrowdSize/CrowdEstimates_Geocoded.csv") %>%
  mutate(Group = 8 - as.numeric(cut(Average, 
                                    breaks = c(0, 10, 100, 200, 300, 400, 500, 10000) * 1000,
                                    right = FALSE))) %>%
  arrange(Group)

svg("output/WomensMarch-WorldMap.svg", 10, 7)
# world map
maps::map('worldHires')

pointsizes <- c(1.8, 1.5, 1, 1.2, 0.9, 0.6, 0.3)
for(i in 1:7){
  points(turnout_geocoded$lon[turnout_geocoded$Group == i & !is.na(turnout_geocoded$Group)],
         turnout_geocoded$lat[turnout_geocoded$Group == i & !is.na(turnout_geocoded$Group)],
         pch = 19,
         col = "hot pink", cex = pointsizes[i])
}
title(main = "Womens' Marches around the World")
dev.off()
