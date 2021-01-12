FROM r-base

RUN R -e "install.packages('dplyr', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('readxl', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('knitr', repos='http://cran.rstudio.com/')"

RUN apt-get update && apt-get install -y curl

CMD curl -s https://raw.githubusercontent.com/fdewes/impfstatus/main/impfstatus.R | Rscript - 2> /dev/null
