-- standardize crimes that will be included in analysis
-- ignore crime desc that are already titled adequately
CREATE TABLE included_crimes(
    text_general_code TEXT PRIMARY KEY,
    clean_crime_desc TEXT NOT NULL
);

INSERT INTO included_crimes(text_general_code, clean_crime_desc)
VALUES
    ('DRIVING UNDER THE INFLUENCE', 'DUI'),
    ('Aggravated Assault No Firearm', 'Aggravated Assault'),
    ('Other Assaults', 'Assault'),
    ('Burglary Non-Residential', 'Burglary'),
    ('Homicide - Justifiable', 'Homicide'),
    ('Thefts', 'Theft'),
    ('Burglary Residential', 'Burglary'),
    ('Homicide - Criminal', 'Homicide'),
    ('Robbery Firearm', 'Armed Robbery'),
    ('Rape', 'Sexual Assault/Rape'),
    ('Homicide - Gross Negligence', 'Homicide'),
    ('Robbery No Firearm', 'Unarmed Robbery'),
    ('Other Sex Offenses (Not Commercialized)', 'Sexual Assault/Rape'),
    ('Narcotic / Drug Law Violations', 'Drug Activity'),
    ('Aggravated Assault Firearm', 'Aggravated Assault'),
    ('Theft from Vehicle', 'Theft');

-- exclude crimes that are vague, petty, insignificant
CREATE TABLE excluded_crimes (
    text_general_code TEXT PRIMARY KEY
);

INSERT INTO excluded_crimes (text_general_code)
VALUES 
    ('Public Drunkenness'),
    ('Liquor Law Violations'),
    ('Prostitution and Commercialized Vice'),
    ('Offenses Against Family and Children'),
    ('Forgery and Counterfeiting'),
    ('Fraud'),
    ('Receiving Stolen Property'),
    ('Weapon Violations'),
    ('All Other Offenses'),
    ('Embezzlement'),
    ('Vagrancy/Loitering'),
    ('Gambling Violations'),
    ('Disorderly Conduct');

-- create mass view of all data 2006-2026
-- clean each year's table individually
CREATE OR REPLACE VIEW cleaned_final_data AS
SELECT 
    c06.objectid,
    2006 AS year,
    c06.dispatch_date,
    c06.location_block,
    COALESCE(inc.clean_crime_desc, c06.text_general_code) AS crime_desc,
    ROUND(lat::numeric, 5) AS latitude,
    ROUND(lng::numeric, 5) AS longitude
FROM crime06 c06
LEFT JOIN included_crimes inc
    ON c06.text_general_code = inc.text_general_code
WHERE c06.lat IS NOT NULL
    AND c06.lng IS NOT NULL
AND NOT EXISTS (
    SELECT 1
    FROM excluded_crimes exc
    WHERE exc.text_general_code = c06.text_general_code
    )

UNION ALL

SELECT 
    c07.objectid,
    2007 AS year,
    c07.dispatch_date,
    c07.location_block,
    COALESCE(inc.clean_crime_desc, c07.text_general_code) AS crime_desc,
    ROUND(lat::numeric, 5) AS latitude,
    ROUND(lng::numeric, 5) AS longitude
FROM crime07 c07
LEFT JOIN included_crimes inc
    ON c07.text_general_code = inc.text_general_code
WHERE c07.lat IS NOT NULL
    AND c07.lng IS NOT NULL
AND NOT EXISTS (
    SELECT 1
    FROM excluded_crimes exc
    WHERE exc.text_general_code = c07.text_general_code
    )

UNION ALL

SELECT 
    c08.objectid,
    2008 AS year,
    c08.dispatch_date,
    c08.location_block,
    COALESCE(inc.clean_crime_desc, c08.text_general_code) AS crime_desc,
    ROUND(lat::numeric, 5) AS latitude,
    ROUND(lng::numeric, 5) AS longitude
FROM crime08 c08
LEFT JOIN included_crimes inc
    ON c08.text_general_code = inc.text_general_code
WHERE c08.lat IS NOT NULL
    AND c08.lng IS NOT NULL
AND NOT EXISTS (
    SELECT 1
    FROM excluded_crimes exc
    WHERE exc.text_general_code = c08.text_general_code
    )

UNION ALL

SELECT 
    c09.objectid,
    2009 AS year,
    c09.dispatch_date,
    c09.location_block,
    COALESCE(inc.clean_crime_desc, c09.text_general_code) AS crime_desc,
    ROUND(lat::numeric, 5) AS latitude,
    ROUND(lng::numeric, 5) AS longitude
