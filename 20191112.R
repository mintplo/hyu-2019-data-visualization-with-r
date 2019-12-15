# 20191112
library(mlbench)
data(Ozone) # 내장 데이터가 아니기 때문에 데이터를 로딩

opar <- par(mfrow=c(1, 2))
plot(Ozone$V8, Ozone$v9, xlab="Sandburg Temparature", ylab="El Monte Temperature", main="Ozone")
plot(Ozone$V8, Ozone$v9, xlab="Sandburg Temparature", ylab="El Monte Temperature", main="Ozone2")
par(opar)

# Jitter
plot(Ozone$V8, Ozone$v9, xlab="Sandburg Temparature", ylab="El Monte Temperature", main="Ozone", pch=20, cex=.5)
plot(jitter(Ozone$V8), jitter(Ozone$v9), xlab="Sandburg Temparature", ylab="El Monte Temperature", main="Ozone", pch=20, cex=.5)

# Points
with(iris, {
  plot(NULL, xlim=c(0, 5), ylim=c(0, 10), xlab="width", ylab="length", main="iris", type="n")
  points(Sepal.Width, Sepal.Length, cex=.5, pch=20)
  points(Petal.Width, Petal.Length, cex=.5, pch="+", col="#FF0000")
})

# Points Lab
# airquality 데이터를 이용하여 다음을 수행하시오.
# 1. x축을 Temp, y축을 Ozone으로 해서 산포도를 그리시오.
# § 단, x축 label은 “Temp”, y축 label은 “Ozone & Solar.R”, 그래프 제목 은 “airquality”로 하고, 점은 검은 dot(pch=20)을 사용하시오.

with(airquality, {
  plot(Temp, Ozone, xlab="Temp", ylab="Ozone $ Solar.R", main="airquality", pch=20)

  # 2. 앞의 그래프에 x축을 Temp, y축을 Solar.R로 해서 점들을 추 가하시오.
  # § 단, 점의 모양은 “+”로 하고 점의 색은 파랑색으로 하시오.
  points(Temp, Solar.R, pch="+", col="#0000FF")
})

# 3. Temp, Ozone, Solar.R 각각의 최소값, 최대값을 구하시오.
min(airquality$Temp, na.rm=TRUE)
min(airquality$Ozone, na.rm=TRUE)
min(airquality$Solar.R, na.rm=TRUE)
max(airquality$Temp, na.rm=TRUE)
max(airquality$Ozone, na.rm=TRUE)
max(airquality$Solar.R, na.rm=TRUE)

# 4. Temp의 최소값, 최대값을 기준으로 x축의 범위를 결정하시오.
# 50, 100

# 5. Ozone, Solar.R의 최소값과 최대값을 기준으로 y축의 범위를 결 정하시오.
# 0, 350

# 6. 이 범위들을 활용하여 빈 그래프를 만들시오.
# § 단 그래프의 제목은 “Airquality”, x축 레이블은 “Temp”, y축 레이블은 “Ozone & Solar.R”로 하시오.
with(airquality, {
  plot(NULL, xlab="Temp", ylab="Ozone & Solar.R", main="Airquality", xlim=c(50, 100), ylim=c(0, 350), type='n')
  # 7. x=Temp, y=Ozone, 점 모양은 pch=20으로 해서 점들을 표시 하시오.
  points(x=Temp, y=Ozone, pch=20)
  # 8. x=Temp, y=Solar.R, 점 모양은 “+”, 점 색은 파랑색으로 해서 점들을 표시하시오.
  points(x=Temp, y=Solar.R, pch="+", col="#0000FF")
})

# abline(직선)
data(cars)
plot(cars, xlim=c(0, 25))
abline(a=-5, b=3.5, col="red")

plot(cars, xlim=c(0, 25))
abline(a=-5, b=3.5, col="red")
abline(h=mean(cars$dist), lty=2)
abline(v=mean(cars$speed), lty=2)

# abline Lab
# airquality 데이터를 이용해서 다음을 답하시오.
# 1. x축을 Temp, y축을 Wind로 해서 산포도를 그리시오.
# § 제목은 “Airquality”, x축 레이블은 “Temp”, y축 레이블은 “Wind”로 하시 오.
plot(airquality$Temp, airquality$Wind, main="Airquality", xlab="Temp", ylab="Wind")

# 2. Wind = 23.2 – 0.1705*Temp 직선을 추가하시오.
# § 직선은 파랑색으로 표시하시오.
abline(a=23.2, b=-0.1705, col="blue")

# 3. Temp와 Wind의 평균을 점선으로 표시하시오.
# § 선의 색은 적색으로 표시하시오.
abline(h=mean(airquality$Wind, na.rm=T), lty=2, col="red")
abline(v=mean(airquality$Temp, na.rm=T), lty=2, col="red")

# Lab More. 선형회귀식으로 line 그리기
air_reg <- lm(Wind~Temp, data=airquality)
air_reg <- lm(airquality$Wind~airquality$Temp)
summary(air_reg)
abline(reg=air_reg, col="blue")
