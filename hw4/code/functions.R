library(dplyr)
library(stringr)


rescale100 <- function(x,xmin,xmax){
  z=100*((x-xmin)/(xmax-xmin))
  return(z)
}


remove_missing <- function(x){
  if (NA %in% x){
   x<-x[!is.na(x)]
  } 
  return(x)
}

a <- c(1,4,7,NA,10)
length(summary_stats(a))


get_minimum <- function(x,na.rm=TRUE){
  if(na.rm==TRUE) {
  x <- remove_missing(x)
  }
  minix <- sort(x)
  return(minix[1])
} 



get_maximum <- function(x,na.rm=TRUE){
  stopifnot(is.numeric(x))
  if(na.rm==TRUE){
    x <- remove_missing(x)
  }
  z <- sort(x)
  return(z[length(z)])
}



get_range <- function(x,na.rm=TRUE){
  stopifnot(is.numeric(x))
  if(na.rm==TRUE){
   x <-  remove_missing(x)
  }
  z <- (get_maximum(x,na.rm = TRUE)-get_minimum(x,na.rm = TRUE))
  return(z)
}



get_median <- function(x,na.rm=TRUE){
  stopifnot(is.numeric(x))
  if(na.rm==TRUE){
 x <- remove_missing(x)
  x <- sort(x)
  }
  if(length(x) %% 2==1){
    median_value <- x[(length(x)+1)/2]
    return(median_value)
  } else if (length(x) %% 2==0){
     x_new <- x[length(x)/2]+x[length(x)/2+1]
     x_new1<-x_new/2
     return(x_new1)
    }
}




get_average<- function(x,na.rm=TRUE){
  stopifnot(is.numeric(x))
  n <- 0
  if(na.rm==TRUE){
  x <- remove_missing(x)}
  
  for (i in 1:length(x)){
    n <- n+x[i]
  }
  average_value <- n/length(x)
  return(average_value)
}





drop_lowest <- function(x){
  x <- remove_missing(x)
  remove <- which.min(x)
  #x %in% x[remove]
  x <- x[-remove]
  return(x)
  
}



#drop_lowest <- function(x){
  #x <- remove_missing(x)
  #remove <- which.min(x)
  #x %in% x[remove]
  #x <- x[!x %in% x[remove]] # do not include x remove. 
  #return(x)
#}




get_stdev <- function(x,na.rm=TRUE){
  stopifnot(is.numeric(x))
  sum_value <- 0
  if(na.rm==TRUE){
  x1 <- remove_missing(x)
  }
  x_bar <- get_average(x1)
  variance <- (x1-x_bar)^2
  for(i in 1:length(variance)){
    sum_value <- sum_value+variance[i]
  }
  s_d <- sum_value/(length(x1)-1)
  s_d <- sqrt(s_d)
  return(s_d)
}



get_quartile1 <- function(x,na.rm=TRUE){
  stopifnot(is.numeric(x))
  if(na.rm==TRUE){
    x <- remove_missing(x)
    }
  quartile1 <- quantile(x)
  quantile1 <- as.numeric(quartile1)
  quantile1 <- quantile1[2]
  return(quantile1)
  }




get_quartile3 <- function(x,na.rm=TRUE){
  stopifnot(is.numeric(x))
  if(na.rm==TRUE){
    x <- remove_missing(x)
  }
  quartile3 <- quantile(x)
  quartile3 <- as.numeric(quartile3)
  quartile3 <- quartile3[4]
  return(quartile3)
  
}


percent90 <- function(x,na.rm=TRUE){
  if(na.rm==TRUE){
    x <- remove_missing(x)
  }
  percent90 <- quantile(x,0.9)
  percent90 <- as.numeric(percent90)
 return(percent90)
}

percent10 <- function(x,na.rm=TRUE){
  if(na.rm==TRUE){
    x <- remove_missing(x)
  }
  percent10 <- quantile(x,0.1)
  percent10 <- as.numeric(percent10)
  return(percent10)
}

c <- c(1,2,4,7,8,9)
percent10(c)

count_missing <- function(x){
  if (NA %in% x){
    x<-as.character(x)
    x<- length(x[x=="NA"])
    return(x)
  } else {
    return(0)
  }
}



summary_stats <- function(x){
  summary_stats <- list(minimum = get_minimum(x,na.rm = TRUE),
  maximum = get_maximum(x,na.rm = TRUE),
  percent10 = percent10(x,na.rm = TRUE),
  percent90 = percent90(x,na.rm = TRUE),
  quartile1 = get_quartile1(x,na.rm = TRUE),
  quartile3 = get_quartile3(x,na.rm = TRUE),
  range = get_range(x,na.rm = TRUE),
  stdev = get_stdev(x,na.rm = TRUE),
  median = get_median(x,na.rm = TRUE),
  mean =get_average(x,na.rm = TRUE),
  missing = count_missing(x)
 )
 
  return(summary_stats)
  }





print_stats<- function(x){
  names <- format(name s(x),width = max(nchar(names(x))))
  x <- as.numeric(x)
  x <- format(round(x,4),nsmall = 4)
  number <- length(x)
 for (i in 1:number){
   cat(paste(names[i],":",x[i],sep = ""),"\n")
 }
  
}




score_homework <- function(x,drop){
  if(drop==TRUE){
    x <- drop_lowest(x)
    average <- get_average(x)
    return(average)
  } else if (drop==FALSE){
    x <- remove_missing(x)
    nodrop_avg <- get_average(x)
    return(nodrop_avg)
  }
}



score_quiz<- function(x,drop){
  stopifnot(is.numeric(x))
  if(drop==TRUE){
    x <- drop_lowest(x)
    avg_quiz<- get_average(x,na.rm = TRUE)
    return(avg_quiz)
  } else if (drop==FALSE){
    x <- remove_missing(x)
    nodrop_quiz <- get_average(x,na.rm = TRUE)
    return(nodrop_quiz)
  }
}



score_lab <- function(x){
  if(x ==11) {
    return(100)
  }
  if (x==12){
   return(100)
  } 
  if ( x==10){
    return(80)
  } 
  if (x==9) {
    return(60) 
  } 
  if(x==8){
    return(40) 
  } 
  if(x==7) {
    return(20)
  } 
  if (x <= 6){
    return(0)
  }
}



