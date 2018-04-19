#-- Combines the area and the # oh HH


rm(list=ls())

library(data.table)




area_per_city<-fread("data/Area_per_city.csv")
HH_per_pc_city<-fread("data/HH_per_PC.csv")



names(area_per_city)[2]<-"AREA"

names(HH_per_pc_city)[1]<-"CITY"
names(HH_per_pc_city)[2]<-"HH"

#-- Get postcode
HH_per_pc_city[,POSTCODE:=substr(CITY,8,10)]
HH_per_pc_city[,POSTCODE:=gsub("-","",POSTCODE)]

#-- Get city name
HH_per_pc_city[,CITY_NAME:=substr(CITY,12,nchar(CITY))]


HH_per_pc_city<-HH_per_pc_city[2:nrow(HH_per_pc_city),.(CITY_NAME,HH)]


