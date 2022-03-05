# Lab 3 Assignment
Please write an R script that performs the operations described below.  When you are done, submit your assignment by pushing to GitHub.  You do not need to submit anything in Cavas.  Make sure the file you submit can be executed in R or RStudio with a clean environment.  That is, make sure it will provide output using the *source()* command from within R.  Perform all the operations described below.  Comment your script so that I know which lines are meant to address which item in the list below.


1. Get the Feed Grains dataset
  * You will find the dataset here: http://cs.ucf.edu/~wiegand/idc6700/datasets/FeedGrains.csv
  * The first two lines are comments, starting with the '#' character
  * The file has a header and the is comma separated
2. Get the subset of the data corresponding with only annual AND only seed use data (just one dataset, not two)
  * Use the field SC_Frequency_Desc to find the records associated with annual observations
  * Use the field SC_Atttribute_Desc to find the records associated with seed use observations
  * Hint:  the filter() function from dplyr might be useful ...
3. Use the subsetted annual seed use data to produce a scatterplot of the year by amount seeded, colored by commodity type
  * Use the field Year_ID for the year and make sure it is on the x-axis
  * Use the field Amount for the amount and it is on the y-axis
  * Use the SC_Commodity_Type for the commodity type
  * Make sure all plot labels are clear and visible
4. Examine the built-in R dataset, Orange
  * Look at the collection of built-in datasets (hint: ?data)
   * Consider the Orange data set in particular (hint: ?Orange)
  * Describe the mode() and class() of all variables in the data set (hint: ?Orange)
5. Plot and analyze the Orange data set
  * Produce one grouped bar plot, where the age and the specific tree number is on the x-axis, while the circumference is on the y-axis -- group by age
  * Produce one grouped bar plot, where the age and the specific tree number is on the x-axis, while the circumference is on the y-axis -- group by tree ID number
  * Make sure all plot labels are clear and visible, in both plots
  * If you have trouble because something is being treated as a number that you want treated as a factor, recall that you can use the factor() function to convert
  * Suppose you are interested in comparing across ages for a specific tree primarily, and only secondarily across different trees.  Which plot would you prefer?
