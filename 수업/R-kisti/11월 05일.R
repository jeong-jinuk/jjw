# 패키지 설치하기와 로딩하기 ----
install.packages("readx1")     #엑셀 파일 불러오기
install.packages("tidyverse")  #데이터 핸들링과 분석
install.packages("writexl")    #엑셀파일로 저장하기
install.packages("e1071")
install.packages("epiDisplay")
install.packages("psych")
install.packages("DataExplorer")
install.packages("gmodels")
install.packages("GGally")

library(readxl)
library(tidyverse)
library(writexl)
library(e1071)
library(epiDisplay)
library(psych)
library(DataExplorer)
library(gmodels)
library(GGally)

#작업공간 ----
setwd("/Users/jeongjin-uk/Documents/R-kisti")
getwd()

# EDA : Exploratory Data Analysis

# 1. 일변량 질적 자료의 분석 ----
# 일변량 : uni-variate = 하나의 열 = 하나의 변수
# Y or X
# Y : Label
# X : Feature

# 질적 자료 = 범주형 자료 : cut, color, clarity

# 1.1 표(Table) = 빈도표( Frequency Table) ----
# (1) 빈도(Frequency)
# (2) 백분율(Percent) = (빈도/합계)*100(%)

diamonds %>% 
  dplyr::group_by(cut) %>% 
  dplyr::summarise(n = n()) %>% 
  dplyr::mutate(percent = round((n/sum(n))*100,digits = 1)) %>% 
  dplyr::arrange(desc(n)) %>% 
  writexl::write_xlsx(path = "cut.xlsx")


# color.xlsx
View(diamonds)
diamonds %>% 
  dplyr::group_by(color) %>% 
  dplyr::summarise(n = n()) %>% 
  dplyr::mutate(percent = round((n/sum(n))*100,digits = 1)) %>% 
  dplyr::arrange(desc(n)) %>% 
  writexl::write_xlsx(path = "color.xlsx")


# 1.2 그래프 ----
# (1) 막대그래프
diamonds %>% 
  ggplot2::ggplot(mapping = aes(x = cut)) +
  ggplot2::geom_bar()

diamonds %>% 
  ggplot2::ggplot(mapping = aes(x = cut)) +
  ggplot2::geom_bar(fill = "red")

# 그림영역 : theme_xxxx()
diamonds %>% 
  ggplot2::ggplot(mapping = aes(x = cut)) +
  ggplot2::geom_bar(fill = "red") +
  ggplot2::theme_dark()

# 제목 : laps()
diamonds %>% 
  ggplot2::ggplot(mapping = aes(x = cut)) +
  ggplot2::geom_bar(fill = "red") +
  ggplot2::theme_dark() +
  ggplot2::labs(title = "Quality of Diamonds",
                x     = "Cut",
                y     = "Frequency")

# 제목 편집 : theme()
diamonds %>% 
  ggplot2::ggplot(mapping = aes(x = cut)) +
  ggplot2::geom_bar(fill = "black") +
  ggplot2::theme_classic() +
  ggplot2::labs(title = "Quality of Diamonds",
                x     = "Cut",
                y     = "Frequency") +
  ggplot2::theme(plot.title = element_text(size = 20,
                                           color = "green",
                                           face = "bold",
                                           hjust = 0.5),
                 axis.title.x = element_text(size = 15,
                                             color = "brown2",
                                             face = "italic",
                                             hjust = 0.5),
                 axis.title.y = element_text(size = 15,
                                             color = "brown3",
                                             face = "bold.italic",
                                             vjust = 0.5,
                                             angle = 0)) +
  ggplot2::ggsave(filename = "cut.jpeg",width = 10,height = 10)


# (2) 원그래프

# 2. 일변량 양적자료의 분석 ----
# 양적자료 = 수치형 자료
# carat, depth, table, price, x, y, z

# 2.1 표 = 빈도표 ----
# (1) 구간의 빈도
# (2) 구간의 백분률
diamonds %>% 
  dplyr::mutate(carat_group = cut(carat,
                                  breaks = seq(from=0,to=6,by=2),
                                  right = FALSE,
                                  labels = c("Light","Medium","Heavy"))) -> diamonds
diamonds %>% 
  dplyr::group_by(carat_group) %>% 
  dplyr::summarise(n = n()) %>% 
  dplyr::mutate(percent = round((n/sum(n))*100, digits = 1)) %>% 
  writexl::write_xlsx(path = "carat.xlsx")


# 2.2 그래프 ----
# (1) 히스토그램 (Histogram)
diamonds %>% 
  ggplot2::ggplot(mapping = aes(x = carat)) +
  ggplot2::geom_histogram()

# 구간의 너비 : binwidth = 
diamonds %>% 
  ggplot2::ggplot(mapping = aes(x = carat)) +
  ggplot2::geom_histogram(binwidth = 0.3)

