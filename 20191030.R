# 20191030

# 함수의 정의
mysum <- function (a, b) {
  return (a+b)
}
a = 3
b = 5

mysum(a, b)

a = 1:5
b = seq(2, 10, 2)
mysum(a, b)

# 피보나치 수
fibo <- function(n) {
  if (n == 1 || n == 2) {
    return(1)
  }
  return(fibo(n-1)+fibo(n-2))
}
fibo(1)
fibo(5)

# 함수의 인수 넘겨주기
f <- function(x, y) {
  print(x)
  print(y)
}
f(1,2)
f(y=1, x=2)

# 개수를 알 수 없는 임의의 인자를 표현
f <- function(...) {
  args <- list(...)
  for (a in args) {
    print(a)
  }
}
f('3', '4')

g <- function(z, ...) {
  print(z)
  f(...)
}
g(1, 2, 3)

# Nested function
f <- function(x, y) {
  print(x)
  g <- function(y) {
    print(y)
  }
  g(y)
}
f(1, 2)

f <- function(x1) {
  return (function(x2) {
    return(x1+x2)
  })
}
g <- f(1)
g(2)

g2 <- f(2)
g2(2)

### 함수 Lab1
#1. 2와 9 사이의 정수를 주면, 이에 해당하는 구구단(예를 들어, 2를 주면, 2단을)을 출력하는 함수 times_table() 을 작성하시오.
times_table <- function(n) {
  print(paste('===========', n, 'times'))
  for (i in 1:9) {
    print(paste(n, '*', i, '=', n*i))
  }
}
times_table(2)

#2. for 문과 times_table()을 사용하여 2단부터 9단까지 출력하시오.
for (i in 1:9) {
  times_table(i)
}

#3. 주어진 벡터에서 최대값을 반환하는 함수 my_max()를 작성 하시오.
my_max <- function(vector) {
  temp_max <- 0
  for (i in vector) {
    if (temp_max >= i) {
      next
    }

    temp_max = i
  }

  return(temp_max)
}

my_max(c(1, 5, 3))
my_max(1:100)

# 문법적 스코프
n <- 1
f <- function() {
  print(n)
}
f()
n <- 2
f()

# 전역 변수와 같은 이름의 지역 변수를 사용하면, 함수 내부의 지역 변수가 우선
n <- 100
f <- function() {
  n <- 1
  print(n)
}
f()

rm(list=ls())
f <- function() {
  print(n)
}
f()

# 함수 내부에서 정의한 이름은 함수 바깥에서 접근할 수 없음
rm(list=ls())
f <- function() {
  n <- 1
}
f()
n

# 함수 인자의 변수명도 전역 변수보다 우선함
n <- 100
f <- function(n) {
  print(n)
}
f(1)

# 중첩 함수에도 같은 규칙 적용
f <- function(x) {
  a <- 2
  g <- function(y) {
    print(y+a)
  }
  g(x)
}
f(1)

# f()에 변수 a가 없으면 전역 변수 사용
a <- 100
f <- function(x) {
  g <- function(y) {
    print(y+a)
  }
  g(x)
}
f(1)

# 내부 블록에서 외부 블록에 선언된 값을 수정할 때 주의 필요
f <- function() {
  a <- 1
  g <- function() {
    a <<- 2
    print(a)
  }
  g()
  print(a)
}
f()

# 값에 의한 전달
f <- function(df2) {
  df$a <- c(1,2,3)
}
df <- data.frame(a=c(4,5,6))
f(df)
df

f <- function(df2) {
  df$a <- c(1,2,3)
  return(df)
}
df <- data.frame(a=c(4,5,6))
df <- f(df)
df

##
# Scope Lab
##

# 1. 전역변수 a, b, c를 선언하고 각각의 값을 1, 2, 3으로 할당하시 오.
a <- 1
b <- 2
c <- 3

# 2. 함수 f()를 정의하시오. 함수 f()는 인수는 없고,
# 내부적으로 a, b, c 변수와 내부에 g() 함수를 가진다.
# f() 함수에서 a, b, c 값은 4, 5, 6을 가진다.
# f()에 포함되어 있는 g()도 a,b,c 변수를 가지고 값은 7,8,9를 가진다.

f <- function() {
  a <- 4
  b <- 5
  c <- 6

  g <- function() {
    a <- 7
    b <- 8
    c <- 9
  }
}
f()
a
b
c

# 3. 앞의 코드와 같이 f()를 실행한 후의 전역변수 a, b, c 값은 1,2,3이다.
# f() 실행 후 전역변수 a, b, c의 값이 4,5,6이 되도록 코드를 변경하시오.

f <- function() {
  a <<- 4
  b <<- 5
  c <<- 6
  
  g <- function() {
    a <- 7
    b <- 8
    c <- 9
  }
}
f()
a
b
c

# 4. 또 f() 실행 후 전역변수 a, b, c의 값이 7,8,9이 되도록 코드를 변경하시오. [???]

f <- function() {
  a <<- 4
  b <<- 5
  c <<- 6
  
  g <- function() {
    a <<- 7
    b <<- 8
    c <<- 9
  }
  g()
}
f()
a
b
c
