taxi=read.csv("C:/Users/USER/Downloads/NYC Taxi Data.csv")
View(taxi)
head(taxi)
dim(taxi)
#EDA
taxi$pickup_datetime=as.POSIXct(taxi$pickup_datetime,format="%Y-%m-%d %H:%M:%S")
taxi$dropoff_datetime=as.POSIXct(taxi$dropoff_datetime,format="%Y-%m-%d %H:%M:%S")
summary(taxi)
plot_coloumns=c("pickup_longitude","pickup_latitude","dropoff_longitude","dropoff_latitude","trip_duration")
boxplot(taxi[plot_coloumns],main="Boxplot", las=2)
sorted_taxi=taxi[order(-taxi$trip_duration), ]
top_4=sorted_taxi[1:4, ]
top_4
taxi=sorted_taxi[-(1:4), ]
summary(taxi$trip_duration)
filter_taxi=taxi[taxi$trip_duration<=120, ]
View(filter_taxi)
dim(filter_taxi)
options(repr.plot.width=17, repr.plot.height=7)
par(mfrow=c(1,3))
barplot(table(taxi$vendor_id), main="Vendor Id")
barplot(table(taxi$passenger_count), main="Passenger Count")
barplot(table(taxi$store_and_fwd_flag), main="Store and Forward Flag")
taxi=taxi[taxi$passenger_count<=6, ]
taxi=taxi[taxi$passenger_count !=0, ]
summary(taxi)
dim(taxi)
#End of EDA

#Start Feature Engineering
