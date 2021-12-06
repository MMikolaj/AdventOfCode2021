#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#          part 1                                                  #### 

### training
# depths <- c(199L, 200L, 208L, 210L, 200L, 207L, 240L, 269L, 260L, 263L)

depths <- readLines("day1/input.txt")
depths<- as.numeric(depths)

## dataframe (because I like it that way)

df <-  data.frame(depths = depths)

df$dif<- c(NA, diff(depths, 1))

df$inc <- ifelse(df$dif>0, "increase", "decrease")

length(grep("increase", df$inc))

### ANSWER
# [1] 1233


#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#          part 2 (sums)                                                  #### 

### training 
# depths <- c(199L, 200L, 208L, 210L, 200L, 207L, 240L, 269L, 260L, 263L)


df <-  data.frame(depths = depths)

## custom rolling sum function 

function(x, window){
  
  window <- window-1
  
  store <- rep(NA, window)
  
  for (i in 1:(length(x)-(window))){
    
    store[i+window] <- sum(x[i:(i+window)])
    
  }
  
  return(store)
}

## dataframe (because I like it that way)

df$rolls <- foo(depths, window=3)

df$dif<- c(NA, diff(df$rolls, 1))

df$inc <- ifelse(df$dif>0, "increase", "decrease")

length(grep("increase", df$inc))


### ANSWER

# [1] 1275


