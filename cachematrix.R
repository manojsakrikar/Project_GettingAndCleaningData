# I have taken a different approach to understand and solve this assignment. In my opinion, the concept we learn here is 
# the usage of cached object to avoid unnecessary repeated computations, particularly in a loop. 
# To demonstrate the benefit of using cached object, first I run a loop program without using cache and count as to how 
# many times the program performed a given mathematical task.  I also measure manually the time taken by the program to 
# complete. 
# Then, I add a few lines of code in my program to make use of the cache concept and run it again. Now the time taken by 
# the program to complete is very less and the program performs the mathematical computation only once.  
# For example, in the first run, when I computed the inverse of a 3 by 3 matrix for one million times, it took around 30 
# seconds to complete the program on my computer. And, in the second run with the usage of cache, it showed the result 
# within fraction of a second.  
# I suggest you to run these two functions (LoopMatrix_WithoutCache and LoopMatrix_WithCache) one by one and see the 
# results on your own computer.

LoopMatrix_WithoutCache <- function(NoOfTimes = 1:1000000){
  counter = 0 # To start measuring how many times it computes the inverse. Initialization of counter.
  for (i in NoOfTimes){
    x <- c(7, -1, -1, -3, 1, 0, -3, 0, 1)
    x <- matrix (x, nrow=3, ncol=3)
    y <- solve(x)
    counter = counter + 1 # Incrementing the counter after first inverse is computed.
    Result <- y
  }
  message("I computed the inverse for ", counter, " times.")
  return(Result)
}

LoopMatrix_WithCache <- function(NoOfTimes = 1:1000000){
  counter = 0 # To start measuring how many times it computes the inverse. Initialization of counter.
  for (i in NoOfTimes){
    x <- c(7, -1, -1, -3, 1, 0, -3, 0, 1)
    x <- matrix (x, nrow=3, ncol=3)
    Result <<- NULL # Result is the cached object in another environment. Initially its value is set as NULL.
    
    if(!is.null(Result)) {
      message("getting cached data...")
      message("I computed the inverse for ", counter, " times.")
      return(Result)
    }
    y <- solve(x)
    counter = counter + 1 # Incrementing the counter after first inverse is computed.
    Result <- y
  }
  message("I computed the inverse for ", counter, " times.")
  return(Result)
}
