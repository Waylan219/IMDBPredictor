library(readr)
title_ratings<-read_tsv('title.ratings.tsv')
title_basics<-read_tsv('title.basics.tsv')
name_basics<-read_tsv('name.basics.tsv')
title_crew<-read_tsv('title.crew.tsv')
title.principals <- read_tsv('titple.principals.tsv') 
title_basics_edited<-title_basics[which(title_basics$titleType == 'movie'),]
title_basics_year<-title_basics_edited[which(title_basics_edited$startYear >= '2000'),]
title_basics_final<-title_basics_year[which(title_basics_year$isAdult == '0'),] 
# Merge Database : 
temp <- merge(title_basics_final,title_ratings,by=c("tconst")) 
final_dataset<-temp[which(temp$numVotes >= 100),]
library(dplyr)
final_dataset = select(final_dataset, -2,-3,-5,-7)
rm(title_basics)
rm(temp)
rm(title_basics_edited)
rm(title_basics_final)
rm(title_basics_year)
rm(title_ratings)
gc()
test <- merge(final_dataset,principals, by=c("tconst")) 
test <- merge(test,name_basics, by=c("nconst"))
database <- test[which(test$category == "actor" | test$category == "actress" | test$category == "director"),]
database = select(database , -ordering , -job, - birthYear , -deathYear , -primaryProfession, -knownForTitles,-characters)
names(database)[names(database) == "primaryName"] <- "name"
names(database)[names(database) == "originalTitle"] <- "movieName"
names(database)[names(database) == "category"] <- "job"
database$runtimeMinutes <- as.numeric(database$runtimeMinutes)
database$startYear <- as.numeric(database$startYear)
