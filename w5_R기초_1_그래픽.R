#--------------------------------------------------------------------------
# 화일명 : w5_R기초_1_그래픽.R
# 설  명 : 통계 데이터 분석 (R기초 - 그래픽 - 그래프 생성 및 저장)
# 일  자 : 2020.11.13
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
# 그래픽 - 그래프 생성 및 저장
#--------------------------------------------------------------------------
# 인수로 주어진 데이터 형식에 따라 다양한 형태의 그래프 생성하는 함수, plot()

# 산점도
str(cars)
plot(cars$speed, cars$dist)
plot(cars)


# Box Plot
str(ToothGrowth)
plot(ToothGrowth$supp, ToothGrowth$len)

# 산점도 행렬
str(iris)
plot(iris[,1:4])


# 시계열 도표 (시계열 데이터가 인수로 주어진 경우)
str(nhtemp)
View(nhtemp)
plot(nhtemp)


# 모자이크 도표 (테이블 형식의 데이터가 인수로 주어진 경우)
str(UCBAdmissions)
head(UCBAdmissions)
View(UCBAdmissions)
plot(UCBAdmissions)

# 모델객체를 인수로 plot() 함수 인수에 적용시
# 모델에 대한 진단 도표 출력
str(faithful)
faithfulLM <- lm(waiting ~ eruptions, data = faithful)
class(faithfulLM)
# 회귀모델 : 4개의 진단도표(Residuals vs Fitted, Normal Q-Q, Scale-Location, Residuals vs Leverage)
plot(faithfulLM)


# 그래프를 파일로 저장
plot(faithful)
# 저장 방법1 : [Plots] 탭 > Export 메뉴 실행
# 파일 탐색
?list.files
list.files(path="./image/", pattern = ".png")


# 저장된 이미지 확인
install.packages("pander")
library(pander)
?openFileInOS
openFileInOS("C:/work/RProject/rstatistics/image/dataStructure.png")


# 별도의 윈도우 창에 그래프 생성후 저장
windows(width = 12, height = 8)
plot(faithful)
?savePlot
savePlot(filename = "C:/work/RProject/rstatistics/work/myplot", type = "pdf")

# 저장된 이미지 확인
list.files(path = "./work/", pattern = ".pdf")
library(pander)
openFileInOS("C:/work/RProject/rstatistics/work/myplot.pdf")


?png
?pdf
?postscript

png("./work/myplotPng.png", width = 648, height = 432)
plot(faithful)
dev.off()
list.files(path = "./work/", pattern = ".png")
library(pander)
openFileInOS("C:/work/RProject/rstatistics/work/myplotPng.png")
