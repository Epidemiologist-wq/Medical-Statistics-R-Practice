### practice session 
## clear the console (ctr+L) 
##clear the enviornment lower case (ls) 
rm(list =ls()) 
## creating an object and assigning a value 
age<-24
age
height <-182
height
# remove height
rm(height)
height_cm <-182
height_cm 
weight_kg <-79
weight_kg 
### creating a vector using c 
## Among 20 hypothetical patients with cardiomyopathy,  
# how are age ,sex height,weight and ejection fraction distributed 
# and is ejection fraction related to age or BMI?
age <-c (18,22,25,24,28,30,31,35,40,63,
         34,39,43,47,48,55,59, 57,65,70) 
gender <-c ("male","female","female","male","male","female","male","male",
            "female","female","male","male","female","male","female","male",
            "female","male","female","female") 
height_cm <-c(172,162,165,167,169,153,179,180,184,154,
              150,160,181,182,149,170,164,165,171,177) 
weight_kg <-c(47,43.5,118,105,119,52,55.4,59,69,79,
              80,83,93,95,96,99.9,105,109,110,103) 
ejection_fraction <-c(52,41,32,20,70,55,58,60,62,65,
                      68,70,43,45,48,35,38,20,25,28) 
### use length tells us how many values are inside a vector
length(age) 
length(gender)
length(height_cm)
length(weight_kg) 
length(ejection_fraction) 
# create a data frame from vectors
# creating a data frame using data.frame 
df <-data.frame( 
  age=age,
  gender=gender,
  height_cm=height_cm,
  weight_kg=weight_kg,
  ejection_fraction=ejection_fraction
  )
df
## want to inspect the data##
View(df) 
### want to see first six rows 
head(df)
## want to see last six rows
tail(df) 
## lets say for instance if you want to see only row 11
df[11,] 
# give me row 11 with column 3 
df[11,3] 
### checking type of variable 
class(df$age) 
class(df$height_cm) 
class(df$weight_kg) 
class(df$gender) 
class(df$ejection_fraction) 
## For statistical analysis categorical variables are often stored as factors.
#This is useful because many statistical analyses and modelling functions need 
#to know that a variable represents groups/categories
df$gender <-as.factor(df$gender) 
class(df$gender)  
#Next inspecting the structure of data
#it gives
#how many observations (rows) 
#how many variables (columns) 
#the type of each variable 
#a few example values 
str(df) 
#want to know the names of all the variables
names(df) 
#dim tells us the dimensions of our data frame 
#number of rows*number of columns 
dim(df)
## how many observations and patients in the data set column
nrow(df) 
ncol(df) 
## check for missing values 
## is.na() identifies missing values.
## TRUE = the value is missing.
## FALSE = the value is not missing.
is.na(df) 
sum(is.na(df)) 
## check for duplicates 
duplicated(df) 
sum(duplicated(df)) 
## giving error so we  need to correct
## Accessing a column with $
df$age
#Indexing data frames and vectors [row,column] 
df[11,1] 
df$age[11] 
#For row and column positions use of square bracket[] 
#df$age select column by name use of dollar sign
#df[11,1] select by row and column position 
#df$age[11] select 11th value from the age column 
## Calculating BMI
## BMI requires height in metres.
## To convert centimetres to metres, divide by 100.
df$bmi <-df$weight_kg/(df$height_cm/100) ^2 
df$bmi 
class(df$bmi) 
## calculate the mean,median,minimum ,maximum,&range age of the patients 
mean(df$age) 
median(df$age) 
min(df$age) 
max(df$age) 
range(df$age) # minimum and maximum
##The word range is used in two different ways.
## Range (x) in R gives the interval 
## the minimum and maximum as Two numbers
## The range width is maximum-minimum 
##maximum_minimum=70-18=52
diff(range(df$age)) # width of the range

## Quartiles:
## Q1 = 25th percentile
## Q2 = 50th percentile (median)
## Q3 = 75th percentile

quantile(df$age)

# 0% = minimum age
# 25% = about 25% of observations are at or below this value
# 50% = median
# 75% = about 75% are at or below this value
# 100% = maximum age

## Now we can use these quartiles to measure the spread of the middle 50%
## of patients

IQR(df$age)

## Concept: Interquartile range
## IQR measures the spread of the middle 50% of the data
# Q1 = 29.5
# Q3 = 55.5
# So IQR = Q3 - Q1 = 55.5 - 29.5 = 26 years
## Variance measures how spread out the observations
## are around the mean.
var(df$age)

