#--------------------------------------------------------------------------
# 화일명 : w2_R기초_4_데이터구조.R
# 설  명 : 통계 데이터 분석 (R기초 - 데이터구조)
# 일  자 : 2020.11.06
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
# 데이터 구조 (개념-이미지)
#--------------------------------------------------------------------------
#install.packages("png")
library(png)

#read file
img <- readPNG("image/dataStructure.png")

# read it also in native format
img.n <- readPNG("image/dataStructure.png", TRUE)

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

#--------------------------------------------------------------------------
# 데이터 구조
#--------------------------------------------------------------------------
# 1. 벡터
vect <- c(1,2,3,4,5)

# 2. 펙터 (카테고리:범주형 데이터)
grage <- c("A", "B", "C", "A", "B")
factor(grage)

# 3. 행렬
mt <- matrix(1:12, 3, 4)
mt

# 4. 배열
ar <- array(1:12, c(2,3,2))
ar

# 5. 데이터프레임
dt <- data.frame(product=c("A", "B", "C"), price=c(100, 200, 300))
dt

# 6. 리스트
lst <- list(x=vect, y=mt, z=dt)
lst
