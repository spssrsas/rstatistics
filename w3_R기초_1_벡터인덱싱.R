#--------------------------------------------------------------------------
# 화일명 : w3_R기초_1_벡터인덱싱.R
# 설  명 : 통계 데이터 분석 (R기초 - 벡터인덱싱)
# 일  자 : 2020.11.08
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
# 벡터인덱싱
#--------------------------------------------------------------------------
# 벡터로부터 특정 위치의 원소를 선택하는 방법
num <- 0:30
num

prime <- c(2,3,5,7,11,13,17,19)
prime
prime[1]
prime[2]
prime[3]

prime[1:3]
prime[4:6]

prime[c(1,1,5,5)]
prime[c(1,3,5,7)]
prime[c(7,5,3,1)]

indices <- c(1,3,5,7)
prime[indices]

# 벡터에서 특정 원소 제거
prime[-1]
prime[-1:-3]
prime[-(1:3)]

# 마지막 원소 제외
length(prime)
prime[1:(length(prime)-1)]
prime[-length(prime)]

# 특정 원소 변경
prime <- c(2,4,5,7,11,14,17,18)
prime
prime[2] <- 3
prime
prime[c(6,8)] <- c(13,19)
prime

# 원소 추가
prime <- c(2,3,5,7,11,13,17,19)
prime
length(prime)
prime[9]
prime[9] <- 23
prime
prime[c(10,11)] <- c(29,31)
prime
# 건너띄워 추가한 원소 사이는 NA로 채워짐
prime[15] <- 47
prime


# 논리연산을 이용한 추출
prime <- c(2,3,5,7,11,13,17,19)
prime
prime < 10
prime[prime < 10]
prime %% 2 ==0
prime[prime %% 2 ==0]

# 매 2번째 원소 추출
seq_along(prime)
seq_along(prime) %% 2 ==0
prime[seq_along(prime) %% 2 ==0]
prime[c(FALSE,TRUE)] #벡터 Recycle 특성을 활용

# 매 3번째 원소 추출
prime[seq_along(prime) %% 3 ==0]
prime[c(FALSE,FALSE,TRUE)]


# 특정 위치 인덱스 조회
#which()
#which.min()
#which.max()

rainfall <- c(21.6,23.6,45.8,77.0,102.2,133.3,
              327.9,348.0,137.6,49.3,53.0,24.9);rainfall
length(rainfall)
rainfall > 100
which(rainfall > 100)
month.name[which(rainfall > 100)]
month.abb[which(rainfall > 100)]
which.max(rainfall)
month.name[which.max(rainfall)]
month.name[which.min(rainfall)]

rainfall
rainfall > 100
rainfall[rainfall > 100]
rainfall[which.min(rainfall)]
rainfall[which.max(rainfall)]

# 벡터 이름을 이용한 추출
traffic.death <- c(842,729,786,751,844,851,702)
traffic.death
names(traffic.death) <- c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")
traffic.death
traffic.death["Sat"]
traffic.death[c("Tue", "Thu", "Sun")]
weekend <- c("Fri", "Sat", "Sun")
traffic.death[weekend]

traffic.death > 800
traffic.death[traffic.death > 800]
names(traffic.death[traffic.death > 800])
