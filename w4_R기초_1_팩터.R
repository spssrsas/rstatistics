#--------------------------------------------------------------------------
# 화일명 : w4_R기초_1_팩터.R
# 설  명 : 통계 데이터 분석 (R기초 - 팩터)
# 일  자 : 2020.11.12
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
# 팩터 (level을 원소로 하는 벡터)
#--------------------------------------------------------------------------
review <- c("Good", "Good", "Indifferent",
            "Bad", "Good", "Bad")
review

# 팩터로 변환
reviewFactor <- factor(review)
reviewFactor


str(reviewFactor)
as.numeric(reviewFactor) # Bad(1), Good(2), Indifferent(3)


eventday <- c("Mon", "Mon", "Tue", "Wed", "Mon",
              "Wed", "Thu", "Fri", "Tue"); eventday
eventdayFac <- factor(eventday); eventdayFac

# facor level(범주) 지정(정의) <순서도 포함됨>
eventdayFac <- factor(eventday,
                      levels = c("Mon", "Tue", "Wed", "Thu",
                                 "Fri", "Sat", "Sun"))
eventdayFac

# 팩터의 레벨 확인
levels(reviewFactor)
# 팩터 변경
levels(reviewFactor) <- c("B", "G", "I")
reviewFactor

# 레벨 개수 확인
nlevels(reviewFactor)
length((levels(reviewFactor)))


#--------------------------------------------------------------------------
# 서열 팩터
#--------------------------------------------------------------------------
# 팩터 순서 변경 (서열 백터로 변환)
eval <- c("Medium", "Low", "High", "Medium", "High")
evalFac <- factor(eval); evalFac

evalOrdered <- factor(eval, levels = c("Low", "Medium", "High"),
                      ordered = T)
evalOrdered

# 순서 팩터와 비 순서 팩터의 차이
table(evalFac)
table(evalOrdered)


#--------------------------------------------------------------------------
# 팩터 이름 지정/변경
#--------------------------------------------------------------------------
sex <- c(2,1,2,2,1.0)
sexFac <- factor(sex, levels = c(1,2),
                 labels = c("Mail", "Female"))
sexFac

table(sexFac)
