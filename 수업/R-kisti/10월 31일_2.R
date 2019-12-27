# 패키지 설치하기와 로딩하기
install.packages("readx1")     #엑셀 파일 불러오기
install.packages("tidyverse")  #데이터 핸들링과 분석
install.packages("writexl")    #엑셀파일로 저장하기
library(readxl)
library(tidyverse)
library(writexl)


#작업공간
#작업공간 ----
setwd("/Users/jeongjin-uk/Documents/R-kisti")
getwd()

# 데이터 읽어오기
# 예제 데이터 : ggplot2 :: diamonds

# 1. 데이터 전체 보기
# 1.1 View(data)
View(diamonds)

# 1.2 data
# 콘솔에 출력이 됨
# 데이터가 작을 때에 주로 사용함
diamonds

# 2. 데이터 일부보기
# 2.1 head(data, n=6)
# 콘솔에 출력이 됨
head(diamonds)
head(diamonds, n=10)


# 2.1 tail(data, n=6)
# 콘솔에 출력이 됨
tail(diamonds)
tail(diamonds, n=6)

# 3.데이터의 구조(Structure)보기
# 3.1 str(data)
str(diamonds)

# 3.2 dplyr ::glimpse(data)
dplyr::glimpse(diamonds)
diamonds %>% 
  dplyr::glimpse()

# 4. 입력오류 체크하기
# summary(data)
diamonds %>%
  summary()

# 5. 데이터의 속성
# 데이터 : data.frame ,tibble, data.table

# 5.1 행의 개수
# nrow(data)
nrow(diamonds)
diamonds %>%
  nrow

# 5.2 열 = 변수= Feature의 개수
# ncol(data) 
diamonds %>%
  ncol()

# 5.3 열= 변수= Feature의 이름
# colnames(data)
diamonds %>%
  colnames()

# 6. Data의 slicing
# data [row_index , col_index]

# 6.1 열 = 변수 = Feature
# dplyr ::select(data, variable,...)

diamonds %>% 
  dplyr::select(carat)

diamonds %>% 
  dplyr::select(carat,y,z)

diamonds %>% 
  dplyr::select(carat) ->caratDF #열 이름저장

diamonds %>% 
  dplyr::select(carat,y,z)->diamondsDF #열 이름저장

#cut~y 열 잘라서 저장
diamonds %>%
  dplyr::select(cut:y)

#color를 제외한 나머지 열
diamonds %>% 
  dplyr::select(-color)

#Cut~y를 제외한 나머지 열
diamonds %>% 
  dplyr::select(-(cut:y))

#변수명에 패턴이 있는 경우우
#i.변수명에 특정한 문자를 포함
diamonds %>%
  dplyr::select(contains("c"))

# ii. 특정한 문자로 시작하는 경우
diamonds %>% 
  dplyr::select(starts_with("c"))

# iii. 특정한 문자로 끝나는 경우
diamonds %>%
  dplyr::select(ends_with("e"))


# 6.2 행 ----
# dplyr::filter(data,조건)
# carat : 0.2 ~ 5.01, 2이상
diamonds %>% 
  dplyr::filter(carat >= 2)

# cut 중에서 "Fair" 인 데이터
diamonds %>% 
  dplyr::filter(cut == "Fair")


# carat은 2 이상이고, cut은 "Fair"인 데이터.
diamonds %>% 
  dplyr::filter(carat >= 2,cut == "Fair")

# carat은 2 이상 또는 cut은 "Fair"인 데이터
diamonds %>% 
  dplyr::filter(carat >= 2 | cut == "Fair")


#cut이 "Fair"이거나 또는 "Good"인 데이터
diamonds %>% 
  dplyr::filter(cut == "Fair" | cut == "Good")

diamonds %>% 
  dplyr::filter(cut %in% c("Fair","Good"))


# 6.3 행과 열 ----
# carat은 2 이상이고 cut은 "Fair"인 데이터의 
# x,y,z 열을 가져오세요.

diamonds %>% 
  dplyr::filter(carat >= 2, cut == "Fair") -> d1

d1 %>% 
  dplyr::select(x:z) -> d2


diamonds %>% 
  dplyr::filter(carat >= 2,cut == "Fair") %>% 
  dplyr::select(x:z) -> d2

d2


# 7. 새로운 변수 만들기 ----
  # 열을 만든다는 의미.

# 7.1 연산 ----
diamonds %>% 
  dplyr::mutate(xyz_mean = (x + y + z) / 3) -> diamonds
# mutate => 새로운 변수를 만들어냄.
View(diamonds)

diamonds %>% 
  dplyr::mutate(price_per_carat = price / carat) -> diamonds

# 7.2 변환(Transformation) ----
diamonds %>% 
  dplyr::mutate(carat_log10   = log10(carat),
                carat_root    = sqrt(carat), 
                carat_inverse = 1/carat) -> diamonds


# 7.3 범주를 줄이기 ----
diamonds %>% 
  dplyr::mutate(cut_group = ifelse(cut == "Ideal","Ideal","NonIdear")) -> diamonds

# 문제
# cut_group2 : "Ideal", "Premium", "ETC" 가지는 변수를 생성
diamonds %>% 
  dplyr::mutate(cut_group2 = ifelse(cut == "Ideal","Ideal",
                                    ifelse(cut == "Premium","Premium","ETC"))) -> diamonds


