# 20191113

# 곡선(curve)
curve(sin, 0, 2*pi)

# curve Lab
# 1. curve() 함수를 사용하여 [0, 2𝜋] 구간에서 cos 함수를 그리 시오.
# § 단 선의 색상은 파랑색으로, 선의 종류는 점선으로 하시오.
curve(cos, 0, 2*pi, col="blue", lty=2)

# 2. curve() 함수를 사용하여 exponential 함수를 [-1,1] 구간에서 그리시오.
curve(exp, -1, 1)

# 3. curve() 함수를 사용하여 exponential 함수를 [-10,10] 구간에서 그리시오.
curve(exp, -10, 10)

# 4. curve() 함수를 사용하여 exponential 함수를 [-100,100] 구간에서 그리시오.
curve(exp, -100, 100)

# 다각형(polygon)
# 선형 회귀
m <- lm(dist~speed, data=cars)
m

plot(cars)
abline(m)

p <- predict(m, interval="confidence")
head(p)

# 주의 car 데이터는 소팅이 이미 되어있음
x <- c(cars$speed, tail(cars$speed, 1), rev(cars$speed), cars$speed[1])
x

y <- c(p[,"lwr"], tail(p[,"upr"], 1), rev(p[,"upr"]), p[,"lwr"][1])
y

polygon(x, y, col=rgb(.7, .7, .7, .5))

# 다각형 + 선형회귀 Lab
# 설명변수를 Temp, 종속변수를 Wind로 해서 회귀식을 구하시오.
# 회귀식을 그리고, 신뢰구간을 표시하시오.
m <- lm(Wind~Temp, data=airquality)
plot(x=airquality$Temp, y=airquality$Wind)
abline(m)

p <- predict(m, interval="confidence")
sorted <- sort(airquality$Temp)
sorted_pred <- p[order(airquality$Temp), ] # 주의! 원 데이터의 순서로
x <- c(sorted, tail(sorted, 1), rev(sorted), sorted[1])
y <- c(sorted_pred[,"lwr"], tail(sorted_pred[,"upr"], 1), rev(sorted_pred[,"upr"]), sorted_pred[,"lwr"][1])
polygon(x, y, col=rgb(.7, .7, .7, .5))

# 문자열
plot(4:6, 4:6)
text(5, 5, "x")
text(5, 5, "00", adj=c(0, 0))
text(5, 5, "01", adj=c(0, 1))
text(5, 5, "10", adj=c(1, 0))
text(5, 5, "11", adj=c(1, 1))

# 문자열 Lab
# 1. x축을 Temp, y축을 Wind로 해서 그래프를 그리시오.
plot(x=airquality$Temp, y=airquality$Wind)

# 2. (90,18)에 빨간색으로 “Temp*Wind”를 적으시오.
text(90, 18, "Temp*Wind", col="red")

# 3. 각 점들을 일련번호를 점 아래 파랑색으로 표시하시오.
text(airquality$Temp, airquality$Wind, col="blue", pos=1)

# 그래프에 그려진 데이터의 식별
plot(cars, cex=.5)
identify(cars$speed, cars$dist)

# Identify Lab
#1. x축을 Temp, y축을 Wind로 해서 그래프를 그리시오.
plot(x=airquality$Temp, y=airquality$Wind)

#2. 그래프에 가장 위쪽, 가장 아래쪽, 가장 왼쪽, 가장 오른쪽 에 위치한 점들의 색인을 확인하시오.
identify(airquality$Temp, airquality$Wind)

# 범례(legend)
plot(iris$Sepal.Width, iris$Sepal.Length, pch=20, xlab="width", ylab="length")
points(iris$Petal.Width, iris$Petal.Length, pch="+", col="red")
legend("topright", legend=c("Speal", "Petal"), pch=c(20, 43), col=c("black", "red"), bg="gray")

# Legend Lab
# airquality 데이터를 이용해서 다음을 답하시오.

# 1. x=Temp, y=Ozone, 점 모양은 pch=20으로 해서 점들을 표시하시오.
plot(airquality$Temp, airquality$Ozone, pch=20, xlim=c(50, 100), ylim=c(0, 350), xlab="Temp", ylab="Ozone & Solar.R", main="Airquality")

# 2. x=Temp, y=Solar.R, 점 모양은 “+”, 점 색은 파랑색으로 해서 점들을 표시 하시오.
points(airquality$Temp, airquality$Solar.R, pch="+", col="blue")

# 3. 단 범위는 x는 50~100, y는 0~350로 하시오.
# 4. legend를 좌측 상단에 표시하시오. 배경은 노랑색으로 하시오.
legend("topright", legend=c("Ozone", "Solar.R"), pch=c(20, 43), col=c("black", "blue"), bg="yellow")

# 행렬에 저장된 데이터 그리기 matplot(), matlines(), matpoints()
x <- seq(-2 * pi, 2 * pi, 0.01)
y <- matrix(c(cos(x), sin(x)), ncol=2)
matplot(x, y, lty=c("solid", "dashed"), cex=2, type="l")
abline(h=0, v=0)
