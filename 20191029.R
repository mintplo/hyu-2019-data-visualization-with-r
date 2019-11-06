# 20191029

# 제어문
if (TRUE) {
  print("TRUE")
  print("HELLO")
} else {
  print("FALSE")
  print("world")
}

# ifelse
x <- c(1, 2, 3, 4, 5)
ifelse(x %% 2 == 0, "even", "odd")

# for, while, repeat
for (i in 1:10) {
  print(i)
}

i <- 1
while (i <= 10) {
  print(i)
  i <- i+1
}

i <- 1
repeat {
  print(i)
  if (i >= 10) {
    break
  }

  i <- i+1
}

# 짝수만 출력 with next
for (i in seq(2, 10, by=2)) {
  print(i)
}

i <- 0
while (i <= 9) {
  i <- i+1
  if (i %% 2 != 0) {
    next
  }
  print(i)
}

i <- 0
repeat {
  i <- i+1
  if (i > 9) {
    break
  }

  if (i %% 2 != 0) {
    next
  }

  print(i)
}

?paste
# 제어문 Lab
# 1. 구구단을 출력하는 프로그램을 for 문을 사용하여 작성하시오.
for (i in 1:9) {
  print(paste('=========== ', i, 'times'))
  for (j in 1:9) {
    print(paste(i, '*', j, '=', i*j))
  }
}

# 2. 구구단을 출력하는 프로그램을 while 문을 사용하여 작성하시오.
i <- 1
j <- 1

while(i <= 9) {
  print(paste('=========== ', i, 'times'))

  while (j <= 9) {
    print(paste(i, '*', j, '=', i*j))
    j <- j + 1
  }
  
  i <- i + 1
  j <- 1
}

# 3. 구구단을 출력하는 프로그램을 repeat 문을 사용하여 작성하시오.
i <- 1
j <- 1

repeat {
  if (i > 9) {
    break
  }

  print(paste('=========== ', i, 'times table'))

  repeat {
    if (j > 9) {
      break
    }

    print(paste(i, '*', j, '=', i*j))
    j <- j + 1
  }

  j <- 1
  i <- i + 1
}

# 4. 다음과 같이 출력하는 프로그램을 for 문을 사용하여 작성하시오.
for (i in 1:10) {
  str <- ''
  for (j in 1:i) {
    str <- paste(str, '*')
  }
  print(str)
}

## Sol
for (i in 1:10) {
  print(rep("*", i))
}

# 5. 다음과 같이 출력하는 프로그램을 while 문을 사용하여 작성하시오.

i <- 1
j <- 1
while (i <= 10) {
  str <- ''
  while (j <= i) {
    str <- paste(str, '*')
    j <- j + 1
  }
  print(str)
  j <- 1
  i <- i + 1
}

# 6. 다음과 같이 출력하는 프로그램을 repeat 문을 사용하여 작성하시오.
i <- 1
j <- 1

repeat {
  if (i > 10) {
    break
  }

  str <- ''
  repeat {
    if (i < j) {
      break
    }

    str <- paste(str, '*')
    j <- j + 1
  }
  print(str)

  i <- i + 1
  j <- 1
}

# 7. 다음과 같이 출력하는 프로그램을 for 문을 사용하여 작성하시오.
for (i in 10:1) {
  str <- ''
  for (j in 1:i) {
    str <- paste(str, '*')
  }
  print(str)
}

# 8. 다음과 같이 출력하는 프로그램을 while 문을 사용하여 작성하시오.

i <- 10
j <- 1
while (i >= 1) {
  str <- ''
  while (j <= i) {
    str <- paste(str, '*')
    j <- j + 1
  }
  print(str)
  j <- 1
  i <- i - 1
}

# 9. 다음과 같이 출력하는 프로그램을 repeat 문을 사용하여 작성하시오.
i <- 10
j <- 1

repeat {
  if (i < 1) {
    break
  }
  
  str <- ''
  repeat {
    if (i < j) {
      break
    }
    
    str <- paste(str, '*')
    j <- j + 1
  }
  print(str)
  
  i <- i - 1
  j <- 1
}
