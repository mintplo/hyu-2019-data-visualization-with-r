# Lab 1

#1 연산자를 이용하여 다음 벡터를 생성하시오.
a <- c(1:10)
b <- c(10:1)
c <- c(1:10, 9:1)


#2 변수 x에 1부터 10까지의 값을 할당하고, 변수 y에 3부터 1까지의 값을 할당한 후 x + y 연산을 수행하여 결과를 확인하시오.
x <-c(1:10)
y <-c(3:1)
x+y


#3 pi=3.141593에 대해 다음 코드를 수행하고, 출력 결과를 확인하시오.
round(pi)
round(pi, digits=3)


dice_result <- c(3, 2, 5, 1, 5, 6)
dice_factor <-factor(dice_result, levels=c(1,2,3,4,5,6), labels=c("one","two","three","four","five","six"))
table(dice_factor)


#4. 다음 연산을 수행하고 결과를 확인하시오.
c(TRUE, TRUE, FALSE, FALSE) & c(TRUE, FALSE, TRUE, FALSE)
c(TRUE, TRUE, FALSE, FALSE) | c(TRUE, FALSE, TRUE, FALSE)

!c(TRUE, TRUE, FALSE, FALSE) & c(TRUE, FALSE, TRUE, FALSE)
!c(TRUE, TRUE, FALSE, FALSE) | c(TRUE, FALSE, TRUE, FALSE)


#5. 벡터의 합계를 산출하는 sum() 함수와 논리 연산을 이용하여, 1에서 100까지의 정수 가운데 7의 배수인 정수의 개수를 구하시오.
sum(1:100%%7==0)


#6. 주사위를 일곱 번 던져서 나온 3, 2, 5, 1, 5, 6, 5의 값을 1, 2, 3, 4, 5, 6의 레벨을 갖는 팩터로 저장하고, 레벨의 이름은 one, two, three, four, five, six로 이름을 부여하시오.
dice_factor = factor(c(3,2,5,1,5,6,5), levels=c(1,2,3,4,5,6),labels=c("one","two","three","four","five","six"))
dice_factor

#7. 키가 1.79m, 1.61m, 1.65m, 1.85m, 1.58m이고, 몸무게가 각각 75kg, 72kg, 60kg, 100kg, 65kg인 다섯 사람에 대하여 다음 작업을 수행하시오.

heights = c(1.79,1.61,1.65,1.85,1.58)
weights = c(75,72,60,100,65)

bmi = weights/(heights**2)
bmi
weights[bmi > 25]
subset(weights, bmi > 25)
weights[which(bmi > 25)]