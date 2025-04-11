install.packages("tidyverse")
library(tidyverse)
install.packages("ggplot2")
library(ggplot2)

donnees <- read.csv("daily_food_nutrition_dataset.csv", sep = ",", encoding = "UTF-8")

print(donnees)
head(donnees)
colnames(donnees)
glimpse(donnees)
summary(donnees)

donnees %>%
  group_by(Food_Item ) %>%
  summarise(Moyenne_Calories = mean(Calories..kcal., na.rm = TRUE))

ggplot(donnees, aes(x = Protein..g., y = Calories..kcal.)) +
  geom_point(color = "#0072B2") +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = "Corrélation entre Protéines et Calories",
       x = "Protéines (g)", y = "Calories (kcal)")



ggplot(donnees, aes(x = Category, y = Carbohydrates..g., fill = Category)) +
  geom_boxplot() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Distribution des Glucides par Catégorie d'Aliment")

ggsave("calories_vs_proteines.png", width = 8, height = 6)


pdf("visualisations_r.pdf")
# Reproduire les graphiques ici
dev.off


