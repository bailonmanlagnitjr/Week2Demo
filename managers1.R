Date1 <- c("2018-15-10","2018-01-11","2018-21-10","2018-28-10","2018-01-05")
Country <- c("US","US","IRL","IRL","IRL")
Gender <- c("M","F","F","M","F")
Age <- c(32,45,25,39,99)
q1 <- c(5, 3, 3, 3, 2)
q2 <- c(4, 5, 5, 3, 2)
q3 <- c(5, 2, 5, 4, 1)
q4 <- c(5, 5, 5, NA, 2)
q5 <- c(5, 5, 2, NA, 1)

column_names <- c("Date","Country","Gender","Age","Q1","Q2","Q3","Q4","Q5")

managers <- data.frame(Date1, Country, Gender, Age, q1, q2, q3, q4,q5)

colnames(managers) <- column_names

str(managers)