# 구간의 개수 : bins =  
diamonds %>% 
  ggplot2::ggplot(mapping = aes(x = carat)) +
  ggplot2::geom_histogram(bins = 50)


# (2) 상자그림(Boxplot)
# 이상치(outlier)가 있는지를 파악할 때 그림.
# 히스토그램은 이상치를 주관적으로 판단하지만 상자그림은 객관적으로 이상치가 나타난다.
diamonds %>% 
  ggplot2::ggplot(mapping = aes(y = carat)) +
  ggplot2::geom_boxplot()

# 이상치에 대한 색을 지정 : outlier.color = 
diamonds %>% 
  ggplot2::ggplot(mapping = aes(y = carat)) +
  ggplot2::geom_boxplot(outlier.color = "red")




# 2.3 기술 통계량 = 요약통계량 ----
# 기술통계량 : descriptive statistics
# 요약통계량 : summary statistics

# (1) 중심 = 대표값 (평균, 절사평균, 중위수, 최빈수)
diamonds %>% 
  dplyr::summarise(n = n(),
                   Mean        = mean(carat),
                   TrimmedMean = mean(carat, trim = 0.05),
                   Median      = median(carat))


# (2) 퍼짐 = 산포 = 다름 ******
# 데이터 분석의 핵심은 다름을 보기 위함이다.
# 관심있는 데이터의 다름을 본다. -> 수치화(정량화)
# 이 수치가 무시해도 되는지? 안 되는지? 확인필요!!
# 무시할 수 없다면 이 다름은 누가 발생시키는가?
# 범위, 사분위범위, 표준편차, 중위수절대편차
diamonds %>% 
  dplyr::summarise(Range = max(carat) - min(carat),
                   IQR   = IQR(carat),
                   SD    = sd(carat),
                   MAD   = mad(carat))


# (3) 분포의 모양
# i.  왜도(skewness) : 대칭인가?
# ii. 첨도(kurtosis) : 중심이 얼마나 뾰족한가?
diamonds %>% 
  dplyr::summarise(Skew = e1071::skewness(carat),
                   Kurt = e1071::kurtosis(carat))


# (4) 기타 : 최소값, 최대값.
diamonds %>% 
  dplyr::summarise(Min = min(carat),
                   Max = max(carat))


# Missing value 가 있는경우.
# mean(carat, na.rm = TRUE) : missing value 제거한 다음에 평균을 구함.



# 3. 모든 일변량 질적자료를 한 번에 분석하기. ----

#빈도표와 같음..
epiDisplay::tab1(diamonds$cut,
                 cum.percent = FALSE,
                 sort.group  = "decreasing",
                 col         = "purple")


diamonds %>% 
  purrr::keep(is.factor) %>% 
  purrr::map(epiDisplay::tab1)


# 4. 모든 일변량 양적 자료에 대한 기술 통계량을 한번에 계산하기. ----

psych::describe(diamonds$carat) #10% 절사평균을 의미.
psych::describe(diamonds$carat,trim = 0.05) #5% 절사평균을 의미.

diamonds %>% 
  purrr::keep(is.numeric) %>% 
  purrr::map_dfr(psych::describe) %>% 
  writexl::write_xlsx(path = "summary.xlsx")


# 5. 한번에 EDA하기 ----
# DataExplorer CRAN에서 설명서 보기!
DataExplorer::plot_str(diamonds)
DataExplorer::introduce(diamonds)
DataExplorer::plot_intro(diamonds)
DataExplorer::plot_bar(diamonds)
DataExplorer::plot_histogram(diamonds)
DataExplorer::plot_correlation(diamonds)

DataExplorer::create_report(diamonds)


# officer package : 분석한 결과를 ppt에 넣는 기능.
# readxl : 엑셀 읽어오기.
# writexl : 엑셀 저장하기.
# tidverse : dplyr , ggplot2, tidyr, readr, purrr, tibble, forcats, stringr
# e1071
# epiDisplay
# psych
# DataExplorer

# tm, KoNLP : 언어처리
# rvest : 크롤링 , httr : 웹 통신   
# randomForest, rpart, tree : 의사결정 패키지.
# carat, car ....


# 6. 이변량(Bi-variate) 자료의 분석 ----
# 6.1 질적자료 vs 질적자료 ----
# (1) 표 = 교차표(cross Table) = 분할표(contingency Table)

diamonds %>% 
  dplyr::group_by(cut,color) %>% 
  dplyr::summarise(n = n()) %>% 
  dplyr::mutate(percent = round((n/sum(n))*100, digits = 1))


gmodels::CrossTable(diamonds$cut,diamonds$color,
                    prop.r = TRUE, #행 백분율 
                    prop.c = TRUE, #열 백분율
                    prop.t = TRUE) #전체 백분율

# (2) 막대그래프 ----

diamonds %>% 
  ggplot2::ggplot(mapping = aes(x = cut, fill = color)) +
  ggplot2::geom_bar() # 띠 막대 모양

