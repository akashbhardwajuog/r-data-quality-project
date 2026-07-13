
  # Project: R Data Quality and Exploratory Analysis 
  # Author: Akash Bhardwaj 
  # Purpose: Import, inspect and visualise the built-in iris dataset 
  
  # Load packages 
  library(tidyverse) 
library(janitor) 
library(skimr) 
library(here) 

# 1. Load dataset 
iris_data <- iris 

# 2. Inspect the first six rows 
head(iris_data) 

# 3. Check data structure 
str(iris_data) 

# 4. Clean variable names 
iris_data <- iris_data %>% 
  clean_names() 

# 5. Check for missing values 
missing_values <- iris_data %>% 
  summarise(across(everything(), ~ sum(is.na(.)))) %>% 
  pivot_longer( 
    cols = everything(), 
    names_to = "variable", 
    values_to = "missing_values" 
  ) 

print(missing_values) 

# 6. Check for duplicated rows 
duplicate_rows <- sum(duplicated(iris_data)) 

print(paste("Number of duplicate rows:", duplicate_rows)) 

# 7. Create summary statistics 
summary_stats <- iris_data %>% 
  group_by(species) %>% 
  summarise( 
    number_of_samples = n(), 
    mean_sepal_length = mean(sepal_length), 
    sd_sepal_length = sd(sepal_length), 
    mean_petal_length = mean(petal_length), 
    sd_petal_length = sd(petal_length), 
    .groups = "drop" 
  ) 

print(summary_stats) 

# 8. Create a plot 
sepal_plot <- ggplot( 
  iris_data, 
  aes(x = species, y = sepal_length, fill = species) 
) + 
  geom_boxplot(alpha = 0.8) + 
  labs( 
    title = "Sepal Length by Iris Species", 
    x = "Species", 
    y = "Sepal Length (cm)" 
  ) + 
  theme_minimal() + 
  theme(legend.position = "none") 

print(sepal_plot) 

# 9. Save the plot 
ggsave( 
  filename = here("outputs", "figures", "sepal_length_by_species.png"), 
  plot = sepal_plot, 
  width = 8, 
  height = 6, 
  dpi = 300 
) 

# 10. Save summary table 
write_csv( 
  summary_stats, 
  here("outputs", "tables", "iris_summary_statistics.csv") 
) 

# 11. Save cleaned dataset for reproducibility 
write_csv( 
  iris_data, 
  here("data_processed", "iris_cleaned.csv") 
) 

