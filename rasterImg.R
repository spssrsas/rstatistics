#--------------------------------------------------------------------------
# 화일명 : rasterImg.R
# 설  명 : 이미지 출력
# 일  자 : 2020.11.15
# 생성자 : Jigwan
# 패키지 : png
# 사용방법: 1. imgPath 지정 : (예) imgPath <- "image/tTest.png"
#           2. 호출 : source("rasterImg.R")
#--------------------------------------------------------------------------

#install.packages("png")
library(png)

#read file
img <- readPNG(imgPath)

# read it also in native format
img.n <- readPNG(imgPath, TRUE)

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