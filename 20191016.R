# 20191016_시험대비 Lab
library(dplyr)

#### [My Answer] Start
# 벡터1
rep(c("a", "b", "c"), 3)
rep(c(1,3,5), c(1,3,5))
rep(0:2, rep(2,3))
rep(seq(1, 3), times=3) + rep(0:2, each=3)

# 벡터2
dice = factor(c(3, 2, 5, 1, 5, 6), levels=c(1, 2, 3, 4, 5, 6), labels=c("one", "two", "three", "four", "five", "six"))
table(dice)

# 행렬1
mtx <- matrix(1:10000, 1000)
mtx[777, 3]

# 행렬2
model_mtx <- matrix(c(0.43, 0.04, 0.01, 0.49, 0.72, 0.52, 0.08, 0.24, 0.47), 3)
# 행렬은 이름을 못 설정하나?
sum(model_mtx[1, ])
sum(model_mtx[2, ])
sum(model_mtx[3, ])

# 행렬 3
model_mtx * model_mtx

# 리스트 1
exam_result = list(math=list(95, 90), writing=list(90, 85), reading=list(85, 80))
#1
exam_result$reading[[1]]

#2

#3

# 리스트 2
#1
temp = list(-2.4, 0.4, 5.7, 12.5, 17.8, 22.2, 24.9, 21.2, 14.8, 7.2, 0.4, 25.7)
names(temp) <- month.abb

#2
str(temp)

#3

# 데이터 프레임 1
#1
us.state = data.frame(state.abb, state.name, state.region, state.area)

#2
str(us.state)
summary(us.state)

#3
us.state[,c(2, 3)]

# 데이터 프레임 2
#1

#2

#3

#4

# 데이터 전처리 1
#1
subset(mtcars, mpg > 30)

#2
subset(mtcars, cyl == 4 & am == 0)[,c('mpg', 'hp', 'wt')]

#3
subset(mtcars, mpg > mean(mpg))[,c('mpg', 'cyl', 'wt')]

# 데이터 전처리 2
#1
filter(airquality, Month == 6)

#2
filter(airquality, Month == 6 & Temp >= 90)

#3-1
select(airquality, Ozone, Temp, Month) %>%
  group_by(Month) %>%
  summarize_at(vars(Ozone, Temp), mean, na.rm=TRUE) %>%
  filter(Ozone > 40 | Temp > 80)

#### [My Answer] End

#### [Solution] Start
# 벡터 1 Skip

# 벡터 2
#1
result <- c(3, 2, 5, 1, 5, 6)
dice <- c(1, 2, 3, 4, 5, 6)
dice.labels <- c('one', 'two', 'three', 'four', 'five', 'six')
dice.factors <- factor(result, levels = dice, labels = dice.labels)
dice.factors

#2
table(dice.factors)

# 행렬 1
mtx <- matrix(1:10000, 1000)

#1
mtx[777, 3]
mtx[1000, 3]

# 행렬2
#1
moving_model_v <- c(0.43, 0.04, 0.01, 0.49, 0.72, 0.52, 0.08, 0.24, 0.47)
moving_model <- matrix(moving_model_v, 3)
rownames(moving_model) <- c("lower", "middle", "upper") # 이름 설정
colnames(moving_model) <- c("lower", "middle", "upper") # 이름 설정

#2
sum(moving_model[1, ])
sum(moving_model[2, ])
sum(moving_model[3, ])

# 행렬3
#1
moving_model %*% moving_model # 행렬 곱

# 리스트1
exam_result = list(math=list(95, 90), writing=list(90, 85), reading=list(85, 80))

#1
exam_result$reading

#2
mean(unlist(exam_result[[3]]))

#3
mean(unlist(exam_result))

# 리스트2
#1
temp <- c(-2.4, 0.4, 5.7, 12.5, 17.8, 22.2, 24.9, 21.2, 14.8, 7.2, 0.4, 25.7)
temp <- as.list(temp)
names(temp) <- month.abb

#2
temp[temp < 0]

#3
temp[temp < mean(unlist(temp))]

# 데이터 프레임 1
#1
us.state = data.frame(state.abb, state.name, state.region, state.area, stringsAsFactors = TRUE)
#2
str(us.state)
#3
us.state[,c('state.name', 'state.region')] # 또는
us.state[,c(2,3)]

# 데이터 프레임 2
#1
lapply(us.state[,c(2,3)], class)
#2
sapply(us.state[,c(2,3)], class)
#4
tapply(us.state$state.area, us.state$state.region, mean)

# 데이터 전처리 1 ~ 2
