

# 1.2할당 연산자
#저장하는 기능
#<-, =, ->
#<- ,-> :일반적인 저장 기능
# = 함수 안의 argument를 저장하는 기능
x <- rnorm(n = 100, mean = 10, sd =2)
# rnorm() : 함수
#n, mean,sd :argument



# 1.3 비교 연산자
# >, >=, <, <=, ==, !=, !
3>4


# 1.4 논리 연산자
# &, |
# & : and : 여러 개의 조건을 동시에 만족하는 데이터 추출
# | : of : 여러개의 조건 중에서 하나만 만족해도 데이터 추출
() &()
() &()
() &()
() &()
#alt shift 방향키
#ctrl d
#ctrl


#2. 데이터의 유형 (Type of Data)
#2.1 수치형(Numeric)
#(1) 정수 (integer)
#(2) 실수(double)
x1 <- 10
x2 <10.2
x2<-10.2

# 2.2 문자형(Character)
x3<-'Love is not feeling'
x4<-"Love is Choice."


# 2.3 논리적 (Logical)
x5<-TRUE
x5<-FALSE

# 3. Data
# 3.1 Vector
# 하나의 열(colum)로 구성되어 있음
# 1차원 구조
# 하나의 데이터 유형만 가짐
# 데이터 분석의 가장 기본 단위
# 집단으로 인식하지 않음

# (1) Vector 만들기
# i. C(element, element,...)
# c : combine or concatenate의 약자
# numeric, character, logical vector를 만듬
# element들 간에 규칙이 없을 때에 사용

age <- c(20,21,20,22)
bt <-c("b", "a", "o", "b")
smoke <-c(FALSE,FALSE,FALSE,FALSE)


#ii. :
#numeric vector만 만들 수 있음
#1씩 증가 또는 1씩 감소되는 숫자들로 구성되어 있음
#start < end : 1씩 증가
#start >end : 1씩 감소

#start에 있는 숫자부터 시작해서
# end 에 있는 숫자를 넘지 않을 때까지
# 1씩 증가 또는 1씩 감소

index1 <-1:10
index1

index2<-100:1
index2




# 3.2 Factor
# iii. seq(from = , to = , by = )
# seq : sequence의 약자
# numeric vector만 만들 수 있음
# 일정간 간경으로 떨어진 숫자들 
# :의 확장
# from : start
# to : end
#by : 증가 또는 감소의 폭
id1 <- seq(from =1,to=10, by=2)
id1
# 3.4

#2) Vector의 속성
sight <- c(1.5,-4,0.2,1.2,0.5, 0.6)

#i.element의 개수
#length(vector)
length(sight)


#데이터의 유형 
#mode(Vector)
mode(sight)

#ii. element의 이름
#names(vector)
names(sight)
names(sight) <-c("kim","lee","sim","lee","min","lee")
names(sight) <-NULL



#(3) Vector의 Index
# element의 위치
# 첫 번째 element의 위치는 1


# (4) Vector의 slicing
# vector[index]
sight[1]

# 문제 :1,3,4 번째 값을 한번에 가져오세요

sight[1,3,4]
sight[1],sight[3],sight[4]
sight[0,1]
sight[c(1,3,4)]
# 문제 2,3,4 번째의 값을 한번에 가져오세요
sight[2:4]
# 문제 : 홀수 번째의 값을 한번에 가져오세요
sight[seq(from=1,to=length(sight), by=2)]


# (5) Vector 의 산술연산
v1<-c(10,20,30)
v2<-c(40,50,60)
v3<- v1+v2
v3
v4 <-c(10,20,30,40,50,60)
v5<-v1+v4
v5
v6 <- c(10,20,30,40,50)
v7<- v1+v6
v7


# 3.2 Factor
# 하나의 열로 구성되어 있음
# 1차원 구조
# 하나의 데이터 유형만 가짐 (특히 numeric)
# 데이터 분석의 기본 단위
# 집단으로 인식함


# (1) Factor의 만들기
# factor(vector, labels =, levels= , ordered =)
address <- c("경기","경기","서울","인천","서울","서울")
address_factor <- factor(address)
address
adress_factor
mode(address)
mode(address_factor)

address_factor2 <- factor(address, labels=c("경기도","서울특별시","인천광역시"))
address_factor2
table(address_factor2)

address_factor3 <- factor(address, levels =c("서울","경기","인천"))
address_factor3

address_factor4 <-factor(address, levels=c("서울","경기","인천"), labels=c("서울 특별시","경기도","인천광역시)
                                                                   "))
address_factor4


# (2) Factor의 속성
# i. 집단의 개수 : nlevels(factor)
nlevels(address_factor)

# ii집단의 이름과 순서 :levels (factor)
levels(address_factor)

# 3.3 Data.Frame
# 행과 열로 구성되어 있음
# 2차원 구조
# 열마다 다른 데이터 유형을 가질 수 있음
# R에서 데이터라고 하명 data.Farme
# 참고 : tibble, data.table <- data.frame과 유사한 이차원 구조

# (1) data.frame 만들기
# data.frame(vector, factor,....)
id<-1:2
food <-c("돈가스","스테이크")
drink<-c("테라","콜라")
drink<-factor(drink)
money <-c("30","50")
survey<-data.frame(id,food,drink,money)
survey



# 3.4 List
# 데이터 분석 결과과
# 가장 유연한 형태의 데이터
# 1차원 구조
# vector, factor, data.frame, list을
# element로 가질 수 있음


# (1) list 만들기
# list (vector, factor, data.frame. list)
bt<-("o")
bt<- factor(bt)
id<-1:10
result <- list(bt, id, survey)


# (2) list의 슬라이싱
result[1]   #list
result[[1]] #factor

result[2]   #list
result[[2]] #factor

result[3]   #list
result[[3]] #factor





