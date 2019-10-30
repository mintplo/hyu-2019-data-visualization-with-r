# 20191009

install.packages("dplyr")
library(dplyr)

data1 <- read.csv("2013_baseball.csv")
data1
str(data1)
head(data1)

data2 <- filter(data1, 경기>120)
data3 <- filter(data1, 경기 > 120 & 득점 > 80)
data4 <- filter(data1, 포지션 %in% c('1루수', '3루수'))
data4 <- filter(data1, 포지션 == "1루수" | 포지션 == "3루수")
select(data1, 선수명, 포지션, 팀)
select(data1, 순위:타수)
select(data1, -홈런, -타점, -도루)

data1 %>%
  select(선수명, 팀, 경기, 타수) %>%
  filter(타수 > 400)

data1 %>%
  select(선수명, 팀, 경기, 타수) %>%
  filter(타수 > 400) %>%
  arrange(desc(타수))

data1 %>% select(선수명, 경기 ,팀, 타수) %>%
  mutate(경기x타수 = 경기*타수) %>%
  arrange(경기x타수)

data1 %>%
  group_by(팀) %>%
  summarise(average = mean(경기, na.rm=TRUE))

data1 %>%
  group_by(팀) %>%
  summarise_at(vars(경기, 타수), mean)

data1 %>%
  group_by(팀) %>%
  summarise_at(c("경기", "타수"), mean)

## Lab
# 다음 패키지를 설치하고, 패키지 내의 Fruits 데이터를 Fruits_lab 변수에 할당하시오
install.packages("googleVis")
library(googleVis)

Fruits_lab = Fruits

# Expenses 필드를 기준으로 값이 80 이상인 행들을 확인하시오.
fruit1 <- filter(Fruits_lab, Expenses >= 80)

# Expenses 필드의 값이 90 보다 크고, Sales 값이 90 보다 큰 값을 갖는 행들을 확인하시오.
fruit2 <- filter(Fruits_lab, Expenses >= 90 & Sales >= 90)

# Expenses 필드의 값이 90 보다 크거나 또는, Sales 값이 80 보다 큰 값을 갖 는 행들을 확인하시오.
fruit3 <- filter(Fruits_lab, Expenses >=90 | Sales >= 90)

# Expenses 필드의 값이 79와 91인 행만 확인하시오.
fruit4 <- filter(Fruits_lab, Expenses == 79 | Expenses == 91)
fruit4 <- filter(Fruits_lab, Expenses %in% c(79, 91))

# Fruit 필드의 과일 이름별 판매(Sales)량 합계를 확인하시오.
Fruits_lab %>%
  group_by(Fruit) %>%
  summarise(Total_sales = sum(Sales, na.rm=TRUE))

# Fruit 필드의 과일 이름별 판매량(Sales)과 이익(Profit)의 합계를 확인하시오.
Fruits_lab %>%
  group_by(Fruit) %>%
  summarise(Sales_sum = sum(Sales), Profit_sum = sum(Profit), Double_sum = sum(Sales, Profit))

Fruits_lab %>%
  group_by(Fruit) %>%
  summarise_at(vars(Sales, Profit), sum, na.rm=TRUE)
