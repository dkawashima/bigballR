#install.packages("devtools", repos = "http://cran.us.r-project.org")
# library("devtools")
#library(bigballR)
#install.packages("rio", repos="http://cran.us.r-project.org")
library(devtools)
#library(rio)
library(dplyr)
library(ggplot2)
library(ggraph)
library(rvest)
library(stringr)
library(tidyr)
# importFrom(XML,readHTMLTable)
# importFrom(ggraph,guide_edge_colourbar)
# importFrom(gtools,combinations)
# importFrom(igraph,graph_from_data_frame)
library(xml2)
library(rvest)

source("all_functions.R")



#duke_roster = get_team_roster(season = "2018-19", team.name = "Duke")
#write.csv(duke_roster, "/Users/davidkawashima/Projects/CBK_Prediction/data/Duke.csv", row.names = TRUE)

#Kentucky_roster = get_team_roster(season = "2018-19", team.name = "Kentucky")
#write.csv(Kentucky_roster, "/Users/davidkawashima/Projects/CBK_Prediction/data/Kentucky.csv", row.names = TRUE)

#duke_schedule = get_team_schedule(season = "2018-19", team.name = "Duke")
# write.csv(duke_schedule, "/Users/davidkawashima/Projects/CBK_Prediction/data/Duke_Schedule.csv", row.names = TRUE)
duke_schedule <- read.csv(file = "/Users/davidkawashima/Projects/CBK_Prediction/data/Duke_Schedule.csv")
duke_pbp <- get_play_by_play(duke_schedule$Game_ID)

write.csv(duke_pbp, "/Users/davidkawashima/Projects/CBK_Prediction/data/Duke_Schedule_PBP.csv", row.names = TRUE)
# print(duke_pbp)