# ifelse(조건,
#        조건이 맞을때 새로운 변수가 가지는 값,
#        조건이 맞지 않을때 새로운 변수가 가지는 값)

# 7.4 양적인 자료를 질적 자료로 변경 ----

diamonds %>% 
  dplyr::mutate(carat_group = cut(carat,
                                  breaks = seq(from = 0,to = 6,by = 2),
                                  right = FALSE,
                                  labels = c("Light","Medium","Heavy"))) -> diamonds



# 8. 외부 데이터 저장하기 ----
# 8.1 txt ----
# separator : blank , comma, tab
# write.table(data,
#             file = "directroty/filename.txt",
#             sep = " " or "," or "\t",
#             row.names = FALSE)
write.table(diamonds,
            file      = "diamonds_1104.txt",
            sep       = ",",
            row.names = FALSE)

# 8.2 csv ----
# write.csv(data,
#           file = "directory/filename.csv",
#           row.names = FALSE)

write.csv(diamonds,
          file = "diamonds_1104.csv",
          row.names = FALSE)


# 8.3 xls,xlsx ----
# writexl::write_xlsx(data,
#                     path = "directory/filename.xlsx")

writexl::write_xlsx(diamonds,
                    path = "diamonds_1104.xlsx")


# 9. RData로 저장하기 ----
# save(data,file = "diretory/filename.RData")
save(diamonds,file = "diamonds_1104.RData")

# 10. RData 불러오기 ----
# load(file = "directory/filename.RData")
load(file = "diamonds_1104.RData")


# 11. 메모리에 있는 데이터의 목록보기 ----
# ls()
# list segment의 약자
ls()

# 12. 메모리에 있는 데이터 삭제하기. ----
# (1) rm(data1,data2,...)
# (2) rm(list =ls())
# 모두 삭제하므로 하드에 우선적으로 저장한 뒤 삭제 실행.
rm(list = ls())


# 13. 데이터 정렬하기 ----
# 13.1 vector ----
# sort(vector, decreasing = FALSE or TRUE) # FALSE : 오름차순, TRUE : 내림차순
age <- c(28, 25, 27, 31)
sort(age, decreasing = FALSE) # 오름차순
sort(age, decreasing = TRUE)  # 내림차순
# 변경하려면
# age <- sort(age, decreasing = FALSE)

# 13.2 factor ----
bt <- c("o","a","a","a","o","ab")
bt <- factor(bt)
bt
sort(bt,decreasing = FALSE) # 오름차순
sort(bt,decreasing = TRUE)  # 내림차순


# 13.3 data.frame or tible ----
# dplyr::arrange(data,variable,desc(variable))

# (1) carat : 오름차순
diamonds %>% 
  dplyr::arrange(carat)

# (2) carat : 내림차순
diamonds %>% 
  dplyr::arrange(desc(carat))

# (3) cut : factor : 오름차순
diamonds %>% 
  dplyr::arrange(cut)

# (4) cut : factor : 내림차순
diamonds %>% 
  dplyr::arrange(desc(cut))

# (5) cut : 오름차순, carat : 오름차순
diamonds %>% 
  dplyr::arrange(cut,carat)

# (6) cut : 내림차순, carat : 내림차순
diamonds %>% 
  dplyr::arrange(desc(cut),desc(carat))

# (7) cut : 오름차순, carat : 내림차순
diamonds %>% 
  dplyr::arrange(cut,desc(carat))

# (8) cut : 내림차순, carat : 오름차순
diamonds %>% 
  dplyr::arrange(desc(cut),carat)

# 14. 데이터 합치기 ----
# 14.1 위/아래 ----
# rbind(data1,data2,....)
diamonds %>% 
  dplyr::slice(1:5) %>% 
  dplyr::mutate(id=1:5) %>% 
  dplyr::select(id,x:z) ->d1

diamonds %>% 
  dplyr::slice(6:10) %>% 
  dplyr::mutate(id=6:10) %>% 
  dplyr::select(id,x:z) -> d2

d3 <- rbind(d1,d2)
d3

# 14.2 왼쪽/오른쪽(1) ----
diamonds %>% 
  dplyr::slice(1:5) %>% 
  dplyr::mutate(id = 1:5) %>% 
  dplyr::select(id,cut,carat) -> d4

diamonds %>% 
  dplyr::slice(1:5) %>% 
  dplyr::select(x:z) -> d5

d6 <- cbind(d4,d5)
d6

# 14.3 왼쪽/오른쪽(2) ----
d7 <- data.frame(id = c(1,3,4,5),
                 age = c(10,30,40,50))

d8 <- data.frame(id = c(1,2,4,6),
                 bt =c("a","b","ab","o"))


# (1) inner join
# dplyr::inner_join(data1,data2, by="primary_key")
d9 <- dplyr::inner_join(d7,d8,by="id")
d9

# (2) outer join : full join
# dplyr::full_join(data1,data2, by="primary_key")
d10 <- dplyr::full_join(d7,d8,by="id")
d10 %>% 
  dplyr::arrange(id)

# (3) outer join : left join
# dplyr::left_join(data1,data2, by="primary_key")
d11 <- dplyr::left_join(d7,d8,by="id")
d11 %>% 
  dplyr::arrange(id)

# (4) outer join : right join
# dplyr::right_join(data1,data2, by="primary_key")
d12 <- dplyr::right_join(d7,d8,by="id")
d12 %>% 
  dplyr::arrange(id)








