library(devtools)
#library(rio)
library(dplyr)
library(ggplot2)
library(ggraph)
library(rvest)
library(stringr)
library(tidyr)
library(xml2)
library(rvest)

source("all_functions.R")


# 21_22_date_list = seq(as.Date("2021-05-01"), as.Date("2022-05-01"), by="days")
date_list_21_22 <- head(seq(as.Date("2021-11-17"), as.Date("2021-11-18"), by="days"), 2)
for (day in as.character(format(date_list_21_22, "%m/%d/%Y"))) {
	
	#day_str <- format(day, "%m/%d/%Y")
	if (FALSE) { 
	date_games <- tryCatch({
 		return(get_date_games(date = day))
	}, error = function(e) {
	 	message(paste(day, "| 0 games found"))
	 	return(data.frame(matrix(ncol = 5, nrow = 0)))
	})
	}

	date_games <- get_date_games(date = day)
	#print (date_games)
	if (nrow(date_games) > 0) {
		date_pbp <- get_play_by_play(date_games$GameID)
		possesions_pbp <- get_possessions(play_by_play_data = date_pbp)
		print (head(possesions_pbp, 10))
		day_csv_file_name <- str_replace_all(day, '/', '_')
		#dir.create(file.path(mainDir, subDir))
		#setwd(file.path(mainDir, subDir))
		# write.csv(date_pbp, str_glue("/Users/davidkawashima/Projects/CBK_Prediction/data/2021_22/D1/{day_csv_file_name}.csv"), row.names = TRUE)
		write.csv(possesions_pbp, str_glue("/Users/davidkawashima/Projects/CBK_Prediction/data/2021_22_cleaned/D1/possessions/{day_csv_file_name}.csv"), row.names = TRUE)
	}
}

# 5149646 missed game