#--------------------------------------------------------------------------
# 화일명 : w4_통계데이터분석_3_데이터요약.R
# 설  명 : 통계 데이터 분석 (통계데이터분석 - 데이터 요약 - 연속형 변수)
# 일  자 : 2020.11.11
# 생성자 : Jigwan
# 패키지 : 
# 분석방법: 
#--------------------------------------------------------------------------

#--------------------------------------------------------------------------
# 0. 환경 설정
#--------------------------------------------------------------------------
## 작업 디렉토리 설정
#setwd("C:/work/RProject/rstatistics")
getwd()


#--------------------------------------------------------------------------
# 데이터 요약 - 연속형 변수 (개념)
#--------------------------------------------------------------------------
# 중심경향지표 (measures of central tendency)
# 데이터가 특정값을 중심으로 집중되어 있는 정도
# 1. 중위수 (median) : (작은값->큰값)크기 순으로 데이터값을 정렬했을 때 중앙에 위치하는 값
# 2. 백분위수 (quantile, percenfile) : 백분위의 비율로 분할하는 값
# 3. 사분위수 (quarfile) : 25번째, 50번째, 75번째 백분위수
# 4. 평균 (mean) : 데이터 표본에 포함된 관측값을 모두 더한 후 케이스의 개수(즉 표본의 크기)로 나눈 값

# 중심경향지표 만으로든 데이터값들이 서로 얼마나 다른지 파악이 불가

# 변동성지표 (measures of variability)
# 데이터의 산포 정도. 데이터가 퍼져 있는 정도
# 1. 범위 (range) : 가장 큰 값과 가장 작은 값의 차이
# 2. 사분위 범위 (interquartile range) : 75번째 백분위수와 25번째 백분위수 간의 차이
# 3. 분산 (variance) : 각 관츤값이 평균으로부터 떨어져 있는 정도
# 4. 표준편차 (standard deviation) : 분산의 제곱근값으로, 실제 값과 동일한 측정단위로 표현할 수 있음

#--------------------------------------------------------------------------
# 데이터 요약 - 연속형 변수
# 중심경향지표 (measures of central tendency)
#--------------------------------------------------------------------------
library(MASS)
str(survey)

# 중위수
median(survey$Pulse)
median(survey$Pulse, na.rm=T)

# 100분위 수
quantile(survey$Pulse, probs = 0.05, na.rm = T)
quantile(survey$Pulse, probs = 0.5, na.rm = T) # mdeian(중위수) 값과 동일
quantile(survey$Pulse, probs = c(0.5, 0.75), na.rm = T)


# 4분위 수
# Q1 : 1st quartile
# Q3 : 3rt quartile
?quantile
seq(0, 1, 0.25)
# probs 인수 없으면 4분위 수 출력
quantile(survey$Pulse, na.rm = T)


#--------------------------------------------------------------------------
# Exercise
#--------------------------------------------------------------------------
# 맥박수가 80인 비율
survey$Pulse <= 80 # TRUE:1, FALSE:0
mean(survey$Pulse <= 80, na.rm = T)

# 맥박수 평균
mean(survey$Pulse, na.rm = T)


#--------------------------------------------------------------------------
# summary 함수
#--------------------------------------------------------------------------
# 데이터 형태에 따라 다른 결과 출력
str(iris)
# 데이터 형태 : num
summary(iris$Sepal.Width) # Min, Median, Mean, Max
# 데이터 형태 : Factor
summary(iris$Species) # Facor별 빈도수
# 데이터 형태 : character
summary(as.character(iris$Sepal.Width)) # 관측값의 개수, 변수정보(Class,Mode)

# 행렬, 데이터프레임 전체에 적용
summary(iris)


# 리스트에 적용
irisList <- as.list(iris)
summary(irisList) # 관측값의 개수, 변수정보(Class,Mode)

lapply(irisList, summary)



# 중심경향지표 만으로든 데이터값들이 서로 얼마나 다른지 파악이 불가
#--------------------------------------------------------------------------
# 데이터 요약 - 연속형 변수
# 변동성지표 (measures of variability)
#--------------------------------------------------------------------------
range(survey$Pulse, na.rm = T) # 최소값, 최대값

var(survey$Pulse, na.rm = T) # 분산
sd(survey$Pulse, na.rm = T) # 표준편차


# 다양한 기술통계 요약
#--------------------------------------------------------------------------
# Exercise
#--------------------------------------------------------------------------
str(mtcars)

#install.packages("pastecs")
library(pastecs)
stat.desc(mtcars[c("mpg", "hp", "wt")])
summary(mtcars)

install.packages("psych")
library(psych)
describe(mtcars[c("mpg", "hp", "wt")])


#--------------------------------------------------------------------------
# 집단별 요약 (tapply)
#--------------------------------------------------------------------------
str(survey)
levels(survey$Exer)

# 운동별 습관에 따른 맥박수 통계
tapply(survey$Pulse, INDEX = survey$Exer, FUN = mean, na.rm=T)
# 성별 습관에 따른 맥박수 통계
tapply(survey$Pulse, INDEX = survey$Sex, FUN = mean, na.rm=T)
# 운동별, 성별 습관에 따른 맥박수 통계
tapply(survey$Pulse, INDEX = list(survey$Exer, survey$Sex), FUN = mean, na.rm=T)

#--------------------------------------------------------------------------
# 집단별 요약 (aggregate, by)
#--------------------------------------------------------------------------
aggregate(survey$Pulse, by=list(Exercise=survey$Exer), FUN=mean, na.rm = T)
aggregate(survey$Pulse, by=list(Exercise=survey$Exer, Sex=survey$Sex), FUN=mean, na.rm = T)

aggregate(survey[c("Pulse", "Age")], 
          by=list(Exercise=survey$Exer, 
                  Sex=survey$Sex), 
          FUN=mean, na.rm = T)


# 사용자 정의 함수 (기술 통계)
myStats <- function(x, na.rm=F){
  if(na.rm) x <- x[!is.na(x)]
  n <- length(x)
  mean <- mean(x)
  sd <- sd(x)
  skew  <- sum((x-mean)^3/sd^3)/n
  kurt <- sum((x-mean)^4/sd^4)/n -3
  return(c(n=n, mean=mean, sd=sd,
           skewness=skew, kurtosis=kurt))
}

# aggregate
aggregate(survey[c("Pulse", "Age")], 
          by=list(Exercise=survey$Exer, 
                  Sex=survey$Sex), 
          FUN=myStats, na.rm = T)

# by
by(survey[c("Pulse", "Age")],
   INDICES = list(Exercise=survey$Exer),
   FUN = summary)

aggregate(survey[c("Pulse", "Age")],
   by = list(Exercise=survey$Exer),
   FUN = summary)


by(survey[c("Pulse", "Age")],
   INDICES = list(Exercise=survey$Exer),
   FUN = function(x) sapply(x, myStats, na.rm=T))

# describe (psych 패키지)
describeBy(survey[c("Pulse", "Age")],
           group = list(Exercise=survey$Exer))
