####title: make-shots-data####
#description: the file is used to prepare data used in visualization
#inputs: raw data files of players
#outputs: an assembled table and summaries
setwd("~/Desktop/C133/workout01/data")
curry <- read.csv("stephen-curry.csv")
klay <- read.csv("klay-thompson.csv")
kevin <- read.csv("kevin-durant.csv")
green <- read.csv("draymond-green.csv")
andre <- read.csv("andre-iguodala.csv")
curry$name <- "Stephen Curry"
klay$name <- "Klay Thompson"
kevin$name <- "Kevin Durant"
green$name <- "Draymond Green"
andre$name <- "Andre Iguodala"
curry$shot_made_flag <- ifelse(curry$shot_made_flag=="y", "shot_yes", "shot_no")
klay$shot_made_flag <- ifelse(klay$shot_made_flag=="y", "shot_yes", "shot_no")
kevin$shot_made_flag <- ifelse(kevin$shot_made_flag=="y", "shot_yes", "shot_no")
green$shot_made_flag <- ifelse(green$shot_made_flag=="y", "shot_yes", "shot_no")
andre$shot_made_flag <- ifelse(andre$shot_made_flag=="y", "shot_yes", "shot_no")
curry$minute <- curry$period*12 - curry$minutes_remaining
klay$minute <- klay$period*12 - klay$minutes_remaining
kevin$minute <- kevin$period*12 - kevin$minutes_remaining
green$minute <- green$period*12 - green$minutes_remaining
andre$minute <- andre$period*12 - andre$minutes_remaining
sink(file = "../output/stephen-curry-summary.txt")
summary(curry)
sink()
sink(file = "../output/klay-thompson-summary.txt")
summary(klay)
sink()
sink(file = "../output/kevin-durant-summary.txt")
summary(kevin)
sink()
sink(file = "../output/draymond-green-summary.txt")
summary(green)
sink()
sink(file = "../output/andre-iguodala-summary.txt")
summary(andre)
sink()
death_lineup <- rbind(curry, klay, kevin, green, andre)
write.csv(death_lineup, "shots-data.csv")
sink("../output/shots-data-summary.txt")
summary(death_lineup)
sink()