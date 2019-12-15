# 20191119

# 응용그래프 boxplot()
boxplot(iris$Sepal.Width)

boxstats <- boxplot(iris$Sepal.Width)
boxstats

boxstats <- boxplot(iris$Sepal.Width, horizontal = TRUE)
text(boxstats$out, rep(1,NROW(boxstats$out)), labels=boxstats$out, pos=c(1, 1, 3, 1))

# boxplot Lab
# airquality 데이터를 이용해서 다음을 답하시오.

# 1. Wind 데이터를 이용해 boxplot을 그리시오.
boxplot(airquality$Wind, notch = TRUE)
# 2. wind 데이터의 boxplot의 값들을 확인하시오
# 3. boxplot 상자 그림을 가로로 그리시오.
boxstats <- boxplot(airquality$Wind, horizontal=TRUE)
# 4. wind 데이터의 outlier 데이터 값을 점의 하단에 표시하시오.
text(boxstats$out, rep(1, NROW(boxstats$out)), labels=boxstats$out, pos=c(1,1,1,1))
# 5. stats 값을 표시하시오 (문자열은 점의 하단,상단,하단,상단,하단에 표기)
text(boxstats$stats, rep(1, NROW(boxstats$stats)), labels=boxstats$stats, pos=c(1,3,1,3,1))

# boxplot notch
sv <- subset(iris, Species=="setosa" | Species=="versicolor")
sv$Species <- factor(sv$Species)
boxplot(Sepal.Width~Species, data=sv, notch=TRUE)

# boxplot Lab 2
# iris 데이터를 이용하여 답하시오.

# 1. versicolor와 virginica 중에 Petal.Width의 중간값이 어느 것이 더 큰지 boxplot를 이용하여 확인하시오.
sv <- subset(iris, Species=="versicolor" | Species=="virginica")
sv$Species <- factor(sv$Species)
boxplot(Petal.Width~Species, data=sv, notch=TRUE)

# 2. 또 이들의 차이가 통계적으로 유의한지도 확인하시오.
# 중간값의 차이가 있으므로 유의하다.

# histogram
hist(iris$Sepal.Width)
hist(iris$Sepal.Width, freq=FALSE)
x <- hist(iris$Sepal.Width, freq=FALSE)
x
sum(x$density) * 0.2 # Why? 각 구간의 확률 밀도가 그려진다. 확률 밀도므로 막대 너비의 합이 1이 된다.

# histogram Lab
# airquality 데이터를 이용하여 다음을 답하시오.

# 1. Temp에 대한 히스토그램을 빈도를 기준으로 그리시오.
hist(airquality$Temp)
# 2. Temp에 대한 히스토그램을 확률 밀도로 그리시오.
hist(airquality$Temp, freq=FALSE)
# 3. Wind에 대한 히스토그램을 빈도를 기준으로 그리시오.
hist(airquality$Wind)
# 4. Wind에 대한 히스토그램을 확률 밀도로 그리시오.
hist(airquality$Wind, freq=FALSE)

# 밀도그림 (density)
plot(density(iris$Sepal.Width))

# 히스토그램과 함께 그리기
hist(iris$Sepal.Width, freq=FALSE)
lines(density(iris$Sepal.Width))

# rug(): 그래프의 X축에 데이터를 1차원으로 표시
plot(density(iris$Sepal.Width))
rug(jitter(iris$Sepal.Width))

# 밀도 그림 Lab
# airquality 데이터를 사용하여 다음을 수행하시오.

# 1. Temp의 밀도를 그리시오.
plot(density(airquality$Temp))

# 2. X축에 rug() 함수를 이용해서 데이터를 표시하시오.
rug(jitter(airquality$Temp))

# 3. Temp의 밀도 그림을 히스토그램과 함께 그리시오.
hist(airquality$Temp, freq=FALSE)
lines(density(airquality$Temp))

# 4. 위 과정을 Wind에 대해서 반복하시오.
plot(density(airquality$Wind))
rug(jitter(airquality$Wind))

hist(airquality$Wind, freq=FALSE)
lines(density(airquality$Wind))

# 막대 그래프(barplot)
tapply(iris$Sepal.Width,iris$Species, mean)
barplot(tapply(iris$Sepal.Width,iris$Species, mean))