
## Files

**`clean_survey_data.R`**

- reads `data/prim&r18.csv`
- reads `data/valid_responses.txt`
- cleans data:
  + normalizes column names
  + removes unused columns
  + renames column from Q number to descriptive label
  + recodes certain questions as factors
  + recodes certain columns as boolean
  + recodes certain columns as numeric
  + drops rows not found in `valid_responses.txt` (response IDs suggested by Michael Zimmer based on response completeness)
- exports `data/survey_data.rds`

**`survey_data_vis.Rmd`**

- reads `data/survey_data.rds`
- exploratory visualization
- exports 2 likert chart visualizations to `plots/`

**`case_study_analysis.Rmd`**

- reads `data/survey_data.rds`
- cleans data:
  + long form by factor for case study for participant
  + ID, case study #, irb determination, key factor
- exports 11 treeplot visualizations of the case studies by key factor to `plots/`



## Changelog

### 2020-07-26

- Update README.md with description of files and directory layout

### 2020-02-12

Downloaded data again because MZ recieved new submissions.

Michael sent a new list of response IDs that should be considered valid. 

Settings:

- "Download all fields" = True
- "Use choice text"
- "Remove line breaks"
- "Recode seen but unanswered questions as -99"
- "Recode seen but unanswered multi-value fields as 0"
- "Split multi-value fields into columns"

#### case studies: 

- look at rows where personal assessment and institutional assessment do not agree. text response?
- which factors were most associated with each institutional assessment?
- look at the key factor - other text responses
- what are the ethics concerns outside of irb purvue? is there a collective understanding of the boundaries of responsibility for IRBs? how does it intersect with their understanding of pervasive data?