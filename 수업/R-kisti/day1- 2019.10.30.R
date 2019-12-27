# 주석! 
#  연산자(operator) ----
#  1-1 산술 연산자 ----
#  +, -, *, /, **, ^, %%, %/%
# 3 + 4 ; 3 - 4
#  메모리 문제로 한줄에 여러 명령어를 사용했으나 현재는 메모리가 
#  성능이 향상되어 한줄에 하나씩만 써도 문제 없다.
3+4   # 더하기
3-4   # 빼기
3*4   # 곱하기
3/4   # 나누기
3**4  # 거듭제곱
3^4   # 거듭제곱
13%%4 # 나머지
13%/%4 #몫  *주의 : 뒤에 달때는 단축키 사용 금지

# 1.2 할당연산자 ----
# 저장하는 기능
# <-, =, ->
# <-, -> : 일반적인 저장 기능
# =      : 함수 안의 argument를 저장하는 기능
x <- rnorm(n = 100, mean = 10, sd = 2)
# rnorm()     : 함수
# n, mean, sd : argument


# 1.3 비교 연산자 ----
# >, >=, <, <=, ==, !=, !
3 > 4
# R 은 대소문자 구분을 한다.
3 >= 4
3 < 4
3 <= 4
3 == 4 
3 != 4
!(3 == 4)


# 1.4 논리연산자 ----
# & , |
# & : and: 여러개의 조건을 동시에 만족하는 데이터 추출
# | : or : 여러개의 조건중에서 하나라도 만족하면 데이터 추출
(3>4) & (5>4)
(3>4) | (5>4)



# 2. 데이터의 유형 (Type of Data) ----
# 2-1. 수치형 (numeric) ----
# (1) 정수 (integer)
# (2) 실수(double)
x1 <- 10
x2 <- 10.2
typeof(x1)
typeof(x2)

# 2.2 문자형 (Character) ----
x3 <- 'Love is not feeling.'
typeof(x3)
x4 <- "Love is choice."
typeof(x4)

# 2.3 논리형 (Logical) ----
x5 <- TRUE
x6 <- FALSE
typeof(x5)
typeof(x6)

# 3.Data ----
# 3.1 vector ----
  # 집단으로 인식되지 않는 열의 원소들
# 하나의 열(column)로 구성되어 있음
# 1차원 구조
  # 하나의 데이터 유형만 가짐
  # 데이터 분석의 가장 기본단위가 된다.
# (1) vector 만들기
# i. c(element, element,....)
# c : combine or concatenate 의 약자
# numeric, characterm logical vector를 만듬
# element들 간에 규칙이 존재하지 않을 때 사용.
age     <- c(20, 21, 20, 22)
typeof(age)
bt      <- c("b","a","o","b")
typeof(bt)
smoke   <- c(FALSE,FALSE,FALSE,FALSE) 
typeof(smoke)

# ii. :
# numeric vector만 만들수 있음.
# 1씩 증가 또는 1씩 감소되는 숫자들로 구성.
# start:end

# start < end : 1씩 증가
# start > end : 1씩 감소

# start에 있는 숫자부터 시작해서 end에 있는 숫자를 넘지 않을때까지
# 1씩 증가 혹은 감소.
index1 <- 1:10
index1
index2 <- 100:1
index2


# iii. seq(from = , to = , by = )
# seq : sequence 의 약자
# numeric vector 만 만들수 있음.
# 일정한 간격으로 떨어진 숫자들
# :의 확장이라고 볼 수 있음.

# from == start
# to   == end
# by   == 증가 혹은 감소의 폭

id1 <- seq(from = 1, to = 10, by = 2)
id1
typeof(id1)
id2 <- seq(from = 10, to = 1, by = -2)
id2
typeof(id2)

# (2) vextor의 속성
sight <- c(1.5, -4, 0.2, 1.2, 0.5, 0.6)
# i. element의 개수
# length(vector)
length(sight)

#ii. 데이터의 유형
#mode(vector)
mode(sight)

#iii.element의 이름
#names(vector)
names(sight)
names(sight) <- c("Kim","Lee","Sim","Lee","Min","Lee") # 각 원소의 이름 지정
## null - 존재하지 않는다.
  #object가 존재하지 않는다.
    #object -data  1.5, -4, 0.2, 1.2, 0.5, 0.6 
    #       -graph
