USE berlin_demographics;
#Hypothesis 1:  Among Berlin citizens, a higher percentage of Germans than foreigners are divorced.

#SELECT german, sum(number_of_citizens) as divorced_citizens, round((sum(number_of_citizens)/SUM(sum(number_of_citizens)) over()) *100, 2) as percentage

SELECT SUM(number_of_citizens) AS total_citizens
FROM berlin_demographics
WHERE marital_status = "Divorced";


# RETRIEVE ALL CITIZENS WHO DIVORCED BY NATIONALITY.
SELECT german, SUM(number_of_citizens) AS total_citizens_divorced
FROM berlin_demographics
WHERE marital_status = "Divorced"
GROUP BY german;

# RETRIEVE TOTAL POPULATION BY NATIONALITY
SELECT german, SUM(number_of_citizens) AS total_population
FROM berlin_demographics
GROUP BY german;

# CALCULATE percentage_of_divorced OF total_population
# percentage_of_divorced = population_divorced * 100 / SUM(number_of_citizens)
# CACLULATE THE PERCENTAGE of divorced REGARDLESS OF NATIONALITY
SELECT 
  german, 
  SUM(number_of_citizens) AS divorced_citizens, 
  ROUND(
    100.0 * SUM(number_of_citizens) / SUM(SUM(number_of_citizens)) OVER (), 
    2
  ) AS percentage_of_divorced
FROM berlin_demographics
WHERE marital_status = 'Divorced'
GROUP BY german;
SELECT
  german,
  SUM(CASE WHEN marital_status = 'Divorced' THEN number_of_citizens ELSE 0 END) AS divorced_citizens,
  SUM(number_of_citizens) AS total_population,
  ROUND(
    100.0 * SUM(CASE WHEN marital_status = 'Divorced' THEN number_of_citizens ELSE 0 END) 
    / SUM(number_of_citizens),
    2
  ) AS percentage_divorced
FROM berlin_demographics
GROUP BY german;

#Hypothesis 2: The percentage of citizens aged 65 or over is higher for Germans than for foreigners of all ages.
SELECT *
FROM berlin_demographics;
# Code to change column names.
# ALTER TABLE table_name
# CHANGE old_column_name new_column_name datatype;
# Hypothesis 2: Among Berlin citizens aged 65 or older, a higher percentage is German.
# RETRIEVE ALL CITIZENS AGED 65 OR OLDER REGARDLESS OF NATIONALITY.
SELECT SUM(number_of_citizens) AS total_citizens_65_older
FROM berlin_demographics
WHERE age_group = "65 or older";
# RETRIEVE ALL CITIZENS AGED 65 OR OLDER BY NATIONALITY.
SELECT german, SUM(number_of_citizens) AS total_citizens_65_older
FROM berlin_demographics
WHERE age_group = "65 or older"
GROUP BY german;
# RETRIEVE TOTAL POPULATION BY NATIONALITY
SELECT german, SUM(number_of_citizens) AS total_population
FROM berlin_demographics
GROUP BY german;
# CALCULATE percentage_of_65_older OF total_population
# percentage_of_65_older = population_65_older * 100 / SUM(number_of_citizens)
# CACLULATE THE PERCENTAGE OVER 65 REGARDLESS OF NATIONALITY
SELECT SUM(number_of_citizens) * 100 / SUM(total_population) AS percentage_of_65_older
FROM berlin_demographics
WHERE age_group = "65 or older";
# RETRIEVE HYPOTHESIS COMPLETE
SELECT german,
    SUM(
        CASE
            WHEN age_group = "65 or older" THEN number_of_citizens
        END ) AS population_65_older,
    SUM(number_of_citizens) AS total_population,
    (
        SUM(
            CASE
                WHEN age_group = "65 or older" THEN number_of_citizens
            END
        ) * 100.0 / SUM(number_of_citizens)
    ) AS percentage_of_65_older
FROM berlin_demographics
GROUP BY german;
