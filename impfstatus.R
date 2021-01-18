library(readxl)
library(knitr)
library(dplyr)

options(knitr.kable.NA = '')

download.file("https://www.rki.de/DE/Content/InfAZ/N/Neuartiges_Coronavirus/Daten/Impfquotenmonitoring.xlsx?__blob=publicationFile", "~/tmp.xlsx")
t <- read_excel("~/tmp.xlsx", sheet = 2)
info <- read_excel("~/tmp.xlsx", sheet = 1)

#t <- t %>% filter(!is.na(Bundesland)) %>% select(Bundesland, starts_with("Impf"), starts_with("Diff"))
#t[,3] = round(t[,3],1)

print("Quelle: https://www.rki.de/DE/Content/InfAZ/N/Neuartiges_Coronavirus/Daten/Impfquotenmonitoring.xlsx")
kable(info[2,])

t$...7 <- round(as.double(t$...7), 1)
t <- t %>% rename("Impfquote %" = "...7")
kable(t,digits=1)
