# 패키지 설치하기와 로딩하기 ----
# 이미 설치된 경우나 사용중인 경우에도 맨 위에 쓰는 이유는
# 이 스크립트에서 이런 패키지를 ???다는 정보를 줄 뿐만 아니라
# 스크립트가 독립적으로 다른곳에 보내졌을때 패키지 설치를 용이하게 하기 위함이다.
install.packages("tidyverse")
install.packages("readxl")
install.packages("rlang")
install.packages("hms")
install.packages("digest")
install.packages("utils")
library(readxl)
Yes
No
version
find.package("readxl")
find.package("hms")
find.package("digest")
find.package("rlang")

sessionInfo()

remove.packages("tidyverse")
remove.packages("readxl")
remove.packages("rlang")
remove.packages("hms")
remove.packages("digest")

.libPaths()
library(tidyverse)
diamonds
