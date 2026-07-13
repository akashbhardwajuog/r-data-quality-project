# R Data Quality and Exploratory Analysis 
 
## Objective 
This project develops a reproducible R workflow for importing, cleaning, checking and visualising a public biomedical dataset. 
 
## Skills being developed 
- R/RStudio 
- Data cleaning 
- Missing-data assessment 
- Data-quality checks 
- Statistical visualisation 
- Reproducible reporting 
- Git/GitHub version control 
 
## Project structure 
- `data_raw/`: original downloaded data; not manually edited 
- `data_processed/`: cleaned datasets created using scripts 
- `scripts/`: R scripts for each analysis stage 
- `outputs/figures/`: plots 
- `outputs/tables/`: summary tables 
- `reports/`: final Quarto reports 
- `references/`: dataset and literature references 
 
## Dataset 
The built-in `iris` dataset contains 150 flower observations across three species: 
setosa, versicolor and virginica. Variables include sepal length, sepal width, 
petal length and petal width. 
 
## Initial quality checks 
- No missing values were identified. 
- One duplicated row was detected. 
- The duplicate was retained for this training analysis because its origin cannot 
 be determined from the available dataset documentation. 
 
## Completed analysis 
 
This project uses the built-in `iris` dataset to demonstrate a reproducible R workflow for: 
 
- data inspection and variable-name standardisation; 
- missing-value and duplicate-row checks; 
- descriptive statistics by species; 
- boxplot visualisation; 
- documentation of interpretation and limitations. 
 
## Key findings 
 
- No missing values were identified. 
- One duplicate row was detected and retained because its origin could not be confirmed. 
- Mean sepal length and petal length were lowest in setosa and highest in virginica. 
 
## Report 
 
The rendered Quarto report is available in: 
 
`reports/iris_data_quality_report.html` 

 
## Author 
Akash Bhardwaj   
MSc Precision Medicine candidate, University of Glasgow 
