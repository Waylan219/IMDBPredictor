# syntax      : newDataFrame = filterByGenre(testing,genre = "Comedy")
# testing     : dataframe you want to parse through , only use the dataframe with the movies and not actors
# genre       : a string of the genre you want to have
# newDataFrame : the new database you wish to create with only rows containing the genre you passed
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
