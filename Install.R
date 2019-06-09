reposit <-"http://cran.rstudio.com/"
#Intala los paquetes para funcionar y los carga
list.of.packages <- c("shiny","ggmap","assertthat","shinyFiles","shinydashboard",
                      "plyr","timeSeries","foreign","forecast","tseries","reshape2","cowplot",
                      "assertthat","fitdistrplus","randomForest","rpart","mclust","sqldf","caret",
                      "MLmetrics","Matrix","dplyr","ADGofTest","shinyShortcut","readr","xlsx",
                      "boot","TSA","data.table","forecast","ggplot2","shinyjs","V8","installr","purrr",
                      "Hmisc","RODBC","sf","tmap","ggpubr","DT","corrplot","NbClust","Rcpp","shinycssloaders")
list.of.packages_GIT<-c("leaflet")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
new.packages_GIT <- list.of.packages_GIT[!(list.of.packages_GIT %in% installed.packages()[,"Package"])]

if(length(new.packages)) try(install.packages(c(new.packages,new.packages_GIT),repos = reposit),silent = T)
if(length(new.packages_GIT)) lapply(new.packages_GIT,
                                function(x){try(devtools::install_github(paste0("rstudio/",x)),silent = T)})

lapply(c(list.of.packages,list.of.packages_GIT),function(x){try(library(x,character.only=TRUE),silent = T)}) 
