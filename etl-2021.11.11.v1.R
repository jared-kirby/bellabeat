rm(list = ls())
library(pillar)
library(plyr)
library(dplyr)
library(lubridate)
library(rlist)
library(stringr)
library(ggplot2)


#Create a list of all Fitbit files to import for analysis
fitbit_file_dir <<- "D:/Kirby/Documents/R/data/Fitabase Data 4.12.16-5.12.16"
filenames <- list.files(fitbit_file_dir, pattern="*.csv")

#Loop through filenames and read datafiles into new dataframes
for (i in filenames) {
  filename <- i
  file_dir.file_name <- paste(fitbit_file_dir, filename, sep="/")
  
  dfName <- paste0("df_",filename)
  print(dfName)
  assign(dfName, read.csv(file_dir.file_name))
  
}

df_dailyActivity_merged.csv$ActivityDate <- mdy(df_dailyActivity_merged.csv$ActivityDate)

df_dailyCalories_merged.csv$ActivityDay <- mdy(df_dailyCalories_merged.csv$ActivityDay)
names(df_dailyCalories_merged.csv)[2] <- "Activity_Date"

df_dailyIntensities_merged.csv$ActivityDay <- mdy(df_dailyIntensities_merged.csv$ActivityDay)
names(df_dailyIntensities_merged.csv)[2] <- "Activity_Date"

df_dailySteps_merged.csv$ActivityDay <- mdy(df_dailySteps_merged.csv$ActivityDay)
names(df_dailySteps_merged.csv)[2] <- "Activity_Date"

names(df_heartrate_seconds_merged.csv)[2] <- "Activity_DateTime"
df_heartrate_seconds_merged.csv$Activity_DateTime <- mdy_hms(df_heartrate_seconds_merged.csv$Activity_DateTime)
df_heartrate_seconds_merged.csv$Activity_Date <- as.Date(df_heartrate_seconds_merged.csv$Activity_DateTime)

names(df_hourlyCalories_merged.csv)[2] <- "Activity_Hour"
df_hourlyCalories_merged.csv$Activity_Hour <- mdy_hms(df_hourlyCalories_merged.csv$Activity_Hour)
df_hourlyCalories_merged.csv$Activity_Date <- as.Date(df_hourlyCalories_merged.csv$Activity_Hour)

names(df_hourlyIntensities_merged.csv)[2] <- "Activity_Hour"
df_hourlyIntensities_merged.csv$Activity_Hour <- mdy_hms(df_hourlyIntensities_merged.csv$Activity_Hour)
df_hourlyIntensities_merged.csv$Activity_Date <- as.Date(df_hourlyIntensities_merged.csv$Activity_Hour)

names(df_hourlySteps_merged.csv)[2] <- "Activity_Hour"
df_hourlySteps_merged.csv$Activity_Hour <- mdy_hms(df_hourlySteps_merged.csv$Activity_Hour)
df_hourlySteps_merged.csv$Activity_Date <- as.Date(df_hourlySteps_merged.csv$Activity_Hour)

names(df_minuteCaloriesNarrow_merged.csv)[2] <- "Activity_Minute"
df_minuteCaloriesNarrow_merged.csv$Activity_Minute <- mdy_hms(df_minuteCaloriesNarrow_merged.csv$Activity_Minute)
df_minuteCaloriesNarrow_merged.csv$Activity_Date <- as.Date(df_minuteCaloriesNarrow_merged.csv$Activity_Minute)

names(df_minuteCaloriesWide_merged.csv)[2] <- "Activity_Hour"
df_minuteCaloriesWide_merged.csv$Activity_Hour <- mdy_hms(df_minuteCaloriesWide_merged.csv$Activity_Hour)
df_minuteCaloriesWide_merged.csv$Activity_Date <- as.Date(df_minuteCaloriesWide_merged.csv$Activity_Hour)
fieldnames <- colnames(df_minuteCaloriesWide_merged.csv)[grepl('Calorie',colnames(df_minuteCaloriesWide_merged.csv))]
for (i in fieldnames) {
  oldname <- i
  minute_num <- str_sub(i, 9, 10)
  names(df_minuteCaloriesWide_merged.csv)[names(df_minuteCaloriesWide_merged.csv) == oldname] <- paste0("Cals_Min_", minute_num)
}

