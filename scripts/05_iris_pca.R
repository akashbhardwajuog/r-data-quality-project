# Project: R Data Quality and Exploratory Analysis 
# Author: Akash Bhardwaj 
# Purpose: Perform principal component analysis on iris measurements 

library(tidyverse) 
library(here) 
library(janitor) 

# Load cleaned dataset 
iris_data <- read_csv( 
  here("data_processed", "iris_cleaned.csv"),  show_col_types = FALSE 
) 

# Select numeric variables only 
iris_numeric <- iris_data %>% 
  select(sepal_length, sepal_width, petal_length, petal_width) 

# Standardise variables before PCA 
iris_scaled <- scale(iris_numeric) 

# Run PCA 
iris_pca <- prcomp(iris_scaled, center = TRUE, scale. = TRUE) 

# Variance explained by each principal component 
variance_explained <- summary(iris_pca)$importance 

print(variance_explained) 

# Create a data frame for plotting 
pca_scores <- as.data.frame(iris_pca$x) %>% 
  mutate(species = iris_data$species) 

# Plot PC1 vs PC2 
pca_plot <- ggplot( 
  pca_scores, 
  aes(x = PC1, y = PC2, colour = species) 
) + 
  geom_point(size = 3, alpha = 0.8) + 
  labs( 
    title = "Principal Component Analysis of Iris Measurements", 
    subtitle = "PC1 and PC2 based on standardised sepal and petal measurements", 
    x = "Principal Component 1", 
    y = "Principal Component 2", 
    colour = "Species" 
  ) + 
  theme_minimal(base_size = 12) 

print(pca_plot) 

# Save PCA plot 
ggsave( 
  filename = here("outputs", "figures", "iris_pca_plot.png"), 
  plot = pca_plot, 
  width = 8, 
  height = 6, 
  dpi = 300 
) 

# Save PCA scores 
write_csv( 
  pca_scores, 
  here("outputs", "tables", "iris_pca_scores.csv") 
) 
