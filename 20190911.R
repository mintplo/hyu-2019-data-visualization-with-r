# 2019/09/11 WED

x <- matrix(c(1,2,3,4), nrow=2, ncol=2)
x

x <- matrix(c(1,2,3,4))
y <- matrix(c(1,2,3,4), nrow=2, ncol=2, byrow=T) # 행 우선 배열 방식으로 생성하도록 수정

r1 <- c(1,4,7)
r2 <- c(2,5,8)
r3 <- c(3,6,9)

rbind(r1, r2, r3) # 행 기준으로 벡터 묶기

c1 <- 1:3
c2 <- 4:6
c3 <- 7:9

cbind(c1, c2, c3) # 열 기준으로 벡터 묶기

nrow(a) # 행의 수 반환

m1 <- matrix(1:4, nrow=2)
m2 <- matrix(5:8, nrow=2)

m1 %*% m2

solve(m1) # m1의 역행렬
t(m1) # m1의 전치행렬
t(m1) %*% m1


# Lab 1

#1 연산자를 이용하여 다음 벡터를 생성하시오.
a <- 1:10
b <- 10:1
c <- c(1:10, 9:1)

#2 변수 x에 1부터 10까지의 값을 할당하고, 변수 y에 3부터 1까지의 값을 할당한 후 x + y 연산을 수행하여 결과를 확인하시오.
x <- 1:10
y <- 3:1
x + y

#3 pi=3.141593에 대해 다음 코드를 수행하고, 출력 결과를 확인하시오.
round(pi)
round(pi, digits=3)

#4 다음 연산을 수행하고 결과를 확인하시오.
c(TRUE, TRUE, FALSE, FALSE) & c(TRUE, FALSE, TRUE, FALSE)
c(TRUE, TRUE, FALSE, FALSE) | c(TRUE, FALSE, TRUE, FALSE)

!c(TRUE, TRUE, FALSE, FALSE) & c(TRUE, FALSE, TRUE, FALSE)
!c(TRUE, TRUE, FALSE, FALSE) | c(TRUE, FALSE, TRUE, FALSE)

#5 벡터의 합계를 산출하는 sum() 함수와 논리 연산을 이용하여, 1에서 100까지의 정수 가운데 7의 배수인 정수의 개수를 구하시오.
a <- 1:100
b <- as.logical(a %% 7 == 0)
sum(1:100%%7==0)
sum(b)

#6 주사위를 일곱 번 던져서 나온 3,2,5,1,5,6,5의 값을 1,2,3,4,5,6의 레벨을 갖는 팩터로 저장하고 레벨의 이름은
#one, two, three, four, five, siz로 이름을 부여하시오. 
f = factor(c(3, 2, 5, 1, 5, 6, 5), levels=c(1, 2, 3, 4, 5, 6), labels=c("one", "two", "three", "four", "five", "six"))
f

#7
heights = c(1.79, 1.61, 1.65, 1.85, 1.58)
weights = c(75, 72, 60, 100, 65)

bmi = weights/(heights**2)

subset(weights, bmi > 25)
weights[bmi > 25]
weights[which(bmi > 25)]