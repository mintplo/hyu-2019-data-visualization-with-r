v1 <- c(1, 2, 3, "5") # 같은 타입이 아니면 같은 타입으로 캐스팅. (문자열 우선순위 높다.)
names(v1)
names(v1) <- c("kim", "lee", "park", "dan") # 각 셀에 이름 부여
v1

v2 <- c(1, 2, 3, c(4, 5, 6)) # 2차원 벡터는 불가능. 1차원 배열로 풀린다.

a <- 100000; print(a);
b <- 1000000; print(b);
c <- 1e4; print(c);
d <- 1e-4; print(d)
e <- 3e4; print(e)

# 범주형(Factor)
gender <- factor("m", c("m", "f"))
nlevels(gender)
levels(gender)
levels(gender)[1]

levels(gender) <- c("male", "female")
gender

factor(c("m", "m", "f"), c("m", "f"))
?factor

ordered("a", c("a", "b", "c"))

# 논리형
a <- c("1", "0", "1")
as.logical(a)
as.list(a)

w <- as.logical(c(1, 0, 1))

x <- c(TRUE, TRUE)
y <- c(TRUE, FALSE)

# 날짜와 시간
Sys.Date() # 현재 날짜 확인
Sys.time() # 현재 날짜와 시간 확인
date() # 미국식 날짜와 시간 표기

as.Date('2014-11-01') # 날짜 변환
as.Date('2014/11/01')

as.Date('01-11-2014', format = '%d-%m-%Y') # 날짜 형태 지정
as.Date('2014년 11월 1일', format = '%Y년 %m월 %d일')

# 벡터 데이터 접근
length(x)

# 벡터 데이터 이름을 사용한 접근
y <- c("1", "2", "3")
names(y) <- c("kim", "lee", "park")
y[c("kim", "park")]

# 객체가 동일한지 판단
identical(c(1,2,3), c(1,2,3))

# 벡터 연산, 어떤 값이 벡터에 포함되어 있는지 판단
names <- c("kim", "choi", "lee")
"choi" %in% names

# 벡터 전체 값에 대한 연산을 한 번에 수행하려면 벡터를 마치 하나의 숫자처럼 생각하고 연산하면 됨
a <- c(1, 3, 5)
a+1

# 규칙성 있는 벡터 생성
1 : 5
seq(1, 5, by=2)
x = rep(1:5, times=3)
unique(x)

x <- c(1,2,3,4,5)
subset(x, x<4)
which(x<4)