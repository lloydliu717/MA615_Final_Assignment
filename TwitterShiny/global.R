code_of_twitter_setting <- 'load("my_oauth.Rdata")\n
filename <- paste("tweetsSun",".json",sep = "")
RDSfile <- paste("tweetsSun",".RDS",sep = "")
keywords <- c("")
filterStream(file.name = filename, 
locations=c(-125,25,-66,50), 
timeout = 3600*3, oauth=my_oauth)
tweets.df <- parseTweets(filename)
tweets.df <- as.data.table(tweets.df)
saveRDS(tweets.df,RDSfile)
tweets.df <- readRDS("tweets.RDS")'



irisdata <- read.csv("irisdata.csv")

selectx_list <- colnames(irisdata)
selecty_list <- colnames(irisdata)