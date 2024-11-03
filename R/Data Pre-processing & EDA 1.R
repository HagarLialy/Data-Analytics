
#Upload data 
car_data <- read.csv("C:\\Users\\tiba mol\\Desktop\\Clean data\\Car.csv", header = TRUE)

#show first rows & columns 
head(car_data)

#summarize the statistical info of data 
summary(car_data)

#get info about the data 
str(car_data)

#install packages
install.packages("ggplot2")
install.packages("dplyr")
install.packages("tidyr")

#import libraries 
library(ggplot2)
library(dplyr)
library(tidyr)

##### data cleaning after pre-processing ######

#1- fill all numeric culomns by mean#
car_Data_filled <- car_data %>%
  mutate(across(where(is.numeric), ~ ifelse(is.na(.), mean(., na.rm= TRUE), .)))

#check if the missing values have been filled 

colSums(is.na(car_Data_filled))

#2- detecting outliers#

Q1 <- quantile(car_Data_filled$MSRP, 0.25)
Q3 <- quantile(car_Data_filled$MSRP, 0.75)
IQR <- Q3 - Q1

care_data_no_outlier <- car_Data_filled %>%
  filter(MSRP >= (Q1 - 1.5 * IQR) & MSRP <= (Q3 + 1.5 * IQR))

summary(care_data_no_outlier)

#3- Remove duplicates#

care_data_clean <- care_data_no_outlier %>% distinct()

#preview data cleaned 
head(care_data_clean)

##### data analysis #####

#1- correlation matrix #
cor_matrix <- cor(care_data_clean %>% select(where(is.numeric)))
print(cor_matrix)

#heatmap to visualize (lighter colors stronger corr)
heatmap(cor_matrix)

#2- Aggregation #

# average MSRP by make 
avg_msrp_make <- care_data_clean %>%
  group_by(Make) %>%
  summarize(average_msrp = mean(MSRP))
print(avg_msrp_make)

# average MSRP by make & year
avg_msrp_make_year <- care_data_clean %>%
  group_by(Make, Year) %>%
  summarize(average_msrp = mean(MSRP))
print(avg_msrp_make)

#3- pivot table 

# average MSRP by make & year
pivot_table <- care_data_clean %>%
  group_by(Make, Year) %>%
  summarize(average_msrp = mean(MSRP)) %>%
  pivot_wider(names_from = Year, values_from = average_msrp)
print(pivot_table)

