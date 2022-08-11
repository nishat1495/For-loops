#install.packages("foreach", repos="http://R-Forge.R-project.org")
#install.packages("doParallel", repos="http://R-Forge.R-project.org")
#install.packages("iterators", repos="http://R-Forge.R-project.org")
#install.packages("magrittr") # package installations are only needed the first time you use it
#install.packages("dplyr")    # alternative installation of the %>%
library(magrittr) # needs to be run every time you start R and want to use %>%
library(dplyr)    # alternatively, this also loads %>%
library(parallel)
library(foreach)
library(iterators)
library(doParallel)



#Running a simple for loop
for ( i in c( 0:10)) {
    print (i*i)
}

#Looping over vector
object<-c(1,2,3,4,5,6,7,8,9)
masses<-c()
#masses<-vector(length=length(object), mode="integer")
for (i in 1:length(object)) {
    masses[i]<-2.5*object[i]^0.9
    print (masses[i])
}
rm (masses)



#Running a simple for loop using break
for (i in 1:5) {
  if(i==3) {next}
     print(i)
}


list<-c("Learning", "R", "is", "fun")
for (i in list) {
    if(i=="is") {break}
        print(i)
}

#Nested for loops in data frames
Names<-c("Ambika","Uma","Priya","Aishani","Manish","Pushpa","Sarika","Rashmi","Mrityunjay","Ravindra")
Codes_perday<-c(5,6,8,5,6,8,5,6,8,5)
df<-data.frame(Names,Codes_perday) #creating data frame
df

for (i in 1:nrow(df)) {
    df$Codes_new<-df$Codes_perday
    for (j in 1:5){
        df$Codes_new[j]<-df$Codes_new[j]*10
    }
}
df

df$Codes_new[2] #Uma's codes per day


#sample mean of n data points from a u.d over interval (0,1)
set.seed(1)  # Setting a seed for reproducibility(controlled random numbers using set.seed in r)
rep <- 50000 # Number of repetitions
n <- 2       # Number of points

Mean <- numeric(rep)

for (irep in 1:rep) {
    x <- runif(n) #selecting 2 observations from a u.d
    Mean[irep] <- mean(x)
}
hist(Mean, breaks = 40, main = paste("n = ", n))

#using foreach
library(foreach)
d <- data.frame(x=1:10, y=rnorm(10))
s <- foreach(d=iter(d, by='row'), .combine=rbind) %do% d #nested for loops operator
s

for_each <- function(x) {

    res <- foreach(i = 1:x, .combine = 'c') %do% {
        sqrt(i)
    }

    return(res)
}

system.time(for_each(10)) #this code is equivalent to the following lapply function
system.time(lapply(1:10,sqrt))

setwd("/home/nishat/Desktop/Rdatafiles")

library(haven)
data_files<-("/home/nishat/Desktop/Rdatafiles")
data_files<-list.files(data_files)
data_files

setwd("/home/nishat/Desktop/Rdatafiles")
Applicants <- list() # creates a list
appended_applicants<-list()
#listdta <- dir(pattern = "*.dta") # creates the list of all the dta files in the directory
for (k in 1:length(data_files)){
    Applicants[[k]] <- read_dta(data_files[k])
    appended_applicants<-rbind(appended_applicants,Applicants[[k]])

}
data_files
dim(appended_applicants)
library(data.table)
dt<-data.table(appended_applicants)
head(dt)

results<-vector(length=length(data_files))
for (k in 1:length(data_files)) {
    Applicants[[k]] <- read_dta(listdta[[k]])
    count<-nrow(Applicants[[k]])
    results[[k]]<-count
}
results
