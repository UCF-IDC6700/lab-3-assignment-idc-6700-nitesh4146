# Please use this source file to complete the lab6 assignment.
# To submit, commit and push your source file.
#
# There is information in our M&S Bootcamp persistent WebCourse
# about using Git
#   https://webcourses.ucf.edu/courses/1249560
#
# You can use git directly from RStudio if you want!  Here is more
# information about that:
#   https://jennybc.github.io/2014-05-12-ubc/ubc-r/session03_git.html
#
# You are *not permitted* to share your code with others for this
# assignment.
#

# Please write your name
# NAME: Nitish Gupta

#  vvvvv Put your code down here vvvvvv

### Part 1 ###
library(plyr)
library(dplyr, quietly = TRUE, warn.conflicts = FALSE)
library(ggplot2)
library(hrbrthemes)
require(stats)
library(viridis)

grain_data <- read.csv(url("http://cs.ucf.edu/~wiegand/idc6700/datasets/FeedGrains.csv"),
    header = TRUE,
    sep = ",",
    comment.char = "#"
)

print(colnames(grain_data))

### Part 2 ###
# Filtering by Frequency by "Annual" and Attribute by "Seed Use"
annual_seed_data <- filter(
    grain_data,
    SC_Frequency_Desc == "Annual" &
        SC_Attribute_Desc == "Seed use"
)

### Part 3 ###
# Scatter plot of Year vs Amount Seeded, Categorized by Commodity Type
p1 <- ggplot(
    annual_seed_data,
    aes(
        x = Year_ID,
        y = Amount,
        color = SC_Commodity_Desc,
        shape = SC_Commodity_Desc
    )) + geom_point(size = 2) + scale_color_viridis(discrete=TRUE) + theme_minimal() +
  labs(
    title = 'Year vs Amount Seeded, Categorized by Commodity Type',
    x = 'Year', y="Amount Seeded", color="Commodity Type", shape="Commodity Type")

print(p1)

### Part 4 ###
# All variables have numeric mode
# Age and Circumference have numeric class while Tree is an ordered-factor class
print(?data)
print(?Orange)
print(colnames(Orange))

print(mode(Orange$Tree))
print(class(Orange$Tree))

print(mode(Orange$age))
print(class(Orange$age))

print(mode(Orange$circumference))
print(class(Orange$circumference))

### Part 5 ###
# In order to compare ages across a specific tree, I would prefer
# the first plot (Tree ID vs Circumference, categorized by age). 
# This is because, each tree ID is separately grouped on the x-axis 
# making it easier for per tree analysis of age 

# Converting age to factor for categorizing 
age_factor <- factor(Orange$age)
levels(age_factor) <- c(unique((Orange$age)))
Orange$age <- age_factor
print(class(Orange$age)) # class changed to factor

# Plot of Tree ID vs Circumference; Categorized by Age
p2 <- ggplot(Orange, aes(x = Tree, y = circumference, fill=age)) +
  geom_bar(
    stat = "identity", position = position_dodge(0.8),
    width = 0.7
    ) + scale_fill_viridis_d() + theme_minimal() + 
  theme(axis.text.x = element_text(hjust = 0.5)) + labs(
    title = 'Tree ID vs Circumference; Categorized by Age',
    x = 'Tree ID', y="Circumference")

print(p2)

# Plot of Age vs Circumference; Categorized by Tree ID
p3 <- ggplot(Orange, aes(x = age, y = circumference, fill=Tree)) +
  geom_bar(
    stat = "identity", position = position_dodge(0.8),
    width = 0.7
    ) + scale_fill_viridis_d() + theme_minimal() + 
  theme(axis.text.x = element_text(hjust = 0.5)) + labs(
    title = 'Age vs Circumference; Categorized by Tree ID',
    x = 'Age', y="Circumference")
    
print(p3)

