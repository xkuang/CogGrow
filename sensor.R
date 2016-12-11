#Data Source Citation: Ramon Huerta, Thiago Mosqueiro, Jordi Fonollosa, Nikolai Rulkov, Irene Rodriguez-Lujan. 
#Online Decorrelation of Humidity and Temperature in Chemical Sensors for Continuous Monitoring. Chemometrics and Intelligent Laboratory Systems 2016. 
#* id: identification of the induction, to be matched with id in file HT_Sensor_metadata.dat;
#* time: time in hours, where zero is the start of the induction;
#* R1 â€“ R8: value of each of the 8 MOX sensors resistance at that time;
#* Temp.: measurement of temperature in Celsius at that time;
#* Humidity: measurement of humidity in percent at that time.

library(readr)
library(ggplot2)
sensor <- read_csv("sensor.csv")
names(sensor) <- c("id","time","R1","R2","R3","R4","R5","R6","R7","R8","Temp.","Humidity") 

time <- dplyr::select(sensor, time)
write.csv(time, file = "time.csv", row.names = FALSE)
#use out source to convert computer time into human time
HumanTime <- read_csv("HumanTime.csv")
names(HumanTime) <- c("time","humanTime") 
#HumanTime$ID <- seq.int(nrow(HumanTime))
#sensor$ID <- seq.int(nrow(sensor))
#S <- dplyr::left_join(sensor, HumanTime, by="ID")

#overview
ggplot(sensor) + geom_line(aes(time, Temp., color="temperature")) + 
  geom_line(aes(time, Humidity, color="humidity")) + 
  xlab("Time") + ylab("value")

#sampling time sector
section1 <- dplyr::sample_frac(sensor, 0.0001, replace = TRUE)
ggplot(section1) + geom_line(aes(time, Temp., color="temperature")) + 
  geom_line(aes(time, Humidity, color="humidity")) + 
  xlab("Time") + ylab("value")

sensor$Humid <- sensor$Humidity * 0.01

#The heat index or humiture or humidex temperature is the temperature felt by the skin rather than the actual temperature due to the humidity level.
sensor$HI <- -26.75+ 2.049 * sensor$Temp. + 10.14333 * sensor$Humid - 0.2 * sensor$Humid * sensor$Temp. +
  - 0.006 *sensor$Temp.* sensor$Temp. - 0.055 * sensor$Humid * sensor$Humid + 0.00129 *sensor$Temp.* sensor$Temp. *sensor$Humid +
  + 0.00085 *sensor$Temp. * sensor$Humid * sensor$Humid

section1 <- dplyr::sample_frac(sensor, 0.0001, replace = TRUE)
#ggplot(section1) + geom_line(aes(time, HI, color="Human temperature")) + 
#  geom_line(aes(time, Temp., color="true temperature")) + 
#  xlab("Time") + ylab("F")

# id = 1
id1 <- dplyr::filter (sensor, id == "1")
ggplot(id1) + geom_line(aes(time, HI, color="Human temperature")) + 
  geom_line(aes(time, Temp., color="true temperature")) + 
  xlab("Time") + ylab("F")

# id = 2
id2 <- dplyr::filter (sensor, id == "2")
ggplot(id2) + geom_line(aes(time, HI, color="Human temperature")) + 
  geom_line(aes(time, Temp., color="true temperature")) + 
  xlab("Time") + ylab("F")

# id = 3
id3 <- dplyr::filter (sensor, id == "3")
ggplot(id3) + geom_line(aes(time, HI, color="Human temperature")) + 
  geom_line(aes(time, Temp., color="true temperature")) + 
  xlab("Time") + ylab("F")

# id = 4
id4 <- dplyr::filter (sensor, id == "4")
ggplot(id4) + geom_line(aes(time, HI, color="Human temperature")) + 
  geom_line(aes(time, Temp., color="true temperature")) + 
  xlab("Time") + ylab("F")

# id = 0
id0 <- dplyr::filter (sensor, id == "0")
ggplot(id0) + geom_line(aes(time, HI, color="Human temperature")) + 
  geom_line(aes(time, Temp., color="true temperature")) + 
  xlab("Time") + ylab("F")



