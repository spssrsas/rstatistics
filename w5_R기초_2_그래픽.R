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
     ylab="Waiting time (minutes)")

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
colours()
# http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf

# palette() : 현재 설정된 색상 팔레트 확인
palette()
palette(rainbow(6))
palette()

palette("default")
palette()

# col="white", col="#FFFFFF", col=rgb(1,1,1), col=hsv(0,0,1)

n <- 12
pie(rep(1,n), col=1:n)

# 팔레트 칼라 생성 함수들
# rainbow()
# heat.colors()
# terrain.colors()
# topo.colors()
# cm.colors()
# gray()

pie(rep(1,n), col=rainbow(n))
pie(rep(1,n), col=heat.colors(n))
pie(rep(1,n), col=terrain.colors(n))
pie(rep(1,n), col=topo.colors(n))
pie(rep(1,n), col=cm.colors(n))
pie(rep(1,n), col=gray(level = seq(0,1, length=n)))

# 색상 투병도 조정
pie(rep(1,n), col=rainbow(n, alpha = seq(0,1,length=n))) # 0 <- 투명, 불투명 -> 1
pie(rep(1,n), col=gray(level=seq(0,1, length=12),
                       alpha=seq(0,1, length=12)))


# RColorBrewer 패키지 : 다향한 색상 팔레트
# install.packages("RColorBrewer")
library(RColorBrewer)
?RColorBrewer

display.brewer.all()
display.brewer.pal(3, "Dark2")
display.brewer.pal(9, "Blues")

n <- 9
pie(rep(1,n), col = brewer.pal(n, "Blues"))
pie(rep(1,n), col = brewer.pal(n, "Greens"))
pie(rep(1,n), col = brewer.pal(n, "BuGn"))
pie(rep(1,n), col = brewer.pal(n, "GnBu"))

# 제목, 축, 라벨 색상 조정
plot(faithful, pch=19, col="tomato",
     main="Old Faithful Geyser",
     sub="Yellowstone National Park",
     xlab="Eruption time (minutes)",
     ylab="Waiting time (minutes)",
     col.main="navy",
     col.sub="purple",
     col.lab="royalblue",
     col.axis="brown")


#--------------------------------------------------------------------------
# 크기
#--------------------------------------------------------------------------
# cex 활용, 포인트/텍스트/타이틀/축라벨/축이름 조정
x <- seq(0.5, 1.5, 0.25);x
y <- rep(1, length(x))
plot(x, y, pch=19, cex=x,
     main = "Effects of cex on symbol and text size")
text(x, y+0.2, labels=x, cex = x)

plot(x, y, pch=19, cex=x,
     main = "Effects of cex on symbol and text size",
     cex.main=1.5,
     cex.lab=1.0,
     cex.axis=0.75)

# lwd 활용, 선 크기 조정
plot(LakeHuron, lwd=1)
plot(LakeHuron, lwd=2)


#--------------------------------------------------------------------------
# 글꼴과 글씨체
#--------------------------------------------------------------------------
# family 인수 지정, 글꼴 조정
windowsFonts()

plot(faithful, pch=19, col="tomato",
     main="Old Faithful Geyser",
     sub="Yellowstone National Park",
     xlab="Eruption time (minutes)",
     ylab="Waiting time (minutes)",
     family="sans")

# 기존에 정의된 글꼴 관계 변경
windowsFonts(
  A=windowsFont("Arial Black"),
  B=windowsFont("Book Antiqua"),
  C=windowsFont("Calisto MT")
)

plot(faithful, pch=19, col="tomato",
     main="Old Faithful Geyser",
     sub="Yellowstone National Park",
     xlab="Eruption time (minutes)",
     ylab="Waiting time (minutes)",
     family="C")

# font 인수 지정, 글씨체 조정
?par

plot(faithful, pch=19, col="cornflowerblue",
     main="Old Faithful Geyser",
     sub="Yellowstone National Park",
     xlab="Eruption time (minutes)",
     ylab="Waiting time (minutes)",
     family="serif",
     font.main=4,
     font.sub=1,
     font.lab=3,
     font.axis=2)
