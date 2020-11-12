#--------------------------------------------------------------------------
# 화일명 : w5_통계데이터분석_1_가설검정.R
# 설  명 : 통계 데이터 분석 (통계데이터분석 - 가설검정)
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
# 가설검정 개요
#--------------------------------------------------------------------------
# 1. 가설과 가설검정
#--------------------------------------------------------------------------
#   - 모집단에 대한 새로운 주장을 대립가설(alternative hypothesis)이라고 하고
#     기존의  주장을 귀무가설(null hypothesis)이라고 함
#
#   - 통계적검정(statistical test) 또는 가설검정(hypothesis test)이란
#     표본 데이터를 기반으로 모집단에 대한 새로운 주장의 옳고 그름을 추론하는
#     과정을 말함


#--------------------------------------------------------------------------
# 2. 가설검정 절차
#--------------------------------------------------------------------------
#   - 표본으로부터 검정하고자 하는 검정통계량(test statistic) 계산
# 
#   - 검정통계량과 그 확률분포로 부터 p-값(p-value) 계산
#     : 귀무가설이 사실이라는 가정하에서 관측한 통계량고 같거나 그보다 더 
#       극단적인 값이 발생할 확률을 의미
#     : 유의확률(significance probability) 이라고도 함
# 
#   - p-값이 매우 작으면 귀무가설 기각
#     : 판단의 기준으로 사용하는 5% 또는 1%의 확률을 유의수준(significance level)
#       이라고 함
#     : 표본으로부터 관측된 결과(즉 계산된 통계량)가 나타날 가능성이 5% 미만
#       또는 1% 미만이 되어 귀무가설을 기각하면 이를 통계적으로 유의하다
#       (statistically significant)라고 표현함


#--------------------------------------------------------------------------
# 가설검정과 검정력
#--------------------------------------------------------------------------
#install.packages("png")
library(png)

#read file
img <- readPNG("image/hypothesisTest.png")

# read it also in native format
img.n <- readPNG("image/hypothesisTest.png", TRUE)

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
