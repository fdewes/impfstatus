library(readxl)
library(knitr)
library(dplyr)

print("Quelle: https://www.rki.de/DE/Content/InfAZ/N/Neuartiges_Coronavirus/Daten/Impfquotenmonitoring.xlsx"

download.file("https://www.rki.de/DE/Content/InfAZ/N/Neuartiges_Coronavirus/Daten/Impfquotenmonitoring.xlsx?__blob=publicationFile", "~/tmp.xlsx")
t = read_excel("~/tmp.xlsx", sheet = 2)
info = read_excel("~/tmp.xlsx", sheet = 1)
kable(info[2,])
kable(t %>% filter(!is.na(Bundesland)) %>% select(Bundesland, starts_with("Impf"), starts_with("Diff")))
