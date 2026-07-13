# Philadelphia Crime Spatial Analysis

End to end spatial analysis of the past 20 years of crime in the city of Philadelphia, turning raw data into interactive insights

## Interactive Tableau Visuals
1. Interactive and filterable citywide map:
https://public.tableau.com/app/profile/damian.fabrizio/viz/PhiladelphiaCrime_17825128446760/MainMap
<img width="650" height="366" alt="image" src="https://github.com/user-attachments/assets/b9ee9412-06a8-41c6-8e2d-886cf084d752" />

2. Side by side seasonal comparison for key crime types
https://public.tableau.com/app/profile/damian.fabrizio/viz/PhillyCrimeSeasonalTrends/SidebySideComparison
<img width="650" height="366" alt="image" src="https://github.com/user-attachments/assets/a3c6f0f5-eb46-483e-8010-bbdbc7e4f51f" />

---

## Findings

**Steady decline from 2006-2025**

Since 2006:
- Unarmed Robbery - Down 60.81% 
- Burglary - Down 60.76% 
- Sexual Assault/Rape - Down 42.06% 
- DUI - Down 82.43%
- Drug Activity - Down 81.70%
- Vandalism/Criminal Mischief - Down 46.52% 

**Categories with sudden and significant spikes**
Armed Robbery:
- Experienced 62.85% decline from 2006-2020, then sudden 58.67% increase in 2021-2022 before falling to all time low by 2025
Homicide:
- Stagnant from 2006-2019 before a 59.14% spike from 2019 to 2021, followed by a sharp 63.01% drop from 2021-2025
Theft:
- Stagnant from 2006-2020, 44.54% increase in occurrences from 2020-2022 and maintained high level of instances since
Motor Vehicle Theft:
- Largely consistent with minor spikes in 2010-2011, maintained consitent annual lows from 2014-2020, before dramatic and unprecedented 764% increase from 2020 to 2023 peak since seeing a slight decline but still very high volume compared to pre 2023 numbers. Largely attributed to the 2022-2023 "Kia Boys" trend where manufacturing flaws in common vehicles such as Kias were exploited and shared across social media

**Generally stagnant categories**
- Aggravated Assault
- Assault
- Arson


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