FROM crime09 c09
LEFT JOIN included_crimes inc
    ON c09.text_general_code = inc.text_general_code
WHERE c09.lat IS NOT NULL
    AND c09.lng IS NOT NULL
AND NOT EXISTS (
    SELECT 1
    FROM excluded_crimes exc
    WHERE exc.text_general_code = c09.text_general_code
    )

UNION ALL

SELECT 
    c10.objectid,
    2010 AS year,
    c10.dispatch_date,
    c10.location_block,
    COALESCE(inc.clean_crime_desc, c10.text_general_code) AS crime_desc,
    ROUND(lat::numeric, 5) AS latitude,
    ROUND(lng::numeric, 5) AS longitude
FROM crime10 c10
LEFT JOIN included_crimes inc
    ON c10.text_general_code = inc.text_general_code
WHERE c10.lat IS NOT NULL
    AND c10.lng IS NOT NULL
AND NOT EXISTS (
    SELECT 1
    FROM excluded_crimes exc
    WHERE exc.text_general_code = c10.text_general_code
    )

UNION ALL

SELECT 
    c11.objectid,
    2011 AS year,
    c11.dispatch_date,
    c11.location_block,
    COALESCE(inc.clean_crime_desc, c11.text_general_code) AS crime_desc,
    ROUND(lat::numeric, 5) AS latitude,
    ROUND(lng::numeric, 5) AS longitude
FROM crime11 c11
LEFT JOIN included_crimes inc
    ON c11.text_general_code = inc.text_general_code
WHERE c11.lat IS NOT NULL
    AND c11.lng IS NOT NULL
AND NOT EXISTS (
    SELECT 1
    FROM excluded_crimes exc
    WHERE exc.text_general_code = c11.text_general_code
    )

UNION ALL

SELECT 
    c12.objectid,
    2012 AS year,
    c12.dispatch_date,
    c12.location_block,
    COALESCE(inc.clean_crime_desc, c12.text_general_code) AS crime_desc,
    ROUND(lat::numeric, 5) AS latitude,
    ROUND(lng::numeric, 5) AS longitude
FROM crime12 c12
LEFT JOIN included_crimes inc
    ON c12.text_general_code = inc.text_general_code
WHERE c12.lat IS NOT NULL
    AND c12.lng IS NOT NULL
AND NOT EXISTS (
    SELECT 1
    FROM excluded_crimes exc
    WHERE exc.text_general_code = c12.text_general_code
    )

UNION ALL

SELECT 
    c13.objectid,
    2013 AS year,
    c13.dispatch_date,
    c13.location_block,
    COALESCE(inc.clean_crime_desc, c13.text_general_code) AS crime_desc,
    ROUND(lat::numeric, 5) AS latitude,
    ROUND(lng::numeric, 5) AS longitude
FROM crime13 c13
LEFT JOIN included_crimes inc
    ON c13.text_general_code = inc.text_general_code
WHERE c13.lat IS NOT NULL
    AND c13.lng IS NOT NULL
AND NOT EXISTS (
    SELECT 1
    FROM excluded_crimes exc
    WHERE exc.text_general_code = c13.text_general_code
    )

UNION ALL 

SELECT 
    c14.objectid,
    2014 AS year,
    c14.dispatch_date,
    c14.location_block,
    COALESCE(inc.clean_crime_desc, c14.text_general_code) AS crime_desc,
    ROUND(lat::numeric, 5) AS latitude,
    ROUND(lng::numeric, 5) AS longitude
FROM crime14 c14
LEFT JOIN included_crimes inc
    ON c14.text_general_code = inc.text_general_code
WHERE c14.lat IS NOT NULL
    AND c14.lng IS NOT NULL
AND NOT EXISTS (
    SELECT 1
    FROM excluded_crimes exc
    WHERE exc.text_general_code = c14.text_general_code
    )

UNION ALL

SELECT 
    c15.objectid,
    2015 AS year,
    c15.dispatch_date,
    c15.location_block,
    COALESCE(inc.clean_crime_desc, c15.text_general_code) AS crime_desc,
    ROUND(lat::numeric, 5) AS latitude,
    ROUND(lng::numeric, 5) AS longitude
FROM crime15 c15
LEFT JOIN included_crimes inc
    ON c15.text_general_code = inc.text_general_code
WHERE c15.lat IS NOT NULL
    AND c15.lng IS NOT NULL