sight
names(sight) <- NULL # 원소의 이름 지우기.

# (3)vector 의 Index
#element 의 위치.
# 첫번째 element 의 위치는 1
# 자바나 파이썬과는 다르게 인덱스의 첫 위치는 1이다(파이썬은 0)

# (4) vector의 slicing
# vector[index]
sight[1]


#문제 : 1, 3, 4번째의 값을 한번에 가져오세요
sight[c(1,3,4)]

#문제 : 2,3,4번째의 값을 한번에 가져오세요.
sight[2:4]

#문제 : 홀수번째의 값을 한번에 가져오세요.
sight[seq(from=1,to=length(sight),by=2)]


# (5) vector 의 산술 연산
v1 <- c(10,20,30)
v2 <- c(40,50,60)
v3 <- v1 + v2 # index가 같은 원소끼리 연산.
# vectorization = 벡터화.
v4 <- c(10, 20, 30, 40, 50, 60)
v5 <- v1+v4 # ilterate 반복으로 벡터의 갯수를 맞춰줌
#recycling Rule(재사용 규칙)
#파이썬의 itertools 의 사용과 같음
v5

v6 <- c(10,20,30,40,50)
v7 <- v1 + v6
v7


# 3.2 Factor ----
  # 집단으로 인식될 수 있는 열의 원소들
# 하나의 열로 구성되어 있음.
# 1차원 구조
# 하나의 데이터 유형만 가짐.
# 데이터 분석의 기본단위.
# 집단으로 인식함.

# (1) Factor 만들기.
# factor(vector, labels= , levels= , ordered = )
address <- c("경기","경기","서울","인천","서울","서울")
address_factor1 <- factor(address)

address
address_factor1
table(address_factor1)
mode(address)
mode(address_factor1)

address_factor2 <- factor(address,labels = 
                            c("경기도","서울특별시","인천광역시"))

address_factor2
table(address_factor2)

address_factor3 <- factor(address,levels = c("서울","경기","인천"))

address_factor3
table(address_factor3)

address_factor4 <- factor(address,levels = c("서울","경기","인천"),
                          labels = c("서울특별시","경기도","인천광역시"))

address_factor4
table(address_factor4)

address_factor5 <- factor(address,levels = c("서울","경기","인천"),
                          labels = c("서울특별시","경기도","인천광역시"),
                          ordered = TRUE)

address_factor5
table(address_factor5)

# (2) factor의 속성
# i. 집단의 갯수 : nlevels(factor)
nlevels(address_factor1)

#ii. 집단의 이름과 순서 : levels(factor)
levels(address_factor1)


# 3.3 Data.Frame ----
  # 행렬구조로 이루어진 데이터 집합
# 2차원 구조
#열마다 다른 데이터 유형을 가질 수 있음.
# matrix는 모든 열의 데이터 타입이 같아야한다. 
# 하지만 dataframe은 다를수 있다.
# R에서 데이터라고 하면 data.Frame이다.
# 참고: tibble, data.table 은 data.frame과 유사한 구조를 가진다.

# (1) data.frame 만들기 

id      <- 1:2
food    <- c("돈가스","스테이크")
drink   <- c("테라","콜라")
drink   <- factor(drink)
money   <- c(30,50)
survey  <- data.frame(id,food,drink,money)
survey
mode(survey)


# 3.4 List ----
  # 데이터 분석 결과는 보통 리스트 형태로 나타남
# 가장 유연한 형태의 데이터
# 1차원 구조
# vector, factor, data.frame, list를 element로 가질 수 있음.
# element의 size가 모두 다를 수 있다.
# 즉, 데이터사이즈가 유연하다.


# (1) list 만들기.
bt <- "o"
bt <- factor(bt)
id <- 1:10
result <- list(bt,id,survey)

result

# (2) list의 slicing
result[1]
mode(result[1])
result[[1]]
mode(result[[1]])

result[2]
mode(result[2])
result[[2]]
mode(result[[2]])

result[3]
mode(result[3])
result[[3]]
mode(result[[3]])






