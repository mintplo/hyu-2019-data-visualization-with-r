# Lab3 Solution

#swiss 데이터 각 컬럼의 평균을 colMeans() 함수를 사용하여 구하시오.
colMeans(swiss)

#swiss 데이터 각 컬럼의 평균을 apply() 함수를 사용하여 구하시오.
swiss_mean <-apply(swiss, 2, mean)


#결과를 데이터프레임으로 변환하시오.
class(swiss_mean)
swiss_mean <- as.data.frame(swiss_mean)
class(swiss_mean)


#swiss 데이터 각 컬럼의 평균을 lapply() 함수를 사용하여 구하시오.
lst_swiss<-lapply(swiss, mean)
class(lst_swiss)


#결과를 데이터프레임으로 변환하시오.
lst_swiss <- as.data.frame(lst_swiss)
class(lst_swiss)


# airquality 데이터가 어떤 데이터인지 확인하시오.
summary(airquality)
str(airquality)


#월별 평균 온도(Temp)를 tapply()를 사용하여 구하시오.
tapply(airquality$Temp, airquality$Month, mean)


#월별 평균 오존량(Ozone)을 tapply()를 사용하여 구하시오.
tapply(airquality$Ozone, airquality$Month, mean, na.rm=TRUE)


# airquality 데이터에서 Ozone, Solar.R, Wind, Temp의 평균을 mapply()를 사용하여 구하시오.
mapply(mean, airquality[,1:4], na.rm=TRUE)


# summary() 함수를 이용하여 각 필드의 특징들을 확인하시오.
summary(airquality)


# summaryBy() 함수를 이용하여, 월별, Ozone, Solar.R, Wind, Temp 평균값을 구하시오.
summaryBy(Ozone+Solar.R+Wind+Temp~Month,airquality,na.rm=TRUE)


# order() 함수를 이용한 Temp 순으로 정렬하시오.
airquality[order(airquality$Temp),]


# orderBy() 함수를 이용하여 Temp 순으로 정렬하시오.
order(airquality$Temp)


# sample() 함수를 이용하여 10개를 샘플링하시오.
airquality[sample(1:nrow(airquality),10),]


# sampleBy() 함수를 이용하여 월별로 10%의 데이터를  샘플링하시오. 
sampleBy(~Month, frac=0.1, data=airquality)


#split() 함수를 사용하여 월별로 데이터를 분리하시오.
split(airquality,airquality$Month)


#subset() 함수를 사용하여 5월 데이터만 추출하시오.
subset(airquality, Month==5)


#subset() 함수를 사용하여 Temp가 90을 넘어선 레코드만 추출하시오.
subset(airquality, Temp>90)


#subset() 함수를 사용하여 Temp가 90을 넘어선 월, 일만 추출하시오.
subset(airquality, Temp>90, select=c(Month,Day))


#위와 동일한 결과를 subset() 함수를 사용하지 않고 구하시오.
airquality[airquality$Temp>90,names(airquality) %in% c("Month","Day")]


# 다음 두 테이블에 해당하는 데이터프레임 a,b를 만드시오.
a<-data.frame(ID=c("S01","S02","S03"),Name=c("Kim","Lee","Park"),Age=c(30,20,25))
b<-data.frame(SSN=c("S01","S03","S05"),Gender=c("F","M","M"),Married=c("M","S","S"))


#두 데이터프레임을 병합하여 데이터프레임 c를 만드시오.
c<-merge(a,b,by.x="ID", by.y="SSN")


#대응되는 값이 없는 경우 NA를 포함하도록 병합하여 데이터프레임 d를 만드시오.
d<-merge(a,b,by.x="ID", by.y="SSN",all=TRUE)


#airquality 데이터의 Temp 값을 오름차순으로 정렬하시오.
sort(airquality$Temp)


#airquality 데이터의 Temp 값을 내림차순으로 정렬하시오.
sort(airquality$Temp,decreasing=TRUE)


#airquality 데이터의 Ozone 값을 오름차순으로 정렬하시오.
sort(airquality$Ozone)


#위 결과에서 NA 값들을 뒤에 표시하도록 하시오.
sort(airquality$Ozone,na.last=TRUE)


#위 결과에서 NA 값들을 앞에 표시하도록 하시오.
sort(airquality$Ozone,na.last=FALSE)


#airquality 데이터 전체를 Temp 내림차순으로 정렬하시오.
airquality[order(airquality$Temp, decreasing=TRUE),]


#airqualtiy 데이터 전체를 Ozone 내림차순으로 정렬하시오. 단 NA는 아래 위치하도록 하시오.
airquality[order(airquality$Ozone, decreasing=TRUE),]


#airqualtiy 데이터 전체를 Ozone 내림차순으로 정렬하시오. 단 NA는 위에 위치하도록 하시오.
airquality[order(airquality$Ozone, decreasing=TRUE, na.last=FALSE),]


#with()를 이용하여 airquality 데이터의 Ozone과 Temp의 평균을 구하시오.
airquality1<-airquality
with(airquality1, {
  print(mean(Ozone, na.rm=TRUE))
  print(mean(Temp))
})


#with() 함수를 이용하여 Ozone의 NA값들을 중간값으로 변경하시오. with() 함수 수행 후에도 변경 내용이 유지되는지 확인하시오.
with(airquality1, {
  Ozone<-ifelse(is.na(Ozone),median(Ozone, na.rm=TRUE),Ozone)
})


#within() 함수를 이용해서 위와 동일한 작업을 수행하시오.
within(airquality1, {
  Ozone<-ifelse(is.na(Ozone),median(Ozone, na.rm=TRUE),Ozone)
})


#attach(), detach() 함수를 이용하여 Solar.R의 NA값들을 중간값으로 변경하시오. 또 detach() 함수 수행 후에도 변경 내용이 유지되는 지 확인하시오.
attach(airquality1)
Solar.R<-ifelse(is.na(Solar.R),median(Solar.R,na.rm=TRUE),Solar.R)
head(airquality1)
detach(airquality1)
head(airquality1)


#subset() 함수를 이용해서 5월의 데이터만 선택하시오.
subset(airquality, Month==5)


#subset() 함수를 사용하지 말고, 5월의 데이터만 선택하시오.
airquality[airquality$Month==5,]


#which() 함수를 사용하여, 5월 데이터의 색인을 찾으시오.
which(airquality$Month==5)


#온도 중 최대값, 최소값의 인덱스를 구하시오. 이를 이용해서 해당 월, 일을 구하시오.
which.min(airquality$Temp)
which.max(airquality$Temp)
airquality[which.min(airquality$Temp),c("Month","Day")]
airquality[which.max(airquality$Temp),c("Month","Day")]


#aggregate() 함수를 사용하여 월별 평균 온도(Temp)를 구하시오.
aggregate(Temp~Month,airquality, mean)


#tapply() 함수를 사용하여 월별 평균 온도를 구하시오.
tapply(airquality$Temp, airquality$Month, mean)


#aggregate() 함수를 사용하여 월별 평균 Ozone량을 구하시오.
aggregate(Ozone~Month, airquality, mean)


#tapply() 함수를 사용하여 월별 평균 Ozone량을 구하시오.
tapply(airquality$Ozone, airquality$Month, mean, na.rm=TRUE)