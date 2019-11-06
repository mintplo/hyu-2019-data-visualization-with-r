# 20191106
library(ggplot2)
diamonds
head(diamonds)
ggplot(data = diamonds, aes(x=carat, y=price)) + geom_point(aes(colour=clarity))
ggplot(data=diamonds, aes(x=carat, y=price)) + geom_point(aes(colour=clarity)) + geom_smooth()
ggplot(data=diamonds, aes(x=carat, y=price, colour=clarity)) + geom_point() + geom_smooth()

install.packages("ggthemes")
library(ggthemes)
g1 <- ggplot(data=diamonds, aes(x=carat, y=price, colour=clarity))
g1
g1+geom_point()
g1+geom_point(size=2)+theme_wsj()

#
install.packages("mlbench")
library(mlbench)
data(Ozone) # 내장 데이터가 아니기 때문에 데이터를 로딩
class(Ozone)
str(Ozone)
plot(Ozone$V8, Ozone$V9)

# car 데이터
data(cars)
str(cars)
head(cars)
plot(cars)
plot(cars, type="l")
plot(cars, type="b")
plot(cars, type="o")
tapply(cars$dist, cars$speed, mean)

# 그래프 옵션 Lab

# 1. x축을 Temp, y축을 Ozone으로 해서 산포도를 그리시오.

# min, max 값으로 데이터 확인
min(airquality$Temp, na.rm=TRUE)
max(airquality$Temp, na.rm=TRUE)
min(airquality$Ozone, na.rm=TRUE)
max(airquality$Ozone, na.rm=TRUE)

plot(airquality$Temp, airquality$Ozone, xlim=c(55, 100), ylim=c(0,170))

# 2. x축 이름을 Temp, y축 이름을 Ozone 으로 바꾸시오. 그래프 제목은 “Relationship between Temp and Ozone”으로 바꾸시오.
plot(airquality$Temp, airquality$Ozone, xlim=c(55, 100), ylim=c(0,170), xlab="Temp", ylab="Ozone", main="Relationship between Temp and Ozone")

# 3. 점의 종류를 삼각형으로 바꾸시오.
plot(airquality$Temp, airquality$Ozone, xlim=c(55, 100), ylim=c(0,170), xlab="Temp", ylab="Ozone", main="Relationship between Temp and Ozone", pch=2)

# 4. 점의 크기를 두 배로 하시오.
plot(airquality$Temp, airquality$Ozone, xlim=c(55, 100), ylim=c(0,170), xlab="Temp", ylab="Ozone", main="Relationship between Temp and Ozone", pch=2, cex=2)

# 5. 점의 색을 보라색으로 바꾸시오.
plot(airquality$Temp, airquality$Ozone, xlim=c(55, 100), ylim=c(0,170), xlab="Temp", ylab="Ozone", main="Relationship between Temp and Ozone", pch=2, cex=2, col="violet")

# 6. Temp의 범위를 50부터 100으로 조정하시오. + Ozone의 범위를 0부터 170으로 조정하시오.
plot(airquality$Temp, airquality$Ozone, xlim=c(50, 100), ylim=c(0,170), xlab="Temp", ylab="Ozone", main="Relationship between Temp and Ozone", pch=2, cex=2, col="violet")

# 7. 그래프에 점과 선이 중첩되도록 수정하시오.
plot(airquality$Temp, airquality$Ozone, xlim=c(50, 100), ylim=c(0,170), xlab="Temp", ylab="Ozone", main="Relationship between Temp and Ozone", pch=2, cex=2, col="violet", type="o")

# 8. 추세를 보기 위해서 동일한 Temp 값에 대하여 평균을 구하여 그래프를 구하시오.
plot(tapply(airquality$Ozone, airquality$Temp, mean, na.rm=TRUE), xlab="Temp", ylab="Ozone", main="Relationship between Temp and Ozone", type="o")

# 9. 선 유형을 점선(dashed)으로 변경하시오.
plot(tapply(airquality$Ozone, airquality$Temp, mean, na.rm=TRUE), xlab="Temp", ylab="Ozone", main="Relationship between Temp and Ozone", type="o", lty="dashed")
