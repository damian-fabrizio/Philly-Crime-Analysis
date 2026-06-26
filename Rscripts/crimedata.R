library(tidyverse)
library(DBI)
library(RPostgres)

# load in records 2006-2026
crime06 <- read_csv("initial_data/incidents_2006.csv")
crime07 <- read_csv("initial_data/incidents_2007.csv")
crime08 <- read_csv("initial_data/incidents_2008.csv")
crime09 <- read_csv("initial_data/incidents_2009.csv")
crime10 <- read_csv("initial_data/incidents_2010.csv")
crime11 <- read_csv("initial_data/incidents_2011.csv")
crime12 <- read_csv("initial_data/incidents_2012.csv")
crime13 <- read_csv("initial_data/incidents_2013.csv")
crime14 <- read_csv("initial_data/incidents_2014.csv")
crime15 <- read_csv("initial_data/incidents_2015.csv")
crime16 <- read_csv("initial_data/incidents_2016.csv")
crime17 <- read_csv("initial_data/incidents_2017.csv")
crime18 <- read_csv("initial_data/incidents_2018.csv")
crime19 <- read_csv("initial_data/incidents_2019.csv")
crime20 <- read_csv("initial_data/incidents_2020.csv")
crime21 <- read_csv("initial_data/incidents_2021.csv")
crime22 <- read_csv("initial_data/incidents_2022.csv")
crime23 <- read_csv("initial_data/incidents_2023.csv")
crime24 <- read_csv("initial_data/incidents_2024.csv")
crime25 <- read_csv("initial_data/incidents_2025.csv")
crime26 <- read_csv("initial_data/incidents_2026.csv")

connection <- dbConnect(
  
  Postgres(),
  dbname = "phila_crime",
  port = "5432",
  user = "postgres",
  password = Sys.getenv("postgres_pass")
  
)

# write each table to postgres DB
dbWriteTable(connection, "crime06", crime06, overwrite = TRUE)
dbWriteTable(connection, "crime07", crime07, overwrite = TRUE)
dbWriteTable(connection, "crime08", crime08, overwrite = TRUE)
dbWriteTable(connection, "crime09", crime09, overwrite = TRUE)
dbWriteTable(connection, "crime10", crime10, overwrite = TRUE)
dbWriteTable(connection, "crime11", crime11, overwrite = TRUE)
dbWriteTable(connection, "crime12", crime12, overwrite = TRUE)
dbWriteTable(connection, "crime13", crime13, overwrite = TRUE)
dbWriteTable(connection, "crime14", crime14, overwrite = TRUE)
dbWriteTable(connection, "crime15", crime15, overwrite = TRUE)
dbWriteTable(connection, "crime16", crime16, overwrite = TRUE)
dbWriteTable(connection, "crime17", crime17, overwrite = TRUE)
dbWriteTable(connection, "crime18", crime18, overwrite = TRUE)
dbWriteTable(connection, "crime19", crime19, overwrite = TRUE)
dbWriteTable(connection, "crime20", crime20, overwrite = TRUE)
dbWriteTable(connection, "crime21", crime21, overwrite = TRUE)
dbWriteTable(connection, "crime22", crime22, overwrite = TRUE)
dbWriteTable(connection, "crime23", crime23, overwrite = TRUE)
dbWriteTable(connection, "crime24", crime24, overwrite = TRUE)
dbWriteTable(connection, "crime25", crime25, overwrite = TRUE)
dbWriteTable(connection, "crime26", crime26, overwrite = TRUE)


# bring finished postgres tables back into R/project folder
all_crime <- dbReadTable(connection, "all_crime")
write_csv(all_crime, "final_data/all_crime.csv")

crime_by_year <- dbReadTable(connection, "crime_by_year")
write_csv(crime_by_year, "final_data/crime_by_year.csv")

crime_by_month <- dbReadTable(connection, "crime_by_month")
write_csv(crime_by_month, "final_data/crime_by_month.csv")

crime_pct_share <- dbReadTable(connection, "crime_pct_share")
write_csv(crime_pct_share, "final_data/crime_pct_share.csv")