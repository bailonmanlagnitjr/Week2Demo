# Enter data into vectors before constructing the data frame
date_col <- c("2018-15-10", "2018-01-11", "2018-21-10", "2018-28-10", "2018-01-05")
country_col <- c("US", "US", "IRL", "IRL", "IRL")
gender_col <- c("M", "F", "F", "M", "F")
age_col <- c(32, 45, 25, 39, 99) # 99 is one of the values in the age attribute - will require recoding
q1_col <- c(5, 3, 3, 3, 2)
q2_col <- c(4, 5, 5, 3, 2)
q3_col <- c(5, 2, 5, 4, 1)
q4_col <- c(5, 5, 5, NA, 2) # NA is inserted in place of the missing data for this attribute
q5_col <- c(5, 5, 2, NA, 1)

column_names <- c("Date", "Country", "Gender", "Age", "Q1", "Q2", "Q3", "Q4", "Q5")

managers <- data.frame(date_col, 
                       country_col, 
                       gender_col, 
                       age_col, 
                       q1_col, 
                       q2_col, 
                       q3_col,
                       q4_col,
                       q5_col)

colnames(managers) <- column_names

str(managers)

managers$Age[managers$Age == 99] <- NA
managers

managers$AgeCat[managers$Age >= 45] <- "Elder"

managers$AgeCat[managers$Age >= 26 & managers$Age <= 44] <- "Middle Age"

managers$AgeCat[managers$Age <= 25] <- "Young"

managers$AgeCat[is.na(managers$AgeCat)] <- "Elder"

str(managers)

modified_AgeCat <- factor(managers$AgeCat, ordered = TRUE, levels = c("Young", "Middle Age", "Elder"))

managers$AgeCat <- modified_AgeCat

str(managers)

managers$summary_col <- managers$Q1 + managers$Q2 + managers$Q3 +  managers$Q4 +  managers$Q5

managers

new_data <- subset(managers, Age >= 35 | Age < 24, select=c(Q1, Q2, Q3, Q4, Q5))
str(new_data)
new_data

mean_value <- rowMeans(managers[5:9])
managers <- data.frame(managers, mean_value)
managers

#add column names to new columns
names(managers) [11] <- "Answer total"
names(managers) [12] <- "Mean value"

managers

str(managers)

#change the date structure from factor
#we cant convert a factor to date
#without converting to character vector first

date_field <- as.character(managers$Date)
date_field
str(date_field)

new_date <- as.Date(date_field, "%Y-%d-%m")
new_date
str(new_date)
str(managers)
managers$Date <- new_date
str(managers)

#dealing with missing data

new_data <- na.omit(managers)
new_data

complete_data <- complete.cases(managers)
complete_data
sum(complete_data)

#list rows that do not have missing values
#note that the ',' means all columns 
complete_data <- managers[!complete.cases(managers),]
complete_data

#find the sum if all missing values in the age category
sum(is.na(managers$Age))

sum(!is.na(managers$Age))

install.packages("mice")
library(mice)

md.pattern(managers)

install.packages("VIM")
library(VIM)
missing_values <- aggr(managers, prop = FALSE, numbers = TRUE)
