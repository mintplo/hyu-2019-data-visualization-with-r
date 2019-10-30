# 20190917

# 배열
first_test <- matrix(c(46, 30, 21, 25, 50, 50), ncol=2, nrow=3) # 3 * 2 행렬
second_test <- matrix(c(47, 43, 41, 35, 50, 50), ncol=2, nrow=3) # 3 * 2 행렬

tests <- array(data=c(first_test, second_test), dim=c(3, 2, 2)) # 3개의 행과 2개의 열을 가진 행렬 2개를 가진 'tests' 배열 생성
tests

dimnames(tests) <- list(paste("row", c(1:3)), paste("col", c(1:2)), paste("ar", c(1:2))) # 행의 이름, 열의 이름, 각 행렬의 이름 부여
tests

length(tests)
mode(tests)
dim(tests)
dimnames(tests)

# 데이터 프레임
char1 <- c("A", "A", "B", "B", "C") # 벡터
num1 <- c(1, 1, 2, 2, 3) # 벡터

test1 <- data.frame(char1, num1) # 데이터 프레임 생성
test1

str(test1) # 임의의 R 객체의 내부 구조를 확인
class(test1) # 객체 클래스
head(test1) # returns the first parts of a vector, matrix, table, data frame or function
tail(test1) # returns the last parts of a vector, matrix, table, data frame or function
View(test1) # invoke a spreadsheet-style data viewer on matrix-like R object
summary(test1) # generic function used to produce result summaries of the results of various model fitting functions.

M <- matrix(1:8, nrow=4)
DF <- as.data.frame(M)

test2 <- cbind(test1, married = c(T, T, T, F, F))
test2

test3 <- rbind(test1, c("C", 4))
test3[, -1] # 열의 수가 2개인 경우, 1개의 열을 삭제하면 벡터로 반환
test3[-1] # 열의 수가 2개인 경우, 1개의 열을 삭제하여도 데이터 프레임으로 반환
test3[-1,] # 행 삭제

# 데이터 테이블
install.packages("data.table")
library(data.table)
table <- data.table(x=c(1,2,3), y=c("A", "B", "C"))
table

# 리스트
test <- list("kim", c(94, 82, 92), c(T, F, T))
test

son <- list(son.name = c("Minsu", "Minchul"), son.gender = c("Male", "Male"), son.age = c(2, 6))
son

son[[2]]
son[[3]][2]

names(son) <- c("name", "gender", "age")
son

son[[4]] <- 28 # 리스트의 4번째 성분에 값 추가
son[5:6] <- c(TRUE, TRUE)
son

# scan 함수
scan()
scan(what="") # 1,2,3을 위와 동일하게 입력한 후 결과 차이 확인!

# fix 함수
fix(test1)

####### Lab
# 1. 첫 번째 열은 1:10 벡터로 구성되고,
# 두 번째 열은 첫 번째 열 의 2배,
# 세 번째 열은 첫 번째 열의 3배,
# 네 번째 열은 첫 번째 열의 4배,
# 5번째 열은 첫 번째 열의 5배인 10X5 행렬을 생성 하시오.
col1 <- c(1:10)
col2 <- col1 * 2
col3 <- col1 * 3
col4 <- col1 * 4
col5 <- col1 * 5
arr1 <- matrix(c(col1, col2, col3, col4, col5), nrow=10, ncol=5)
# 또는
arr2 <- cbind(x1=col1, x2=col1*2, x3=col1*3, x4=col1*4, x5=col1*5)

sum(arr1[8, ])

# 2. 다음 리스트에서 “A”를 “Alpha”로 변경하시오.
lst <- list(c(3, 5, 7), c("A", "B", "C"))
lst[[2]][1] <- "Alpha"
lst

# 3.다음 세 벡터를 이용하여 데이터 프레임을 생성하시오.

name <- c('Potter', 'Elsa', 'Gates', 'Wendy', 'Ben')
gender <- factor(c('F', 'M', 'F', 'M', 'F'))
math <- c(85, 76, 99, 88, 67)

df <- data.frame(name, gender, math)
str(df) # 각 열의 데이터 유형을 확인하시오. 이때, 데이터 유형이 잘못 지정된 열이 있다면 유형을 변경하시오.
class(df$name)
class(df$gender)
class(df$math)

df[[1]] <- as.vector(name) # character vector 로 변경
# 또는
df$name <- as.character(df$name)
# 또는
df4 <- data.frame(name, gender, math, stringsAsFactors = FALSE)

# 4. 앞선 3에서 생성한 데이터 프레임 df에 다음 변수 stat를 열로 추가하시오.
stat <- c(76, 80, 90, 80, 50)

df2 <- cbind(df, stat)
df2
# OR
df[[4]] <- stat
dimnames(df) <- c("name", "gender", "math", "stat") # Q. 이름 변경 어떻게?

# 5. math 변수, stat 변수의 평균을 구하여, score변수에 저장 후 df 변수의 열로 추가하시오.
score <- (df2$math + df2$stat) / 2
df3 <- cbind(df2, score)

# 6. score열의 값이 90 이상이면 A,
# 80 이상 90 미만이면 B, 70이 상 80 미만이면 C,
# 70 미만이면 D로 등급을 부여한 결과인 grade 열을 df변수의 열로 추가하시오.
# Hint. df$grade[df$score >= 90] <- "A"
df3$grade[df3$score >= 90] <- "A"
df3$grade[df3$score >= 80 & df3$score < 90] <- "B"
df3$grade[df3$score >= 70 & df3$score < 80] <- "C"
df3$grade[df3$score < 70] <- "D"
df3

# 7. grade 열의 데이터 유형을 순서가 있는 범주형(순서형 팩터)로 변환하시오.
?as.ordered
df3$grade <- as.ordered(df3$grade, levels=c("A", "B", "C", "D"), ordered=TRUE)
