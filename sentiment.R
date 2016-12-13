library(stringr)
library(plyr)


a<-sample_n(Saturdaytweets, 5)
tweet<-(a$text)

pos.words = readLines("positive-words.txt")
neg.words = readLines("negative-words.txt")

#Let’s plot a histogram of the sentiment score:
hist(score$score,xlab=" ",main="Saturday tweet",
      border="black",col="skyblue")
  

score.sentiment = function(tweets, pos.words, neg.words, .progress='none')
{
  scores = laply(tweets, function(tweet, pos.words, neg.words) {
    tweet = tolower(tweet)
    words = unlist(strsplit(tweet, " "))
    pos.matches = match(words, pos.words)
    neg.matches = match(words, neg.words)
    
    pos.matches = !is.na(pos.matches)
    neg.matches = !is.na(neg.matches)
    
    score = sum(pos.matches) - sum(neg.matches)
    
    return(score)
  }, pos.words, neg.words, .progress=.progress )
  
  scores.df = data.frame(score=scores, text=tweets)
  return(scores.df)
}

score<-score.sentiment(a$text, pos.words, neg.words)
hist(score, xlab=" ",main="Sentiment of Saturday tweets ",border="black",col="skyblue")
