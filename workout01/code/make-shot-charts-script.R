####title: make-shots-charts####
#description: the file is used to plot certain shot charts
#inputs: 
#outputs: 
library(jpeg)
library(grid)
library(ggplot2)
library(dplyr)
setwd("~Desktop/C133/workout01/data")
court_file <- "../images/nba-court.jpg"
court_image <- rasterGrob(readJPEG(court_file),
                          width = unit(1, "npc"),
                          height = unit(1, "npc"))
pdf(file = "../images/stephen-curry-shot-chart.pdf",
    width = 6.5, height = 5)
curry_shot_chart <- ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle("Shot Chart: Stephen Curry (2016 season)") +
  theme_minimal()
curry_shot_chart
dev.off()

pdf(file = "../images/klay-thompson-shot-chart.pdf",
    width = 6.5, height = 5)
klay_shot_chart <- ggplot(data = klay) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle("Shot Chart: Klay Thompson (2016 season)") +
  theme_minimal()
klay_shot_chart
dev.off()

pdf(file = "../images/kevin-durant-shot-chart.pdf",
    width = 6.5, height = 5)
kevin_shot_chart <- ggplot(data = kevin) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle("Shot Chart: Kevin Durant (2016 season)") +
  theme_minimal()
kevin_shot_chart
dev.off()

pdf(file = "../images/draymond-green-shot-chart.pdf",
    width = 6.5, height = 5)
green_shot_chart <- ggplot(data = green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle("Shot Chart: Draymond Green (2016 season)") +
  theme_minimal()
green_shot_chart
dev.off()

pdf(file = "../images/andre-iguodala-shot-chart.pdf",
    width = 6.5, height = 5)
andre_shot_chart <- ggplot(data = andre) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle("Shot Chart: Andre Iguodala (2016 season)") +
  theme_minimal()
andre_shot_chart
dev.off()

pdf(file = "../images/gsw-shot-chart.pdf",
    width = 8, height = 7)
gsw_shot_chart <- ggplot(data = death_lineup) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag), size = .4) +
  ylim(-50, 420) +
  ggtitle("Shot Chart: Death Lineup (2016 season)") +
  facet_wrap(~name) +
  theme_minimal()
gsw_shot_chart
dev.off()  

png(file = "../images/gsw-shot-chart.png",
    width = 8, height = 7, units = "in", res = 200)
gsw_shot_chart
dev.off() 

death_time_shot <- summarise(group_by(death_lineup, minute),
                             shot_min = sum(shot_made_flag=="shot_yes"))
death_time_shot <- as.data.frame(death_time_shot)
death_time_chart <- ggplot(data = death_time_shot, aes(x = 1:48, y = death_time_shot[,2])) +
  geom_point(col = "#4169e1") +
  geom_smooth(method = "auto") +
  geom_vline(aes(xintercept = 12), col = "#FDB515", linetype = "dotdash") +
  geom_vline(aes(xintercept = 24), col = "#FDB515", linetype = "dotdash") +
  geom_vline(aes(xintercept = 36), col = "#FDB515", linetype = "dotdash") +
  geom_vline(aes(xintercept = 48), col = "#FDB515", linetype = "dotdash") +
  xlab("minute") +
  ylab("shot made")+
  ggtitle("Shot made by Death Lineup by minute") +
  theme_bw()

png(file = "../images/gsw-time-chart.png",
    width = 8, height = 7, units = "in", res = 200)
death_time_chart
dev.off() 

