# Berlin Demographics

## Introduction

This project analyzes demographic data from Berlin, focusing on nationality, age, and marital status. The objective is to support informed budget planning for the Senate Department for Finance of Berlin. By understanding the composition and needs of different demographic groups, resources can be allocated more effectively across social services.

## Data

The dataset contains records of residents officially registered in Berlin as their primary place of residence. It was published in February 2025 by the Berlin-Brandenburg Statistical Office.

**Main Challenges:**
- Handling missing or placeholder values (e.g., “–” replaced by 0)
- Translating German strings into English for analysis
- Standardizing German-style number formatting (e.g., dots as thousand separators)
- Pivoting the dataset into long format for ease of analysis

**Strengths:**
- Official government source  
- Rich information on marital status, age group, and nationality

**Weaknesses:**
- Some inconsistent formatting due to regional settings  
- Age group aggregation may obscure finer trends

## Research Questions & Conclusions

### 1. Is the divorce rate higher among Germans than among foreigners?

**Conclusion:** ✅ Hypothesis confirmed  
- **Divorced Germans:** 9%  
- **Divorced Foreigners:** 6%  
This suggests that services such as legal aid and housing support may be more in demand among German citizens.

### 2. Is the elderly population (65+) predominantly German?

**Conclusion:** ✅ Hypothesis confirmed  
- **Germans aged 65+:** 22.8%  
- **Foreigners aged 65+:** 7.4%  
This has implications for age-related social services like healthcare and pension planning.

## Methodology

### 1. Data Cleaning
- Replaced non-numeric entries (e.g., “–”) with 0.
- Translated German category names to English.
- Reformatted number values to be compatible with MySQL (removed thousand separators).
- Standardized column names and removed whitespace.

### 2. Reshaping Data
- Used `melt()` function in Python to convert the wide-format dataset into long-format.
- Added a Boolean column indicating whether a row refers to German or non-German citizens.

### 3. SQL Analysis
- Imported cleaned CSV into MySQL Workbench.
- Calculated percentages using queries with computed columns.
- Visualized key statistics using pie charts and bar graphs in Google Sheets.

## Conclusions

- **Higher Divorce Rate Among Germans:** Social services for legal aid and counseling may require larger allocations for predominantly German districts.
- **Aging Population Is Mostly German:** Healthcare and elderly care services should be prioritized for the German population, while integration and employment initiatives can be focused on younger foreign residents.

## Further Questions

- Are there district-level differences in divorce or age structure?
- What is the gender distribution within each nationality and marital status?
- How do employment and income levels vary across these demographic groups?

## Project Files
# HIER BRAUCHE ICH DIE ECHTE LINKS NOTEBOOK UND CLEANED DATA AUS DEINER REPO
- 📘 Notebook: [`berlin_demographics.ipynb`](https://github.com/YOUR_USERNAME/YOUR_REPO/blob/main/berlin_demographics.ipynb)  
- 📄 Cleaned Data: [`berlin_demographics_unmelted.csv`](https://github.com/YOUR_USERNAME/YOUR_REPO/blob/main/berlin_demographics_unmelted.csv)  
- 🖥️ Slides: [Google Slides Presentation](https://docs.google.com/presentation/d/1yK2kFr0HJJ8_WqTv6MX6tM49U1QwiIgM1xMhfcrwguk/edit?usp=sharing)

## Data Source

- Berlin-Brandenburg Statistical Office (Published: 02/2025)
