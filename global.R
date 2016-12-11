Saturdaytweets <- readRDS("tweets.RDS")
Sundaytweets <- readRDS("tweetsSun.RDS")
#drop useless column
cleantweets <- function(tweets.df){
  tweets.df[,c("favorited","retweet_count",
               "source","retweeted","in_reply_to_screen_name",
               "geo_enabled","protected","user_url","place_name",
               "place_id","expanded_url","url"):=NULL]
  tweets.df$text <- iconv(tweets.df$text, from = "latin1", to = "ASCII", sub="")
  tweets.df$text <- gsub('http\\S+\\s*', '', tweets.df$text)
  tweets.df$location <- iconv(tweets.df$location, from = "latin1", to = "ASCII", sub="")
  tweets.df$description <- iconv(tweets.df$description, from = "latin1", to = "ASCII", sub="")
  tweets.df[,c("Weekday","Date1","Date2","time","timezone","year"):=tstrsplit(created_at, " ", fixed=TRUE)]
  tweets.df[,Date1 := paste(Date1,Date2)]
  tweets.df[,EAST_Time := times(time)-times("05:00:00")]
  tweets.df[,c("Date2","timezone","time"):=NULL]
  return(tweets.df)
}
Saturdaytweets <- cleantweets(Saturdaytweets)
Sundaytweets <- cleantweets(Sundaytweets)

saveRDS(Saturdaytweets,"sattweets.RDS")
saveRDS(Sundaytweets,"suntweets.RDS")

selectdata_list <- c("Saturday","Sunday")
selectfocus_list <- c("lang","followers_count")


irisdata <- read.csv("irisdata.csv")

selectx_list <- colnames(irisdata)
selecty_list <- colnames(irisdata)

class(selecty_list)
class(selectfocus_list)