## Standard deviation measures the typical spread
## of observations around the mean.
sd(df$age)

## Standard deviation is the square root of variance.
sqrt(var(df$age)) 
### quick descriptive summary of the data 
## summary() on a numerical variable gives:
## Min, 1st Qu, Median, Mean, 3rd Qu, Max
summary(df$age) 
## If you want everything displayed together you can create 
## your own small summary and snippet showed you all values once. 
c(
  mean=mean(df$age),
  median=median(df$age), 
  sd=sd(df$age),
  variance=var(df$age),
  IQR=IQR(df$age), 
  minimum=min(df$age),
  maximum=max(df$age) 
  ) 
## summary() on the whole data frame gives:
## descriptive statistics for numerical columns
## and counts for factor/categorical columns.
## summary() does not give standard deviation (SD).
## Calculate SD separately using sd():
##If missing values exist, summary shows the number of NA,s
## for that variable, if no NA exist, it does not show an NA count.
##For a direct missing-value check 
sum(is.na(df))
summary(df) 
mean(df$weight_kg) 
median(df$weight_kg) 
sd(df$age) 
# MODE

## The mode is the most frequently occurring value
## or category in a dataset.

## It tells us which value occurs most often.

## Unlike the mean and median, the mode can be used
## for both numerical and categorical variables.

## Example:
## If the values are:
## 2, 3, 3, 4, 5
## The mode is 3 because it occurs most frequently.

## In R, table() can be used to find frequencies.
## For example:
table(df$gender)

## This shows how many observations are in each category.
## The category with the highest frequency is the mode.

### Interpretation of Mode

## There is no single modal category because female and male
## occur equally frequently, with 10 observations in each group.

## Therefore, the gender variable has two modes:
## female and male.

## If one category has the highest frequency,
## that category is the mode.

## Example:
## female = 8
## male = 12
## Mode = male

## If two categories have the same highest frequency,
## there are two modes (bimodal).

## Example:
## female = 10
## male = 10
## Modes = female and male

## Remember:
## Mode = the most frequently occurring value or category.
##############
## Important note:
## Mean and median are not enough to diagnose
## the shape or normality of a distribution.
## We use plots to examine the distribution properly.

### Visualizing the data

### Histograms are used for numerical variables,
### not categorical variables.

hist(df$weight_kg)

## To change the number of bins:
hist(df$weight_kg, breaks = 5)

## Interpretation:
## The histogram suggests that patient weights are not
## distributed as one simple symmetric peak.
## There appears to be a lower-weight cluster.
hist(
  df$weight_kg,
  main= "Distribution of patient weight",
  xlab="weight(kg)",
  ylab="Number of patients",
  col="steelblue",
  border="black",
  breaks=5
) 
# STEP 1: Count categories

## For categorical variables, table() is a common way
## to count how many observations are in each category.

table(df$gender)

## STEP 2: Create a bar plot

barplot(
  table(df$gender),
  xlab = "Gender",
  ylab = "Number of observations",
  main = "Participants by Gender",
  col = c("green", "steelblue")
)
# SCATTER PLOT
## A scatter plot displays the relationship between two numerical variables.
## The first variable is shown on the x-axis.
## The second variable is shown on the y-axis.
## Each point represents one observation.
##
## pch = 19 gives solid circles.
## col controls the point colour.
## xlab labels the x-axis.
## ylab labels the y-axis.
## main gives the plot title.

plot(
  df$height_cm,
  df$weight_kg,
  pch = 19,
  col = "steelblue",
  xlab = "Height (cm)",
  ylab = "Weight (kilograms)",
  main = "Height and Weight"
) 
# BOX PLOTS
## A box plot is used to display the distribution
## of a numerical variable.
##
## A box plot shows:
## - the median
## - the lower quartile (Q1)
## - the upper quartile (Q3)
## - the interquartile range (IQR)
## - possible outliers
##
## The box represents the middle 50% of the data.
## The line inside the box represents the median.
## The lower edge of the box represents Q1 (25th percentile).
## The upper edge of the box represents Q3 (75th percentile).
##
## IQR is:
## Q3 - Q1
##
## The whiskers show the spread of the data
## beyond the middle 50%.
## Points beyond the whiskers may be potential outliers.
##
## Basic syntax:
## boxplot(
##   numerical_variable,
##   main = "title",
##   xlab = "x-axis label",
##   ylab = "y-axis label"
## )

