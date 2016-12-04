#author: alvin ofori 74672017
#analysis of the #kalyppo and #kalyselfie trend 
# on twitter. finding out which of the political
# parties had the most tweets in the trend.

#fetching the twitter data from R

# 1.loading required libraries.
library(tm) #for text mining
library(httr) #for http integration with R
library(twitteR) #for working with twitter.
library(wordcloud)

# 2. checking OAUTH endpoints for twitter
oauth_endpoints("twitter")

Sys.setenv(TZ="GMT")  #setting time zone

#setting up authentication
setup_twitter_oauth("ggjifKDv72hsVfTZY63scjVrp", 
                    "BtfXuoJnPkLG7BIbz2Gbhe4PM3rfmox8pbK3S8YWFbad114IuD",
                    "1664819528-JVZKp2qun2IDANAYD5uJYQMxKepcgaLHuPDYlty", 
                    "qyBsS6n0H14HS3DQeMxNc8C8SQOIpensq36eBtbiRy2y6"
                    )

kalyppo.tweets = searchTwitter("kalyppo", 500, since="2016-10-01", until="2016-11-15")
kalyppo.df <- twListToDF(kalyppo.tweets)
kalyppo.df <- sapply(kalyppo.df,function(row) iconv(row, "latin1","ASCII",sub=""))


#writing tweets to a file
setwd("~/Documents/Ashesi/Data mining/Data-Mining-Group-A-Project") #setting working directory
fileConn = file("kalyppotweets.txt")
writeLines(c(kalyppo.df), fileConn)
close(fileConn)

tweets = Corpus(DirSource("kalyppo-tweets/"))

#cleaning up the tweets
tweets = tm_map(tweets, stripWhitespace)
tweets = tm_map(tweets, tolower)
tweets = tm_map(tweets, PlainTextDocument)
tweets = tm_map(tweets, removeWords, stopwords("english"))
tweets = tm_map(tweets, removeNumbers)
tweets = tm_map(tweets, removePunctuation)
tweets.copy = tweets

tweets = tm_map(tweets, stemDocument)

#tweetsTokenized = lapply(tweets, scan_tokenizer)
#tweetsStemCompleted = lapply(tweetsTokenized, stemCompletion, tweets.copy)
#tweets.df = data.frame(text = sapply(tweetsStemCompleted, paste, collapse=" "), stringsAsFactors = FALSE)

wordcloud(tweets, scale=c(2,0.5), max.words=100, random.order=FALSE, rot.per=0.35, use.r.layout=FALSE, colors=brewer.pal(8, "Dark2"))