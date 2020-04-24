# Plot iris data
# Aditya Banerjee
# abanerjee@email.arizona.edu
# 2020-01-18

# head(iris)
# summary(iris)
# The above lines have been commented out because theyre not essential 
# for the purposes of this script

# install.packages("tidyverse")
# Load the tidyverse package
library(tidyverse)

# Group iris data by values in species column
iris_grouped <- group_by(iris, Species)

# Calculate mean value
iris_means <- summarise(iris_grouped, SL_mean = mean(Sepal.Length))

# Convert to long
# -Species excludes the species category
iris_long <- gather(iris, key = trait, value = measurement, -Species)

# Group data, calculate means
iris_means <- iris %>%
  gather(key = trait, value = measurement, -Species) %>%
  group_by(Species, trait) %>%
  summarise(trait_mean = mean(measurement), 
            trait_se = sd(measurement)/sqrt(n()))
  
# Plot iris data
ggplot(data = iris_means, mapping = aes( x= Species, y =  trait_mean)) +

geom_point()+geom_errorbar(mapping = aes(ymin = trait_mean -trait_se,
                                         ymax = trait_mean + trait_se,
                                         width = 0.3)) +
facet_wrap(~trait, scales = "free_y")

ggsave(filename = "iris-plot.pdf")