## Create a box plot for patient weight:

boxplot(
  df$weight_kg,
  main = "Distribution of Patient Weight",
  xlab = "Patient weight",
  ylab = "Weight (kg)",
  las = 1
)

## Numerical variable -> box plot

# INTERPRETATION OF THE BOX PLOT
## The median patient weight was 94 kg.
## The middle 50% of patients had weights between
## 66.5 kg and 105 kg.
## There were no potential outliers in the dataset.
## The distribution showed some asymmetry, meaning
## the data were not evenly spread around the median.
## The lower side showed greater spread than the upper side.

# REPORTING FREQUENCY, PROPORTION AND PERCENTAGE

## Frequency
## Frequency is the number of observations
## in each category.
##
## For categorical variables, table() is used
## to count the observations in each category.

table(df$gender)


## Proportion
## Proportion is the fraction of observations
## in each category.
##
## prop.table() converts the frequencies
## into proportions.

prop.table(table(df$gender))


## Percentage
## Percentage is the proportion multiplied by 100.
##
## Therefore:
## proportion × 100 = percentage

prop.table(table(df$gender)) * 100


## Saving the results as objects
## We can save the frequency and percentage
## so that we can use them later.

gender_frequency <- table(df$gender)

gender_percentage <- prop.table(table(df$gender)) * 100


## Display the frequency

gender_frequency


## Display the percentage

gender_percentage


## Combining frequency and percentage
## cbind() combines objects side-by-side
## as columns.
##
## This allows us to create one summary table
## containing both frequency and percentage.

gender_summary <- cbind(
  Frequency = gender_frequency,
  Percentage = gender_percentage
)

gender_summary


## Interpretation
## There were 10 female and 10 male observations.
## Female observations represented 50% of the dataset.
## Male observations represented 50% of the dataset.
##
## Remember:
## table() = frequency
## prop.table(table()) = proportion
## prop.table(table()) * 100 = percentage
## cbind() = combine results into columns
# CONTINGENCY TABLES

## Concept:
## A contingency table shows the frequency of combinations
## of two categorical variables.
##
## It can be used to examine how two categorical variables
## are distributed together.
##
## In this example, we examine gender and
## ejection-fraction (EF) group.


## Creating a categorical variable from a numerical variable
##
## ifelse() can be used to classify numerical values
## into different categories.
##
## Basic structure:
## ifelse(condition, value_if_true, value_if_false)
##
## If the condition is TRUE, R uses value_if_true.
## If the condition is FALSE, R uses value_if_false.


## Creating a new column inside a data frame
##
## A new column can be created using:
## df$new_column <- values
##
## The $ operator is used to access or create
## a column inside a data frame.
##
## For example:
## df$ef_group
##
## means: access the ef_group column inside df.
##
## When we use <- with df$ef_group, we create
## a new column called ef_group inside df.
##
## We do NOT always use df when creating a variable.
##
## A standalone variable can be created like this:
## age <- 24
##
## A new column inside a data frame is created like this:
## df$new_column <- values


## Creating an EF group
##
## ejection_fraction is a numerical variable.
## We create a new categorical variable called ef_group
## to group patients according to their EF.

df$ef_group <- ifelse(
  df$ejection_fraction < 50,
  "Low EF",
  "Preserved EF"
)


## How ifelse() works:
##
## IF ejection_fraction is less than 50
## -> "Low EF"
##
## OTHERWISE
## -> "Preserved EF"
##
## Examples:
## EF = 41 -> condition is TRUE -> "Low EF"
## EF = 52 -> condition is FALSE -> "Preserved EF"


## Check the new column

df$ef_group


## Count the observations in each EF group
##
## table() counts how many observations
## belong to each category.

table(df$ef_group)


## Creating a contingency table
##
## Once we have two categorical variables,
## table() can show their combinations.
##
## Basic structure:
## table(first_categorical_variable,
##       second_categorical_variable)
##
## The first variable forms the rows.
## The second variable forms the columns.

table(df$gender, df$ef_group)


## Interpretation:
##
## The contingency table shows how many
## males and females are in each EF group.
##
## It describes the distribution of observations
## across two categorical variables.
##
## A contingency table describes the data,
## but it does not by itself prove that
## the two variables are associated.


