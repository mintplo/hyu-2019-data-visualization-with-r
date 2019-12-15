# 20191120

# pie
cut(1:10, breaks=c(0, 5, 10))
cut(1:10, breaks=3)
cut(iris$Sepal.Width, breaks=10)

rep(c("a", "b", "c"), 1:3)
table(rep(c("a", "b", "c"), 1:3))

table(cut(iris$Sepal.Width, breaks=10))

pie(table(cut(iris$Sepal.Width, breaks=10)))

# pie LAB
# Airquality 데이터를 사용하여 다음에 답하시오.

# 1. Temp를 5분위로 나누어서 pie 그래프를 그리시오.
cut(airquality$Temp, breaks=5)
table(cut(airquality$Temp, breaks=5))
pie(table(cut(airquality$Temp, breaks=5)))

# 2. Wind를 10분위로 나누어서 pie 그래프를 그리시오.
cut(airquality$Wind, breaks=10)
table(cut(airquality$Wind, breaks=10))
pie(table(cut(airquality$Wind, breaks=10)))

# mosaicplot
str(Titanic)
Titanic

mosaicplot(Titanic, color=TRUE)
mosaicplot(~Class+Survived, data=Titanic, color=TRUE, cex=1.2)

# mosaicplot Lab
# Titanic 데이터를 사용하여 다음을 답하시오.

# 1. 성별과 생존여부로 모자이크 플롯을 그리시오. 여성과 남성 중 어느 쪽이 생존률이 높았는지 설명하시오.
mosaicplot(~Sex+Survived, data=Titanic, color=TRUE, cex=1.2) # 여성이 생존률이 높았다.

# 2. 성인, 어린이 여부와 생존여부로 모자이크 플롯을 그리시오. 성인과 어린이 중 어느 쪽이 생존률이 높았는지 설명하시오.
mosaicplot(~Age+Survived, data=Titanic, color=TRUE, cex=1.2) # 어린이가 생존률이 높았다.

# 산점도 행렬(Pairs)
pairs(~Sepal.Width+Sepal.Length+Petal.Width+Petal.Length, data=iris)

# persp, contour
outer(1:5, 1:3, "+")
outer(1:5, 1:3, function(x,y){x+y})

install.packages("mvtnorm")
library(mvtnorm)
dmvnorm(c(0,0),rep(0,2),diag(2))

x<-seq(-3,3,.1)
y<-x
f<-function(x,y){dmvnorm(cbind(x,y))}

persp(x,y,outer(x,y,f),theta=30,phi=30)
contour(x,y,outer(x,y,f))

# persp, contour Lab
# 1. x는 -5부터 5까지 0.1 간격으로 값을 가지는 벡터를 만드시오.
x <- seq(-5, 5, 0.1)

# 2. y도 동일하게 만드시오.
y <- x

# 3. z = x*x – y*y인 함수 g를 정의하시오.
g <- function (x, y) {x**2 - y**2}

# 4. x, y, g를 이용하여 투시도를 그리시오.
persp(x,y, outer(x,y,g), theta=30, phi=30)

# 5. x, y, g를 이용하여 등고선 그래프를 그리시오.
contour(x,y,outer(x,y,g))