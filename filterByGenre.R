# two while loops to loop through entire database and then the entries in the genre category
filterByGenre <- function(dataframe,genre){
  newdataframe <- subset(dataframe,FALSE)
  genrelist <- strsplit(dataframe$genre,',')
  for(x in 1:nrow(dataframe)){
    for(i in genrelist[[x]]){
      if(i == genre){
        newdataframe <- rbind(newdataframe,dataframe[x,])
      }
    }
  }
  return(newdataframe)
}