## Remember:
##
## ifelse() = create categories based on a condition
## table() = count frequencies
## table(variable1, variable2) = contingency table
## rows = first variable
## columns = second variable
# CORRELATION

## Concept:
## Correlation measures the strength and direction
## of the linear relationship between two numerical variables.
##
## Correlation ranges from -1 to +1.
##
## Positive correlation:
## As one variable increases, the other tends to increase.
##
## Negative correlation:
## As one variable increases, the other tends to decrease.
##
## Correlation close to 0:
## Little or no linear relationship.
##
## Correlation close to +1:
## Strong positive linear relationship.
##
## Correlation close to -1:
## Strong negative linear relationship.
##
## Important:
## Correlation describes an association between variables.
## Correlation does NOT prove that one variable causes the other.
##
## Basic R syntax:
## cor(variable1, variable2)


# AGE AND EJECTION FRACTION

## Both age and ejection fraction are numerical variables.
## We can use correlation to examine their linear relationship.

cor(df$age, df$ejection_fraction)

## The correlation is approximately r = -0.31.
##
## The negative sign indicates the direction:
## higher age tends to be associated with lower EF.
##
## The magnitude of 0.31 indicates a weak
## negative linear relationship.
##
## Therefore, there is a weak negative linear relationship
## between age and ejection fraction in this sample.
##
## Correlation does not prove causation.


# SCATTER PLOT: AGE AND EJECTION FRACTION

## A scatter plot is used to visualise the relationship
## between two numerical variables.
##
## The first variable is placed on the x-axis.
## The second variable is placed on the y-axis.
##
## Each point represents one observation/patient.
##
## pch = 19 gives solid circles.
## col controls the point colour.
## xlab labels the x-axis.
## ylab labels the y-axis.
## main gives the plot title.
## las = 1 makes axis labels horizontal.

plot(
  df$age,
  df$ejection_fraction,
  pch = 19,
  col = "steelblue",
  xlab = "Age (years)",
  ylab = "Ejection fraction (%)",
  main = "Age and Ejection Fraction",
  las = 1
)


# R-SQUARED: AGE AND EJECTION FRACTION

## R-squared is calculated by squaring the correlation.
##
## It describes the proportion of variation in the
## outcome that is accounted for by the linear relationship
## with the other variable.
##
## R-squared is between 0 and 1.

r_squared <- cor(df$age, df$ejection_fraction)^2

r_squared

## For this dataset, R-squared is approximately 0.097.
## This means that about 10% of the variation in
## ejection fraction is accounted for by its linear
## relationship with age in this sample.
##
## This does NOT mean that age causes the variation
## in ejection fraction.


# BMI AND EJECTION FRACTION

## BMI and ejection fraction are both numerical variables.
## We can examine their linear relationship using
## correlation and a scatter plot.
##
## BMI was calculated earlier in the analysis.
## Therefore, we do not need to calculate it again here.

cor(df$bmi, df$ejection_fraction)

## The correlation is approximately r = -0.34.
##
## The negative sign indicates that higher BMI
## tends to be associated with lower EF.
##
## The magnitude of 0.34 indicates a weak
## negative linear relationship.
##
## Therefore, there is a weak negative linear relationship
## between BMI and ejection fraction in this sample.
##
## Correlation does not prove causation.


# R-SQUARED: BMI AND EJECTION FRACTION

## R-squared is calculated by squaring the correlation.

r_squared_bmi <- cor(df$bmi, df$ejection_fraction)^2

r_squared_bmi

## For this dataset, R-squared is approximately 0.113.
## This means that about 11% of the variation in
## ejection fraction is accounted for by its linear
## relationship with BMI in this sample.
##
## This does NOT prove that BMI causes changes
## in ejection fraction.


# SCATTER PLOT: BMI AND EJECTION FRACTION

## BMI is on the x-axis.
## Ejection fraction is on the y-axis.
## Each point represents one observation/patient.

plot(
  df$bmi,
  df$ejection_fraction,
  pch = 19,
  col = "steelblue",
  xlab = "BMI",
  ylab = "Ejection fraction (%)",
  main = "BMI and Ejection Fraction",
  las = 1
)


# REMEMBER:
##
## cor() = calculates correlation
## r = correlation coefficient
## r < 0 = negative relationship
## r > 0 = positive relationship
## r close to 0 = weak/no linear relationship
## r close to -1 or +1 = strong linear relationship
## r-squared = correlation squared
## correlation does NOT prove causation