diamonds %>% 
  ggplot2::ggplot(mapping = aes(x = cut, fill = color)) +
  ggplot2::geom_bar(position = "dodge")

#집단별 막대 그래프.
diamonds %>% 
  ggplot2::ggplot(mapping = aes(x = cut)) +
  ggplot2::geom_bar() +
  ggplot2::facet_wrap(~color,nrow = 1,ncol = 7) #집단은 무조건 질적자료 R 에서는 factor
# nrow : 그래프를 보여주는 행의 갯수.
# ncol : 그래프를 보여주는 열의 갯수.
diamonds %>% 
  ggplot2::ggplot(mapping = aes(x = cut)) +
  ggplot2::geom_bar() +
  ggplot2::facet_wrap(~color+clarity,nrow = 7,ncol = 8)



# 6.2 질적자료 vs 양적자료 ----
# 집단별  양적 자료의 분석

# (1) 집단별 히스토그램
diamonds %>% 
  ggplot2::ggplot(mapping = aes(x = carat)) +
  ggplot2::geom_histogram(binwidth = 0.5) +
  ggplot2::facet_wrap(~cut,nrow = 1,ncol = 5)

diamonds %>% 
  ggplot2::ggplot(mapping = aes(x = carat)) +
  ggplot2::geom_histogram(binwidth = 0.5) +
  ggplot2::facet_wrap(~cut + color,nrow = 5,ncol = 7)

# (2) 집단별 상자그림
diamonds %>% 
  ggplot2::ggplot(mapping = aes(y = carat))+
  ggplot2::geom_boxplot(outlier.color = "red") +
  ggplot2::facet_wrap(~cut, nrow = 1,ncol = 5)

diamonds %>% 
  ggplot2::ggplot(mapping = aes(y = carat))+
  ggplot2::geom_boxplot(outlier.color = "red") +
  ggplot2::facet_wrap(~cut+color, nrow = 5,ncol = 7)

diamonds %>% 
  ggplot2::ggplot(mapping = aes(y = carat,fill = cut))+
  ggplot2::geom_boxplot(outlier.color = "red")


# (3) 집단별 기술통계량
diamonds %>% 
  dplyr::summarise(n      = n(),
                   Mean   = mean(carat),
                   Median = median(carat),
                   SD     = sd(carat),
                   MAD    = mad(carat))

diamonds %>% 
  dplyr::group_by(cut, color, clarity) %>% 
  dplyr::summarise(n      = n(),
                   Mean   = mean(carat),
                   Median = median(carat),
                   SD     = sd(carat),
                   MAD    = mad(carat)) %>% 
  dplyr::arrange(desc(Mean)) %>% 
  writexl::write_xlsx(path = "summury_by.xlsx")

psych::describeBy(diamonds$carat,
                  group = diamonds$cut,
                  mat   = TRUE)

psych::describeBy(purrr::keep(diamonds,is.numeric),
                  group = diamonds$cut,
                  mat = TRUE)

# 6.3 양적자료 vs 양적자료 ----
# (1) 그래프 : 산점도(scatter plot)

diamonds %>% 
  dplyr::sample_frac(size   = 0.1) %>% 
  ggplot2::ggplot(mapping   = aes(x = carat, y = price)) +
  ggplot2::geom_point(col   = "red", # 점의 색깔
                      size  = 0.5,   # 점의 크기
                      shape = 2,     # 점의 모양
                      alpha = 0.7)   # 점의 투명도

diamonds %>% 
  dplyr::sample_frac(size   = 0.1) %>% 
  ggplot2::ggplot(mapping   = aes(x = carat, y = price)) +
  ggplot2::geom_point(col   = "red", 
                      size  = 0.5,   
                      shape = 2,     
                      alpha = 0.7)  +
  ggplot2::facet_wrap(~cut)

# (2) 그래프 : 산점 행렬도 (SPM : Scatter Plot Matrix)

diamonds %>% 
  dplyr::sample_frac(size = 0.1) %>% 
  purrr::keep(is.numeric) %>% 
  GGally::ggpairs()


# (3) 상관계수: Coefficient of Correlation
# pearson 의 상관계수 : r
# -1 ~ 1 사이의 값을 가짐.
# r 의 절대값이 1에 가까우면 강한 상관관계가 있다고 판단
# r 의 절대값이 0에 가까우면 상관관계가 없다고 판단
# r 의 부호가 + 이면 양의 상관관계 : x 가 증가하면 y도 증가하는 경향
# r 의 부호가 - 이면 음의 상관관계 : x 가 증가하면 y도 감소하는 경향

# cor(data$variable, data$variable, method = "pearson")
cor(diamonds$carat,diamonds$price, method = "pearson")

diamonds %>% 
  purrr::keep(is.numeric) %>% 
  cor(method = "pearson") %>% 
  round(digits = 3)

