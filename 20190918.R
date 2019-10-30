# 20190918

# 객체의 파일 입출력
x <- 1:5
y <- 6:10

save(x, y, file="xy.Rdata") # 출력
rm(list=ls()) # 변수 초기화
load("xy.Rdata") # 입력

rm(x) # 변수 x만 제거

## apply 계열 함수
mtx <- matrix(1:9, nrow=3)
sum(mtx[1,])

apply(mtx, 1, sum) # 행으로 계산
apply(mtx, 2, sum) # 열로 계산

head(iris)
apply(iris[,1:4], 2, sum)

result <- lapply(1:3, function(x) { x*2 })
result
result[1]
unlist(result)

lapply(iris[, 1:4], mean)

#### Lab3-1
# 1-1. swiss 데이터 각 컬럼의 평균을 colMeans() 함수를 사용하여 구하시오.
colMeans(swiss, na.rm = TRUE)

# 1-2. swiss 데이터 각 컬럼의 평균을 apply() 함수를 사용하여 구하시오.
str(swiss) # 구조 확인
x <- apply(swiss, 2, mean) # 행, 열 기준 상관없이 apply() 함수를 적용하면 행, 열 기준이 뒤바뀜

# 1-3. 결과를 데이터프레임으로 변환하시오.
class(x) # 결과 타입 확인 - numeric vector
x <- as.data.frame(x)
class(x) # 결과 타입 확인 - data.frame으로 변환됨 But, 컬럼의 열이 각 데이터의 인덱스로 오는 이슈 발생
x <- t(x) # 전치행렬(transpose) 처리

# 2-1. swiss 데이터 각 컬럼의 평균을 lapply() 함수를 사용하여 구하시오.
y <- lapply(swiss, mean) # 결과는 리스트로 반환
class(y) # 타입 확인 - 리스트

# 2-2. 결과를 데이터프레임으로 변환하시오.
y <- as.data.frame(y) # 리스트 -> 데이터 프레임 변환


# cont.
tapply(1:10, 1:10 %% 2 == 1, sum)

iris$Species
iris$Sepal.Length
tapply(iris$Sepal.Length, iris$Species, mean)

m <- matrix(1:8, ncol=2, dimnames=list(c("spring", "summer", "fall", "winter"), c("male", "female")))
tapply(m, list(c(1,1,2,2,1,1,2,2), c(1,1,1,1,2,2,2,2)), sum)