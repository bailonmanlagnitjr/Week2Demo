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
