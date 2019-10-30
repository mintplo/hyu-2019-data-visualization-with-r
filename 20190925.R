# 20190925

#####
## LAB
#####

# using airquality
# split() 함수를 사용하여 월별로 데이터를 분리하시오.
split(airquality, airquality$Month)

air <- split(airquality, airquality$Month)
str(air)
air[[1]]
air$`5`

# subset() 함수를 사용하여 5월 데이터만 추출하시오.
subset(airquality, Month == 5)

# subset() 함수를 사용하여 Temp가 90을 넘어선 레코드만 추출하시오.
subset(airquality, Temp > 90)

# subset() 함수를 사용하여 Temp가 90을 넘어선 월, 일만 추출하시오.
subset(airquality, Temp > 90, c(Month, Day))

# 위와 동일한 결과를 subset() 함수를 사용하지 않고 구하시오.
airquality[airquality$Temp > 90, c("Month", "Day")]
airquality[airquality$Temp > 90, names(airquality) %in% c("Month", "Day")]

#####
## LAB
#####

x <- data.frame(name=c("a", "b", "c"), math=c(1, 2, 3))
y <- data.frame(ssn=c("a", "b", "c"), english=c(4, 5, 6))

head(x)
head(y)
c <- merge(x, y, by.x='name', by.y='ssn')
d <- merge(x, y, by.x='name', by.y='ssn', all=TRUE)

#####
## LAB
#####

# airquality 데이터의 Temp 값을 오름차순으로 정렬하시오.
sort(airquality$Temp)

# airquality 데이터의 Temp 값을 내림차순으로 정렬하시오.
sort(airquality$Temp, decreasing = TRUE)

# airquality 데이터의 Ozone 값을 오름차순으로 정렬하시오.
sort(airquality$Ozone)

# 위 결과에서 NA 값들을 뒤에 표시하도록 하시오.
sort(airquality$Temp, na.last = TRUE)
sort(airquality$Temp, decreasing = TRUE, na.last = TRUE)
sort(airquality$Ozone, na.last = TRUE)

# 위 결과에서 NA 값들을 뒤에 표시하도록 하시오.
sort(airquality$Temp, na.last = FALSE)
sort(airquality$Temp, decreasing = TRUE, na.last = FALSE)
sort(airquality$Ozone, na.last = FALSE)

# airquality 데이터 전체를 Temp 내림차순으로 정렬하시오.
airquality[order(airquality$Temp, decreasing = TRUE),]

# airqualtiy 데이터 전체를 Ozone 내림차순으로 정렬하시오. 단 NA는 아래 위치하도록 하시오.
airquality[order(airquality$Ozone, decreasing = TRUE, na.last = TRUE),]

# airqualtiy 데이터 전체를 Ozone 내림차순으로 정렬하시오. 단 NA는 위에 위치하도록 하시오.
airquality[order(airquality$Ozone, decreasing = TRUE, na.last = FALSE),]

#####
## LAB
#####

airquality1 <- airquality

# with()를 이용하여 airquality 데이터의 Ozone과 Temp의 평균을 구하시오.
with(airquality, {
  print(mean(Ozone, na.rm = TRUE))
  print(mean(Temp, na.rm = TRUE))
})

# with() 함수를 이용하여 Ozone의 NA값들을 중간값으로 변경하시오. with() 함수 수행 후에도 변경 내용이 유지되는지 확인하시오.
with(airquality1, {
  Ozone <- ifelse(is.na(Ozone), median(Ozone, na.rm = TRUE), Ozone)
}) # 유지 X

# within() 함수를 이용해서 위와 동일한 작업을 수행하시오.
airquality1 <- within(airquality1, {
  Ozone <- ifelse(is.na(Ozone), median(Ozone, na.rm = TRUE), Ozone)
})
airquality1

# attach(), detach() 함수를 이용하여 Solar.R의 NA값들을 중간값으로 변경하 시오.
# 또 detach() 함수 수행 후에도 변경 내용이 유지되는 지 확인하시오. <- 이상하다
attach(airquality1)
airquality1$Solar.R <- ifelse(is.na(Solar.R), median(Solar.R, na.rm = TRUE), Solar.R)
airquality1
detach(airquality1)

#####
## LAB
#####

# subset() 함수를 이용해서 5월의 데이터만 선택하시오.
subset(airquality, Month == 5)

# subset() 함수를 사용하지 말고, 5월의 데이터만 선택하시오.
airquality[airquality$Month == 5,]

# which() 함수를 사용하여, 5월 데이터의 색인을 찾으시오.
which(airquality$Month == 5)

# 온도 중 최대값, 최소값의 인덱스를 구하시오. 이를 이용해서 해당 월, 일을 구하시오.
which.min(airquality$Temp)
which.max(airquality$Temp)
airquality[c(which.min(airquality$Temp), which.max(airquality$Temp)), c("Month", "Day")]

#####
## LAB
#####

# aggregate() 함수를 사용하여 월별 평균 온도(Temp)를 구하시오.
aggregate(Temp~Month, airquality, mean)

# tapply() 함수를 사용하여 월별 평균 온도를 구하시오.
tapply(airquality$Temp, airquality$Month, mean)

# aggregate() 함수를 사용하여 월별 평균 Ozone량을 구하시오.
aggregate(Ozone~Month, airquality, mean)

# tapply() 함수를 사용하여 월별 평균 Ozone량을 구하시오.
tapply(airquality$Ozone, airquality$Month, mean, na.rm = TRUE)

attach(airquality)
tapply(Ozone, Month, mean, na.rm = TRUE)
detach(airquality)
