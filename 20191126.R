# 20191126
library(ggplot2)
library(ggthemes)

# 그래프 기본 설정
DF <- read.csv("example_studentlist.csv")

# 그래프 종류 결정하기 - geom
g1 <- ggplot(data=DF, aes(x=height, y=weight, colour=bloodtype))
g1 + geom_point()
g1 + geom_line()
g1 + geom_line() + geom_point()
g1 + geom_line(size=1) + geom_point(size=10)

ggplot(data=DF, aes(x=name, y=weight, colour=bloodtype, size=height)) + geom_point()

# 그래프 분할하기 - facet
g1 + geom_line(size=1) + geom_point(size=10) + facet_grid(sex~.)
g1 + geom_line(size=1) + geom_point(size=10) + facet_grid(.~sex)
g1 + geom_line(size=1) + geom_point(size=10) + facet_grid(bloodtype~sex)

# 여러 그래프 나타내기 - grid.arrange
install.packages("gridExtra")
library(gridExtra)

g2 <- g1 + geom_line(size=1) + geom_point(size=10) + facet_grid(sex~.)
g3 <- g1 + geom_line(size=1) + geom_point(size=10) + facet_grid(.~sex)
g4 <- g1 + geom_line(size=1) + geom_point(size=10) + facet_grid(bloodtype~sex)

grid.arrange(g1, g2, g3, g4, nrow = 2, ncol = 2)

# 데이터 레이블 추가하기 - geom_text()
g1 + geom_point(aes(colour=sex), size=7) + geom_text(aes(label=name))
g1 + geom_point(aes(colour=sex), size = 7) + geom_text(aes(label = name), hjust = 1.2, vjust = 1, colour = "grey35")

# 데이터 x,y 축 범위 조정하기 - coord_cartesian()
g5 <- g1 + geom_point(aes(colour=sex), size = 7) + geom_text(aes(label = name), hjust = 1.2, vjust = 1, colour = "grey35")
start_x<- min(DF$height)
end_x <- max(DF$height)
start_y <- min(DF$weight)
end_y <- max(DF$weight)
g5 + coord_cartesian(xlim = c(start_x - 10, end_x), ylim =c(start_y - 10, end_y))

# 그래프 제목, 부제목, 주석, 축 이름 변경
g5 + labs(title = "키와 몸무게", subtitle="혈액형 구분", caption = "2018-11-26", x = "키", y= "몸무게")

# 범례 추가하기
g1 + geom_point(aes(colour=sex), size = 7, show.legend = T)

# 막대 그래프
ggplot(DF, aes(x = bloodtype, fill = sex)) + geom_bar()
ggplot(DF, aes(x = bloodtype, fill = sex)) + geom_bar(position = "fill")
