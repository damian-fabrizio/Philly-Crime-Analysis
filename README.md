# Philly Crime Spatial Analysis

## Interactive Tableau Visuals
1. Interactive map:
https://public.tableau.com/app/profile/damian.fabrizio/viz/PhiladelphiaCrime_17825128446760/MainMap
<img width="1213" height="682" alt="image" src="https://github.com/user-attachments/assets/b9ee9412-06a8-41c6-8e2d-886cf084d752" />
3. Seasonal Trends
https://public.tableau.com/app/profile/damian.fabrizio/viz/PhillyCrimeSeasonalTrends/SidebySideComparison
<img width="1213" height="673" alt="image" src="https://github.com/user-attachments/assets/a3c6f0f5-eb46-483e-8010-bbdbc7e4f51f" />

---

## Tools/Skills Utilized
- R in Rstudio
- PostgreSQL in Visual Studio Code
- RPostgres and DBI libraries in R
- Tableau for visuals
---
## Process
- Data and shapefile pulled from opencrimephilly.org
- Used Rpostgres and DBI libraries in R to import data files into PostgreSQL
- Cleaned and standardized over 2.5 million rows of data in SQL
- Derived additional tables from main dataset to use in analysis
- Created fully interactive Tableau dashboards where user can filter data by crime, year, and month, and view neighborhood level data that automatically updates according to user's applied filters
