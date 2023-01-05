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

rows = function(tab) lapply(
  seq_len(nrow(tab)),
  function(i) unclass(tab[i,,drop=F])
)


for(row in rows(bigballR::teamids)) {
	if (row$Season == '2021-22') {
		team_roster <- get_team_roster(team.id = row$ID[[1]], season = row$Season[[1]])
		team_roster$Team_ID <- row$ID
		team_roster$Team_Name <- row$Team
		team_roster$Season <- row$Season
		print(row$Team)
		write.csv(team_roster, str_glue("/Users/davidkawashima/Projects/CBK_Prediction/data/2021_22_cleaned/D1/rosters/{row$ID}.csv"), row.names = TRUE)
	}
}

# 5149646 missed game