names(df_minuteIntensitiesNarrow_merged.csv)[2] <- "Activity_Minute"
df_minuteIntensitiesNarrow_merged.csv$Activity_Minute <- mdy_hms(df_minuteIntensitiesNarrow_merged.csv$Activity_Minute)
df_minuteIntensitiesNarrow_merged.csv$Activity_Date <- as.Date(df_minuteIntensitiesNarrow_merged.csv$Activity_Minute)


names(df_minuteIntensitiesWide_merged.csv)[2] <- "Activity_Hour"
df_minuteIntensitiesWide_merged.csv$Activity_Hour <- mdy_hms(df_minuteIntensitiesWide_merged.csv$Activity_Hour)
df_minuteIntensitiesWide_merged.csv$Activity_Date <- as.Date(df_minuteIntensitiesWide_merged.csv$Activity_Hour)
fieldnames <- colnames(df_minuteIntensitiesWide_merged.csv)[grepl('Intensity',colnames(df_minuteIntensitiesWide_merged.csv))]
for (i in fieldnames) {
  oldname <- i
  minute_num <- str_sub(i, 10, 11)
  names(df_minuteIntensitiesWide_merged.csv)[names(df_minuteIntensitiesWide_merged.csv) == oldname] <- paste0("Int_Min_", minute_num)
}

names(df_minuteMETsNarrow_merged.csv)[2] <- "Activity_Minute"
df_minuteMETsNarrow_merged.csv$Activity_Minute <- mdy_hms(df_minuteMETsNarrow_merged.csv$Activity_Minute)
df_minuteMETsNarrow_merged.csv$Activity_Date <- as.Date(df_minuteMETsNarrow_merged.csv$Activity_Minute)

names(df_minuteSleep_merged.csv)[2] <- "Activity_Minute"
df_minuteSleep_merged.csv$Activity_Minute <- mdy_hms(df_minuteSleep_merged.csv$Activity_Minute)
df_minuteSleep_merged.csv$Activity_Date <- as.Date(df_minuteSleep_merged.csv$Activity_Minute)

names(df_minuteStepsNarrow_merged.csv)[2] <- "Activity_Minute"
df_minuteStepsNarrow_merged.csv$Activity_Minute <- mdy_hms(df_minuteStepsNarrow_merged.csv$Activity_Minute)
df_minuteStepsNarrow_merged.csv$Activity_Date <- as.Date(df_minuteStepsNarrow_merged.csv$Activity_Minute)

names(df_minuteStepsWide_merged.csv)[2] <- "Activity_Hour"
df_minuteStepsWide_merged.csv$Activity_Hour <- mdy_hms(df_minuteStepsWide_merged.csv$Activity_Hour)
df_minuteStepsWide_merged.csv$Activity_Date <- as.Date(df_minuteStepsWide_merged.csv$Activity_Hour)
fieldnames <- colnames(df_minuteStepsWide_merged.csv)[grepl('Steps',colnames(df_minuteStepsWide_merged.csv))]
for (i in fieldnames) {
  oldname <- i
  minute_num <- str_sub(i, 6, 7)
  names(df_minuteStepsWide_merged.csv)[names(df_minuteStepsWide_merged.csv) == oldname] <- paste0("Steps_Min_", minute_num)
}

df_sleepDay_merged.csv$SleepDay <- as.Date(mdy_hms(df_sleepDay_merged.csv$SleepDay))
names(df_sleepDay_merged.csv)[2] <- "Sleep_Date"

names(df_weightLogInfo_merged.csv)[2] <- "Recorded_DateTime"
df_weightLogInfo_merged.csv$Recorded_DateTime <- mdy_hms(df_weightLogInfo_merged.csv$Recorded_DateTime)
df_weightLogInfo_merged.csv$Recorded_Date <- as.Date(df_weightLogInfo_merged.csv$Recorded_DateTime)


