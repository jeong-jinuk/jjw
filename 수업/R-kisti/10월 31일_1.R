# 1. txt
# 1.1 separator : blank
# data_name <- read.table(file = "directory/filename.txt",
#                         header = TRUE,
#                         sep =" ")
blank <- read.table(file   ="d:/KISTI/blank.txt",
                    header =TRUE,
                    sep    = " ")
# data_name <- read.table(file = "directory/filename.txt",
                        #                         header = TRUE,
                        #                         sep =" ")
comma <- read.table(file   ="d:/KISTI/comma.txt",
                    header =TRUE,
                    sep    = ",")
View(comma)

tab <- read.table(file   ="d:/KISTI/tab.txt",
                    header =TRUE,
                    sep    = "\t")
View(tab)

# 2. csv
# csv : comma separated value
# 엑셀의 특수한 형태의 파일
# data_name <- read.csv(file="directory/fielsname.csv",
#                        header =true)

favor<-read.csv(file="d:/KISTI/favor.csv",
                header =TRUE)
View(favor)

# excel
# R의 기본 기능에서는 못 읽어옴
# R의 새로운 기능을 설치/로딩하기


# package : readxl : 해들리 위컴 
# 패키지 설치하기 : install.packages("package_name")
# 동일한 컴퓨터에서는 패키지 설치는 한 번만 함
install.packages("readxl")

# 패키지 로딩하기 : library(package_name)
# 패키지에 있는 기능을 메모리에 올리는 역할
# RStudio가 실행되는 동안에는 한 번만 실행하면 됨
library(readxl)


# data_name <- readxl :: read_excel(path      = "directory/filename.xlsx",
#                                   sheet     = "sheet_name' or sheet_index,
#                                   col_names = TRUE)

reading <- readxl::read_excel(path="d:/KISTI/reading.xlsx",
                              sheet="Sheet1",
                              col_names=TRUE)
View(reading)



reading2 <- readxl::read_excel(path="d:/KISTI/reading.xlsx",
                              sheet=1,
                              col_names=TRUE)
View(reading2)
 


# 작업공간(working Directory)
# (1) 현재 설정된 작업공간 : getwd()
getwd()

 # (2) 새로운 작업공간 설정하기 :setwd("directory")
setwd("d:/KISTI/")


reading3 <- readxl::read_excel(path="reading.xlsx",
                               sheet=1,
                               col_names=TRUE)
View(reading3)

