library(readr)
sensor <- read_csv("sensor.csv")
names(sensor) <- c("id","time","R1","R2","R3","R4","R5","R6","R7","R8","Temp.","Humidity") 
