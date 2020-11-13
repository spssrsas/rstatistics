#--------------------------------------------------------------------------
# 화일명 : w5_R기초_2_그래픽.R
# 설  명 : 통계 데이터 분석 (R기초 - 그래픽 - 그래프 패러미터 설정)
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
# 그래픽 - 그래프 패러미터 설정
#--------------------------------------------------------------------------
# 인수로 주어진 데이터 형식에 따라 다양한 형태의 그래프 생성하는 함수, plot()
plot(faithful)

?par


#--------------------------------------------------------------------------
# 제목과 축
#--------------------------------------------------------------------------
plot(faithful,
     main="Old Faithful Geyser",
     sub="Yellowstone National Park",
     xlab="Eruption time (minutes)",
     ylab="Waiting time (minutes")

# 축 레이블 수직/수평 표기 조정
plot(faithful, las=0)
plot(faithful, las=1)
plot(faithful, las=2)
plot(faithful, las=3)

# 그래프 외곽 테두리 표기 조정
plot(faithful, bty="o")
plot(faithful, bty="n")
plot(faithful, bty="l")
plot(faithful, bty="]")


#--------------------------------------------------------------------------
# 심볼과 선
#--------------------------------------------------------------------------
# 심볼 표기 조정
plot(faithful, pch=3)
plot(faithful, pch=8)
plot(faithful, pch=19, col="green3")
plot(faithful, pch=21)
plot(faithful, pch=21, col="dimgray", bg="red")

# 선 표기 조정
str(LakeHuron)
plot(LakeHuron)
plot(LakeHuron, lty="solid")
plot(LakeHuron, lty=1)
plot(LakeHuron, lty="dashed")
plot(LakeHuron, lty="dotted")
plot(LakeHuron, lty="dotdash")
plot(LakeHuron, lty="longdash")
plot(LakeHuron, lty="twodash")
plot(LakeHuron, lty=6)
plot(LakeHuron, lty=6, col="red")



#--------------------------------------------------------------------------
# 그래프 유형
#--------------------------------------------------------------------------
# 그래프 유형 조정
str(pressure)
plot(pressure)
plot(pressure, type="p")
plot(pressure, type="l")
?plot
plot(pressure, type="b")
plot(pressure, type="o")
plot(pressure, type="h")
plot(pressure, type="s")
plot(pressure, type="n") # 우선 고수준 그래프 생성, 저수준 그래프로 확장시 유용

x <- 1:10
y1 <- exp(1:10)
y2 <- exp(10:1)
plot(x, y1, xlab = "x", ylab = "y", type = "n")
lines(x, y1, type="o", pch=21, col="red")
lines(x, y2, type="o", pch=22, col="blue")

# 격자선 배경 방법1
plot(faithful, pch=19, col="blue")
grid()

# 격자선 배경 방법2 (방법1 개선)
plot(faithful)
plot(faithful, type="n")
grid()
points(faithful, pch=19, col="blue")


#--------------------------------------------------------------------------
# 색상
#--------------------------------------------------------------------------



#--------------------------------------------------------------------------
# 크기
#--------------------------------------------------------------------------



#--------------------------------------------------------------------------
# 글꼴과 글씨체
#--------------------------------------------------------------------------
