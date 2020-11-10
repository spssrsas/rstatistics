#--------------------------------------------------------------------------
# 화일명 : w4_통계데이터분석_2_데이터요약.R
# 설  명 : 통계 데이터 분석 (통계데이터분석 - 데이터 요약 - 범주형 변수)
# 일  자 : 2020.11.10
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
# 데이터 요약 - 범주형 변수
#--------------------------------------------------------------------------
library(MASS)
str(survey)

levels(survey$Smoke)

# 빈도표 (교차표)
frqtab <- table(survey$Smoke) # table(행, 열)
frqtab
class(frqtab)
frqtab[2]

# 최빈값 조회
frqtab == max(frqtab)
frqtab[frqtab == max(frqtab)]
names(frqtab[frqtab == max(frqtab)])

which.max(frqtab)
frqtab[which.max(frqtab)]
names(frqtab[which.max(frqtab)])

# 비율 구하기
frqtabProp <- prop.table(frqtab)
frqtabProp
frqtabProp["Never"]
frqtabProp * 100

survey$Smoke == "Never"
mean(survey$Smoke == "Never", na.rm = T)


#--------------------------------------------------------------------------
# Exercise
#--------------------------------------------------------------------------
?anorexia #신경성 식욕 부진증(거식증)
# 특정 조건에 맞는 데이터 탐색 순서
# Step1. 데이터 탐색
head(anorexia)
# Step2. 논리 연산
anorexia$Postwt > anorexia$Prewt
# Step3. 논리 연산에 맞는 데이터 조회
mean(anorexia$Postwt > anorexia$Prewt)
# Step4. 필요시, 조회된 데이터에 가공
mean(anorexia$Postwt > anorexia$Prewt)*100


?mammals
str(mammals);mode(mammals)
# 특정 조건에 맞는 데이터 탐색 순서
# Step1. 데이터 탐색
head((mammals))
# Step2. 논리 연산
# 두뇌의 무게 편차가 표준편차의 2배보다 큰 것
abs(mammals$brain - mean(mammals$brain)) > 2*sd(mammals$brain)
# Step3. 논리 연산에 맞는 데이터 조회
mamWich <- which(abs(mammals$brain - mean(mammals$brain)) > 2*sd(mammals$brain))
mammals[c(mamWich),]
# Step4. 필요시, 조회된 데이터에 가공
mean(abs(mammals$brain - mean(mammals$brain)) > 2*sd(mammals$brain))*100


?SP500
str(SP500);class(SP500);typeof(SP500);mode(SP500)
# 특정 조건에 맞는 데이터 탐색 순서
# Step1. 데이터 탐색
head(SP500)
# Step2. 논리 연산
?diff
diff(SP500) # 연속된 두 일자간의 차이 계산
# 수익률이 전일보다 증가한 날
diff(SP500) > 0
# Step3. 논리 연산에 맞는 데이터 조회
SP500Wich <- diff(SP500) > 0
SP500[SP500Wich]
mean(diff(SP500) > 0)
# Step4. 필요시, 조회된 데이터에 가공
mean(diff(SP500) > 0)*100


#--------------------------------------------------------------------------
# 교차표 (table, margin.table, prop.table, gmodels)
#--------------------------------------------------------------------------
#install.packages("vcd")
library(vcd)
?Arthritis #관절염
str(Arthritis)
levels(Arthritis$Treatment)
levels((Arthritis$Improved))

crosstab <- table(Arthritis$Improved, Arthritis$Treatment,
                  dnn = c("Improved", "Treatment")) # table(행, 열)
crosstab
crosstab["Marked", "Treated"]

# xtabs를 활용한 교차표 생성
crosstab <- xtabs(~ Improved + Treatment, data = Arthritis)
crosstab

# 교차표 빈도 합 구하기, margin.table
margin.table(crosstab, margin = 1) # 1(행), 2(열)
margin.table(crosstab, margin = 2) # 1(행), 2(열)


# 교차표 빈도 비율 구하기, prop.table
prop.table(crosstab, 1) # 1(행), 2(열)
prop.table(crosstab, 2) # 1(행), 2(열)
prop.table(crosstab) # 각 Cell의 비율 계산

# 교차표에 빈도표 합계 표시
addmargins(crosstab, margin = 1) # 1(행), 2(열)
addmargins(crosstab, margin = 2) # 1(행), 2(열)
addmargins(crosstab) # 행과 열 모두의 합계 표시

addmargins(prop.table(crosstab, 1),2)
addmargins(prop.table(crosstab, 2),1)


# gmodels를 활용한 교차표 생성
#install.packages("gmodels")
library(gmodels)
CrossTable(Arthritis$Improved, Arthritis$Treatment, prop.chisq = F,
           dnn = c("Improved","Treatment"))


#--------------------------------------------------------------------------
# 다차원 테이블
#--------------------------------------------------------------------------
multtab <- table(Arthritis$Improved, Arthritis$Sex, Arthritis$Treatment)
multtab
multtab <- xtabs(~ Improved + Sex + Treatment, data = Arthritis)
multtab

# ftable
ftable(multtab)
ftable(multtab, row.vars = c(2,3)) # row.vars : 행 조정
ftable(Arthritis[c("Improved", "Sex", "Treatment")],
       row.vars = c(2,3))

margin.table(multtab, 1)
margin.table(multtab, 2)
margin.table(multtab, 3)

margin.table(multtab, c(1,3))


prop.table(multtab, c(2,3))
ftable(prop.table(multtab, c(2,3)))
ftable(addmargins(prop.table(multtab, c(2,3))),1)
