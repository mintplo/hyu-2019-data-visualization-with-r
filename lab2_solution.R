# Lab 1
x <-1:10
mtx <- cbind(x1=x, x2=x*2, x3=x*3, x*4, x*5)
mtx
sum(mtx[8,])

# Lab 2
lst <-list(c(3, 5, 7), c("A", "B", "c"))
lst[[2]][1] <- 'Alpha'
lst


# Lab 3-1
name <- c('Potter', 'Elsa', 'Gates', 'Wendy', 'Ben')
gender <- factor(c('F', 'M', 'F', 'M', 'F'))
math <- c(85, 76, 99, 88, 67)

df <-data.frame(name, gender, math)
class(df$name)
class(df$gender)
class(df$math)
df$name <- as.character(df$name)

df <-data.frame(name, gender, math, stringsAsFactors = FALSE)

# Lab 3-2
stat <- c(76, 73, 95, 82, 55)
df <- cbind(df, stat)

df$score <- (df$math+df$stat)/2
df

# Lab 3-3
df$grade[df$score >= 90] <- "A"
df$grade[df$score >= 80 & df$score < 90] <- "B"
df$grade[df$score >= 70 & df$score < 80] <- "C"
df$grade[df$score < 70] <- "D"
df

df$grade <- factor(df$grade, levels = c("D", "C", "B", "A"), 
                   ordered = TRUE)