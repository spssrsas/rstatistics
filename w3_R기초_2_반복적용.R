#--------------------------------------------------------------------------
# 화일명 : w3_R기초_2_반복적용.R
# 설  명 : 통계 데이터 분석 (R기초 - 반복 적용 - Apply Family)
# 일  자 : 2020.11.09
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
# 반복 적용 - Apply Family
#--------------------------------------------------------------------------
# apply()
# lapply()
# sapply()
# mapply()


# apply
?apply()

# apply (행렬에 적용)
x <- matrix(1:20, 4, 5);x
apply(X=x, MARGIN = 1, FUN=max) # MARGIN = 1(행)
apply(X=x, MARGIN = 2, FUN=min) # MARGIN = 2(열)


# apply (array에 적용)
y <- array(1:24, c(4,3,2));y
apply(y, 1, paste, collapse=",") #첫번째 차원(행)에 대해 함수 적용

a <- c(1,5,9,13,17,21);a
paste(a)
paste(a, collapse=",")

apply(y, 2, paste, collapse=",") #두번째 차원(열)에 대해 함수 적용

apply(y, 3, paste, collapse=",") #세번째 차원(테이블)에 대해 함수 적용

# 차원 결합 조회
apply(y, c(1,2), paste, collapse=",")


Titanic
str(Titanic)
class(Titanic) # table
head(Titanic)
View(Titanic)
apply(Titanic, 1, sum)
apply(Titanic, "Class", sum)
apply(Titanic, 4, sum)

apply(Titanic, c(1,4), sum)


# 적용 데이터 셋이 리스트,데이터 프레임인 경우
# lapply()
# sapply() : lapply와의 차이점은 결과값에 대해 단순화(벡터->행렬->리스트 순)하여 출력해준다.
exams <- list(s20=c(78,89,91,85,95,98),
              s21=c(85,86,97,99,90),
              s22=c(98,96,89,90,93,85,92),
              s23=c(98,96,91,88,93,99))
exams
lapply(exams,length)
sapply(exams, length) # list 결과를 벡터 형태로 변환해서 출력

lapply(exams, mean)
sapply(exams, sd) # 벡터 형태로 결과값 출력

sapply(exams, range) # 각 원소당 최소값, 최대값

#data frame에 적용
head(iris)
lapply(iris, class) # 리스트 형태로 결과값 출력
sapply(iris, class) # 벡터 형태로 결과값 출력
sapply(iris, mean)
sapply(iris, function(x) ifelse(is.numeric(x), mean(x), NA))


# 복수개 데이터 셋에 적용
# mapply
mapply(rep, 1:4, 4:1)
rep(1,4)
rep(2,3)
rep(3,2)
rep(4,1)
