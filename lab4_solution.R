# 다음 패키지를 설치하고, 패키지 내의 Fruits 데이터를 Fruits_lab 변수에 할당하시오.
install.packages("googleVis")
library(googleVis)


# Expenses 필드를 기준으로 값이 80 이상인 행들을 확인하시오.
filter(fruits_lab, Expenses >80)


# Expenses 필드의 값이 90 보다 크고, Sales 값이 90 보다 큰 값을 갖는 행들을 확인하시오.
fruits_lab %>%
  filter(Expenses > 80 & Sales > 90)


# Expenses 필드의 값이 90 보다 크거나 또는, Sales 값이 80 보다 큰 값을 갖는 행들을 확인하시오.
fruits_lab %>%
  filter(Expenses > 90 | Sales > 80)


# Expenses 필드의 값이 79와 91인 행만 확인하시오.
filter(fruits_lab, Expenses %in% c(79,91))


# Fruit 필드의 과일 이름별 판매(Sales)량 합계를 확인하시오.
lab_fruits %>%
  group_by(Fruit)%>%
  summarise_at(vars(Sales),sum, na.rm=T)


# Fruit 필드의 과일 이름별 판매량(Sales)과 이익(Profit)의 합계를 확인하시오.
fruits_lab %>%
  group_by(Fruit)%>%
  summarise_at(vars(Sales, Profit),sum, na.rm=T)
