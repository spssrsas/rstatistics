#--------------------------------------------------------------------------
# 화일명 : w3_R기초_3_형태변환1.R
# 설  명 : 통계 데이터 분석 (R기초 - 형태 변환1 - reshape2)
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
# 형태 변환1 - reshape2
#--------------------------------------------------------------------------
#install.packages("reshape2")
library(reshape2)
# melt() : wide format -> long format 으로 변환
# dcast() : long format -> wide format 으로 변환

#--------------------------------------------------------------------------
# 데이터 형태 (개념-이미지)
#--------------------------------------------------------------------------
#install.packages("png")
library(png)

#read file
img <- readPNG("image/dataFormat.png")

# read it also in native format
img.n <- readPNG("image/dataFormat.png", TRUE)

# if your R supports it, we'll plot it
if (exists("rasterImage")) { # can plot only in R 2.11.0 and higher
  plot(1:2, type='n')
  
  if (names(dev.cur()) == "windows") {
    # windows device doesn't support semi-transparency so we'll need
    # to flatten the image
    transparent <- img[,,4] == 0
    img <- as.raster(img[,,1:3])
    img[transparent] <- NA
    
    # interpolate must be FALSE on Windows, otherwise R will
    # try to interpolate transparency and fail
    rasterImage(img, 1.2, 1.27, 1.8, 1.73, interpolate=FALSE)
    
  } else {
    # any reasonable device will be fine using alpha
    rasterImage(img, 1.2, 1.27, 1.8, 1.73)
    #rasterImage(img.n, 1.5, 1.5, 1.9, 1.8)
    
  }
  
}

smiths #reshape2 패키지 內
class(smiths)
melt(data=smiths) # factor나 문자열 변수를 식별자로 인식
?melt
melt(data=smiths,
     id.vars = "subject")
melt(data=smiths,
     measure.vars = c(2:5))
melt(data=smiths,
     measure.vars = c(2:4)) # id : 1&5 번째 두개의 칼럼
melt(data=smiths,
     measure.vars = c("time", "age", "weight", "height"))
melt(data=smiths,
     id.vars = "subject",
     measure.vars = c("time", "age", "weight", "height"))

smithsLong <- melt(data=smiths,
                   id.vars = "subject",
                   measure.vars = c("time", "age", "weight", "height"),
                   variable.name = "var",
                   value.name = "val")
smithsLong


#long format -> wide format 변환
?dcast
#formula(~) : 식별 변수 ~ 측정 변수
dcast(data = smithsLong, formula = subject ~ var) # 마지막 열을 값으로 인식
dcast(data = smithsLong, formula = subject ~ var,
      value.var = "val")



head(airquality)
aqLong <- melt(airquality,
                id.vars = c("Month", "Day"))
head(aqLong)
tail(aqLong)
aqWide <- dcast(aqLong,
                Month + Day ~ variable,
                value.var = "value")
head(aqWide)
# dcast 사용시, 키 값을 잘 못 설정한 경우, R에서 임의로 계산 및 출력
# Month + Day -> Month 하나만으로 잘 못 설정
dcast(aqLong, Month~variable)
# 키 값 별로 특정 함수 실행
dcast(aqLong, Month~variable,
      fun.aggregate = mean, na.rm = TRUE)
