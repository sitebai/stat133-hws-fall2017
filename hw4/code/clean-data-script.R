setwd("/Users/baibai/stat133/stat133-hws-fall17/hw4")

source('code/functions.R')

rawdata <- read.csv("data/rawdata/rawscores.csv")
colnames(rawdata)

summarysink <- apply(rawdata,2,summary_stats) 
n <- unlist(summarysink,use.names = TRUE)
print_stats(n)

sink("output/summary-rawscores.txt")




# for loop 
for (i in 1:length(rawdata)){
  rawdata[,i][is.na(rawdata[,i])] <- 0
}





rawdata$QZ1 <- rescale100(rawdata$QZ1,xmin = 0,xmax = 12)
rawdata$QZ2 <- rescale100(rawdata$QZ2,xmin = 0,xmax = 18)
rawdata$QZ3 <- rescale100(rawdata$QZ3,xmin = 0,xmax = 20)
rawdata$QZ4 <- rescale100(rawdata$QZ4,xmin = 0,xmax = 20)
rawdata$Test1 <- rescale100(rawdata$EX1,xmin = 0,xmax = 80)
rawdata$Test2 <- rescale100(rawdata$EX2,xmin = 0,xmax = 90)
Lab <- lapply(rawdata$ATT,function(x) score_lab(x))
Lab <- as.numeric(Lab)
rawdata$Lab <- Lab


# add a variable homework.
hw <- rawdata[,1:9]
rawdata$Homework <- round(apply(hw, 1, score_homework,drop=TRUE),0)

#add a variable quiz

quiz <- rawdata[,11:14]
rawdata$Quiz <- round(apply(quiz,1, score_quiz,drop=TRUE),0)


#Overall score. 

Overall <- function(x){
    overall<- x[,20]*0.3+x[,21]*0.15+x[,17]*0.2+x[,18]*0.25+x[,19]*0.1
  return(overall)
}

Overall <- Overall(rawdata)
rawdata$overall <- Overall
rawdata$overall <- round(rawdata$overall,0)


grade <- cut(rawdata$overall,
                breaks=c(0,50,60,70,77.5,79.5,82,86,88,90,95,100),
                labels = c("F","D","C-","C","C+","B-","B","B+","A-",
                           "A","A+"),
                right=TRUE
                )
rawdata$Grade <- grade




grade_table <- rawdata %>% 
  group_by(Grade) %>%
  summarise(count=n()) %>%
              mutate(prop=count/sum(count))



grade_table$Grade <- factor(grade_table$Grade,levels = c("A+","A","A-","B+","B","B-",
                                                         "C+","C","C-","D","F"))


rawdata[,1:18] <- round(rawdata[,1:18],0)
head(rawdata)


files <- c("Lab","Homework","Quiz","Test1","Test2","overall")
for(i in 1:6){
  sink(paste0("output/",files[i],"-stats.text"))
  n <- unlist(summary_stats(rawdata[,files[i]]),use.names = TRUE)
  print_stats(n)
  sink()
}

head(rawdata)
write.csv(rawdata,file = "data/cleandata/cleanscores.csv",row.names = TRUE)