AND NOT EXISTS (
    SELECT 1
    FROM excluded_crimes exc
    WHERE exc.text_general_code = c15.text_general_code
    )

UNION ALL

SELECT 
    c16.objectid,
    2016 AS year,
    c16.dispatch_date,
    c16.location_block,
    COALESCE(inc.clean_crime_desc, c16.text_general_code) AS crime_desc,
    ROUND(lat::numeric, 5) AS latitude,
    ROUND(lng::numeric, 5) AS longitude
FROM crime16 c16
LEFT JOIN included_crimes inc
    ON c16.text_general_code = inc.text_general_code
WHERE c16.lat IS NOT NULL
    AND c16.lng IS NOT NULL
AND NOT EXISTS (
    SELECT 1
    FROM excluded_crimes exc
    WHERE exc.text_general_code = c16.text_general_code
    )

UNION ALL

SELECT 
    c17.objectid,
    2017 AS year,
    c17.dispatch_date,
    c17.location_block,
    COALESCE(inc.clean_crime_desc, c17.text_general_code) AS crime_desc,
    ROUND(lat::numeric, 5) AS latitude,
    ROUND(lng::numeric, 5) AS longitude
FROM crime17 c17
LEFT JOIN included_crimes inc
    ON c17.text_general_code = inc.text_general_code
WHERE c17.lat IS NOT NULL
    AND c17.lng IS NOT NULL
AND NOT EXISTS (
    SELECT 1
    FROM excluded_crimes exc
    WHERE exc.text_general_code = c17.text_general_code
    )

UNION ALL

SELECT 
    c18.objectid,
    2018 AS year,
    c18.dispatch_date,
    c18.location_block,
    COALESCE(inc.clean_crime_desc, c18.text_general_code) AS crime_desc,
    ROUND(lat::numeric, 5) AS latitude,
    ROUND(lng::numeric, 5) AS longitude
FROM crime18 c18
LEFT JOIN included_crimes inc
    ON c18.text_general_code = inc.text_general_code
WHERE c18.lat IS NOT NULL
    AND c18.lng IS NOT NULL
AND NOT EXISTS (
    SELECT 1
    FROM excluded_crimes exc
    WHERE exc.text_general_code = c18.text_general_code
    )

UNION ALL

SELECT 
    c19.objectid,
    2019 AS year,
    c19.dispatch_date,
    c19.location_block,
    COALESCE(inc.clean_crime_desc, c19.text_general_code) AS crime_desc,
    ROUND(lat::numeric, 5) AS latitude,
    ROUND(lng::numeric, 5) AS longitude
FROM crime19 c19
LEFT JOIN included_crimes inc
    ON c19.text_general_code = inc.text_general_code
WHERE c19.lat IS NOT NULL
    AND c19.lng IS NOT NULL
AND NOT EXISTS (
    SELECT 1
    FROM excluded_crimes exc
    WHERE exc.text_general_code = c19.text_general_code
    )

UNION ALL

SELECT 
    c20.objectid,
    2020 AS year,
    c20.dispatch_date,
    c20.location_block,
    COALESCE(inc.clean_crime_desc, c20.text_general_code) AS crime_desc,
    ROUND(lat::numeric, 5) AS latitude,
    ROUND(lng::numeric, 5) AS longitude
FROM crime20 c20
LEFT JOIN included_crimes inc
    ON c20.text_general_code = inc.text_general_code
WHERE c20.lat IS NOT NULL
    AND c20.lng IS NOT NULL
AND NOT EXISTS (
    SELECT 1
    FROM excluded_crimes exc
    WHERE exc.text_general_code = c20.text_general_code
    )

UNION ALL

SELECT 
    c21.objectid,
    2021 AS year,
    c21.dispatch_date,
    c21.location_block,
    COALESCE(inc.clean_crime_desc, c21.text_general_code) AS crime_desc,
    ROUND(lat::numeric, 5) AS latitude,
    ROUND(lng::numeric, 5) AS longitude
FROM crime21 c21
LEFT JOIN included_crimes inc
    ON c21.text_general_code = inc.text_general_code
WHERE c21.lat IS NOT NULL
    AND c21.lng IS NOT NULL
AND NOT EXISTS (
    SELECT 1
    FROM excluded_crimes exc
    WHERE exc.text_general_code = c21.text_general_code
    )

UNION ALL

