#--------------------------------------------------------------------------
# 화일명 : w3_R기초_4_형태변환2.R
# 설  명 : 통계 데이터 분석 (R기초 - 형태 변환2 - tidyr)
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
# 형태 변환2 - tidyr
#--------------------------------------------------------------------------
# reshape2 패키지 melt, dcast와 유사
# data frame 형식에 대해서만 제한, 성능 향상
# gather() : wide format -> long format 으로 변환
# spread() : long format -> wide format 으로 변환

install.packages("tidyr")
library(tidyr)

head(airquality)


# gather() : wide format -> long format 으로 변환
?gather

aqLong <- gather(airquality,
                 key = Factor,
                 value = Measurement,
                 Ozone:Temp)

aqLong <- gather(airquality,
                 key = Factor,
                 value = Measurement,
                 -Month, -Day)

aqLong <- gather(airquality,
                 key = Factor,
                 value = Measurement,
                 1:4)

aqLong <- gather(airquality,
                 key = Factor,
                 value = Measurement,
                 Ozone, Solar.R, Wind, Temp)
head(aqLong)
tail(aqLong)

# PipeLine 활용
airquality %>% gather(Factor, Measurement, Ozone:Temp)


# spread() : long format -> wide format 으로 변환
?spread()
aqWide <- spread(data=aqLong, key=Factor, value = Measurement)
head(aqWide)

aqLong %>% spread(key=Factor, value = Measurement)


#--------------------------------------------------------------------------
# 칼럼 분할/통합
#--------------------------------------------------------------------------
#separate()
#unite()
head(iris)
irisLong <- gather(iris, Element, Measurement,
                   -Species)
head(irisLong)

# 분할
?separate()

irisSep <- separate(data = irisLong,
                    col = Element,
                    into = c("part", "Measures"))
head(irisSep)

#통합
?unite()
irisUnite <- unite(data = irisSep,
                   col = Factor,
                   part, Measures,
                   sep = "_")
head(irisUnite)
