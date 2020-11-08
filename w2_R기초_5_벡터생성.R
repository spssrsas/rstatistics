#--------------------------------------------------------------------------
# 화일명 : w2_R기초_5_벡터생성.R
# 설  명 : 통계 데이터 분석 (R기초 - 벡터생성)
# 일  자 : 2020.11.07
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
# 벡터생성
#--------------------------------------------------------------------------
#벡터 결합
c(1,2,3,4,5,6,7,8,9,10)
c("we", "love", "data", "analytics")
c(TRUE, FALSE, TRUE, FALSE)

odd <- c(1,3,5)
even <- c(2,4,6)
odd
even
c(odd, even)

#수열 (: 콜론 연산자)
3:9
9:3
5:-3

?seq()
seq(from=3, to=9)
seq(from=3, to=9, by=2)
seq(from=3.5, to=1.5, by=-0.5)

seq(from=0, to =100, length.out = 5) #length.out : 전체 원소의 개수
seq(from=-1, to=1, length.out = 5)


#반복
?rep()
rep(1, times=3)
rep(c(1,2,3), times=3)
rep(c(1,2,3), each=3)
rep(c(1,2,3), times=c(1,2,3))

rep(c(1,2,3), length.out=8)


#type 통일
num <- c(1,2,3)
char <- c("X", "Y", "Z")
#숫자+문자 = 문자
c_num_char <- c(num, char)
typeof(c_num_char)
class((c_num_char))
str(c_num_char)
str(num)


#벡터의 길이
length(c_num_char)


#미리 정해진 상수 베터
LETTERS
letters
month.name
month.abb
pi

month <- c(12,3,5,1)
month
month.name
month.name[month]