SELECT 
    c22.objectid,
    2022 AS year,
    c22.dispatch_date,
    c22.location_block,
    COALESCE(inc.clean_crime_desc, c22.text_general_code) AS crime_desc,
    ROUND(lat::numeric, 5) AS latitude,
    ROUND(lng::numeric, 5) AS longitude
FROM crime22 c22
LEFT JOIN included_crimes inc
    ON c22.text_general_code = inc.text_general_code
WHERE c22.lat IS NOT NULL
    AND c22.lng IS NOT NULL
AND NOT EXISTS (
    SELECT 1
    FROM excluded_crimes exc
    WHERE exc.text_general_code = c22.text_general_code
    )

UNION ALL

SELECT 
    c23.objectid,
    2023 AS year,
    c23.dispatch_date,
    c23.location_block,
    COALESCE(inc.clean_crime_desc, c23.text_general_code) AS crime_desc,
    ROUND(lat::numeric, 5) AS latitude,
    ROUND(lng::numeric, 5) AS longitude
FROM crime23 c23
LEFT JOIN included_crimes inc
    ON c23.text_general_code = inc.text_general_code
WHERE c23.lat IS NOT NULL
    AND c23.lng IS NOT NULL
AND NOT EXISTS (
    SELECT 1
    FROM excluded_crimes exc
    WHERE exc.text_general_code = c23.text_general_code
    )

UNION ALL

SELECT 
    c24.objectid,
    2024 AS year,
    c24.dispatch_date,
    c24.location_block,
    COALESCE(inc.clean_crime_desc, c24.text_general_code) AS crime_desc,
    ROUND(lat::numeric, 5) AS latitude,
    ROUND(lng::numeric, 5) AS longitude
FROM crime24 c24
LEFT JOIN included_crimes inc
    ON c24.text_general_code = inc.text_general_code
WHERE c24.lat IS NOT NULL
    AND c24.lng IS NOT NULL
AND NOT EXISTS (
    SELECT 1
    FROM excluded_crimes exc
    WHERE exc.text_general_code = c24.text_general_code
    )

UNION ALL

SELECT 
    c25.objectid,
    2025 AS year,
    c25.dispatch_date,
    c25.location_block,
    COALESCE(inc.clean_crime_desc, c25.text_general_code) AS crime_desc,
    ROUND(lat::numeric, 5) AS latitude,
    ROUND(lng::numeric, 5) AS longitude
FROM crime25 c25
LEFT JOIN included_crimes inc
    ON c25.text_general_code = inc.text_general_code
WHERE c25.lat IS NOT NULL
    AND c25.lng IS NOT NULL
AND NOT EXISTS (
    SELECT 1
    FROM excluded_crimes exc
    WHERE exc.text_general_code = c25.text_general_code
    )

UNION ALL

SELECT 
    c26.objectid,
    2026 AS year,
    c26.dispatch_date,
    c26.location_block,
    COALESCE(inc.clean_crime_desc, c26.text_general_code) AS crime_desc,
    ROUND(lat::numeric, 5) AS latitude,
    ROUND(lng::numeric, 5) AS longitude
FROM crime26 c26
LEFT JOIN included_crimes inc
    ON c26.text_general_code = inc.text_general_code
WHERE c26.lat IS NOT NULL
    AND c26.lng IS NOT NULL
AND NOT EXISTS (
    SELECT 1
    FROM excluded_crimes exc
    WHERE exc.text_general_code = c26.text_general_code
    );

-- form table from the view
CREATE TABLE all_crime AS
SELECT * FROM cleaned_final_data;

-- sum of each crime category for each year
CREATE TABLE crime_by_year AS
SELECT year, crime_desc, COUNT(crime_desc) AS frequency
FROM all_crime
GROUP BY crime_desc, year
ORDER BY year, crime_desc;

-- sum of crime category sorted by month for each year 
CREATE TABLE crime_by_month AS
SELECT 
    year,
    TO_CHAR(dispatch_date, 'Month') AS month,
    crime_desc,
    COUNT(crime_desc) AS frequency
FROM all_crime
GROUP BY year, TO_CHAR(dispatch_date, 'Month'), crime_desc
ORDER BY year, crime_desc, TO_CHAR(dispatch_date, 'Month');

-- percentage share of crime per year
CREATE TABLE crime_pct_share AS
SELECT 
    year,
    crime_desc,
    ROUND(
        COUNT(crime_desc) * 100 / SUM(COUNT(*)) OVER (
        PARTITION BY year),2
    ) AS pct_of_total
FROM all_crime
GROUP BY year, crime_desc;


