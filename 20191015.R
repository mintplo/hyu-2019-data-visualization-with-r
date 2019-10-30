# 20191015

# sqldf library
install.packages('sqldf')
library(sqldf)
library(googleVis)

Fruits
str(Fruits)

sqldf('SELECT * FROM Fruits')
sqldf('SELECT * FROM Fruits where Fruit=\'Apples\'')
sqldf('SELECT * FROM Fruits order by Year desc')
sqldf('SELECT sum(Sales) as total_sales from Fruits')
sqldf('SELECT max(sales) FROM Fruits')
sqldf('SELECT min(sales) FROM Fruits')
sqldf('SELECT avg(sales) FROM Fruits')
sqldf('SELECT Fruit, sum(Sales) FROM Fruits GROUP BY Fruit')
sqldf('SELECT Fruit, avg(Sales) FROM Fruits GROUP BY Fruit')
sqldf('SELECT count(*) FROM Fruits')

# 조인 및 삭제 해야 함

# Lab - sqldf()
sqldf('SELECT * FROM Fruits WHERE Expenses > 80')
sqldf('SELECT * FROM Fruits WHERE Expenses > 90 AND Sales > 80')
sqldf('SELECT * FROM Fruits WHERE Expenses > 90 OR Sales > 80')
sqldf('SELECT * FROM Fruits WHERE Expenses = 79 OR Expenses = 91')
sqldf('SELECT Fruit, sum(Sales) FROM Fruits GROUP BY Fruit')
sqldf('SELECT Fruit, sum(Sales), sum(Profit) FROM Fruits GROUP BY Fruit')
