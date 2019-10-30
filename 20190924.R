# 20190924

## mapply
rnorm(10, 0, 1) # 일반적인 rnorm 호출
mapply(rnorm, c(1,2,3), c(0,10,100), c(1,1,1)) # 1일때 mean 0, sd 1, 2일때 10, 1 / 3일때 100, 1과 같은 조합에 대한 호출이 필요한 경우
mapply(mean, iris[,1:4]) # => mean(iris[,1]), mean(iris[,2]), mean(iris[,3]), mean(iris[,4])를 의미

## 데이터를 그룹으로 묶은 후 함수 호출하기 (using doBy 패키지)
install.packages("doBy")
library(doBy)

## summary vs summaryBy
summary(iris)
summaryBy(Sepal.Width+Sepal.Length~Species, iris)

## order vs orderBy
order(iris$Sepal.Width)
iris[order(iris$Sepal.Width),]
orderBy(~Sepal.Width, iris)
orderBy(~Species+Sepal.Width, iris)

## sample vs sampleBy
sample(1:10, 5) # 비복원 추출
sample(1:10, 5, replace=TRUE) # 복원 추출
iris[sample(nrow(iris), nrow(iris)),]
sampleBy(~Species, frac=0.1, data=iris) # 각 종별로 10% 씩 데이터를 샘플링한다는 의미

#####
## Lab
#####

# airquality 데이터에서 Ozone, Solar.R, Wind, Temp의 평균을 mapply()를 사용하여 구하시오.
mapply(mean, airquality[,1:4], na.rm=TRUE)

# summary() 함수를 이용하여 각 필드의 특징들을 확인하시오.
summary(airquality)

# summaryBy() 함수를 이용하여, 월별, Ozone, Solar.R, Wind, Temp 평균값을 구 하시오.
summaryBy(Ozone+Solar.R+Wind+Temp~Month, airquality, na.rm=TRUE)

# order() 함수를 이용한 Temp 순으로 정렬하시오.
airquality[order(airquality$Temp),]

# orderBy() 함수를 이용하여 Temp 순으로 정렬하시오.
orderBy(~Temp, data=airquality)

# sample() 함수를 이용하여 10개를 샘플링하시오.
airquality[sample(1:nrow(airquality), 10),]

# sampleBy() 함수를 이용하여 월별로 10%의 데이터를 샘플링하시오.
sampleBy(~Month, frac=0.1, data=airquality)


## split()
s = split(iris, iris$Species)
lapply(split(iris$Sepal.Length, iris$Species), mean)
tapply(iris$Sepal.Length, iris$Species, mean)

## subset()
subset(iris, Species == 'setosa')
subset(iris, Species == 'setosa' & Sepal.Length > 5.0)
subset(iris, select=c(Sepal.Length, Species))
subset(iris, slecet=-c(Sepal.Length, Species))
iris[, !names(iris) %in% c("Sepal.Length", "Species")]
