# 1. .txt ----
  # 1.1 separator : blank ----
   # data_name <- read.table(file  = "directory/filename.txt",
                          # header = TRUE,
                          # sep    = " ")
blank <- read.table(file = "/Users/jeongjin-uk/Documents/R-kisti/blank.txt",
                    header = TRUE,
                    sep = " ")

  # 1.2 separator : comma ----
    # data_name <- read.table(file  = "directory/filename.txt",
                            # header = TRUE,
                            # sep    = " ")
comma <- read.table(file = "/Users/jeongjin-uk/Documents/R-kisti/comma.txt",
                    header = TRUE,
                    sep = ",")

View(comma)


  # 1.2 separator : comma ----
    # data_name <- read.table(file  = "directory/filename.txt",
                            # header = TRUE,
                            # sep    = "\t")
tab <- read.table(file = "/Users/jeongjin-uk/Documents/R-kisti/tab.txt",
                    header = TRUE,
                    sep = "\t")

View(tab)


# 2. .csv ----
  #csv : comma separated value
  # 엑셀의 특수한 형태의 파일.
  # data_name = read.csv(file = "directory/filename.csv",
#                        header = True)

favor <- read.csv(file = "/Users/jeongjin-uk/Documents/R-kisti/favor.csv",
                  header = TRUE)
View(favor)


# 3. .excel ----
  # R 의 기본기능에서는 못 읽어옴
  # R의 새로운 기능을 설치/로딩하기.

# package : readxl : 해들리 위컴(위캠)
# 패키지 설치하기. : install.packages("package_name")
# 동일한 컴퓨터에서는 패키지 설치는 한번만 함.
install.packages("readxl")

# 패키지 로딩하기 : library(package_name)
# 패키지에 있는 기능을 메모리에 올리는 기능을 함.
# Rstudio가 실행되는 동안 한번만 실행하면 됨.
library(readxl)

# data_name <- readxl::read_excel(path      = "directory/filename.xlsx",
#                                   sheet     = "sheet_name" or sheet_index,
#                                   col_names = TRUE)

reading <- readxl::read_excel(path = "/Users/jeongjin-uk/Documents/R-kisti/reading.xlsx",
                      sheet = "Sheet1", col_names = TRUE)
View(reading)


# read_excel() : tibble

reading2 <- read_excel(path = "/Users/jeongjin-uk/Documents/R-kisti/reading.xlsx",
                      sheet = 1,
                      col_names = TRUE)
View(reading2)



remove.packages("readxl")
install.packages("readxl",dependencies = TRUE)

.libPaths()

install.packages("rlang")
yes

