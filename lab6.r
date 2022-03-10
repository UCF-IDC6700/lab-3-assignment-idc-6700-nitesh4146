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

grain_data <- read.csv("./FeedGrains.csv",
    header = TRUE,
    sep = ",",
    comment.char = "#"
)

print(colnames(grain_data))

### Part 2 ###
annual_seed_data <- filter(
    grain_data,
    SC_Frequency_Desc == "Annual" &
        SC_Attribute_Desc == "Seed use"
)

### Part 3 ###
p <- ggplot(
    annual_seed_data,
    aes(
        x = Year_ID,
        y = Amount,
        color = SC_Commodity_Desc,
        shape = SC_Commodity_Desc
    )
) +
    geom_point(size = 2) +
    theme_ipsum()
print(p)

### Part 4 ###
print(colnames(Orange))

print(mode(Orange$Tree))
print(class(Orange$Tree))

print(mode(Orange$age))
print(class(Orange$age))

print(mode(Orange$circumference))
print(class(Orange$circumference))

### Part 5 ###
p1 <- ggplot(Orange, aes(fill = age, y = circumference, x = Tree)) +
    geom_bar(position = "dodge", stat = "identity")

print(p1)
