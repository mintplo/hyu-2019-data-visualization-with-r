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
