#author: alvin ofori 74672017
#analysis of the #kalyppo and #kalyselfie trend 
# on twitter. finding out which of the political
# parties had the most tweets in the trend.

#fetching the twitter data from R

# 1.loading required libraries.
library(tm) #for text mining
library(httr) #for http integration with R
library(twitteR) #for working with twitter.

# 2. checking OAUTH endpoints for twitter
oauth_endpoints("twitter")

Sys.setenv(TZ="GMT")  #setting time zone

#setting up authentication
setup_twitter_oauth("ggjifKDv72hsVfTZY63scjVrp", 
                    "BtfXuoJnPkLG7BIbz2Gbhe4PM3rfmox8pbK3S8YWFbad114IuD",
                    "1664819528-JVZKp2qun2IDANAYD5uJYQMxKepcgaLHuPDYlty", 
                    "qyBsS6n0H14HS3DQeMxNc8C8SQOIpensq36eBtbiRy2y6"
                    )

kalyppo.tweets = searchTwitter("kalyppo", 1000, since="2016-10-01")

#fetch tweets representing ndc, npp, and maybe ppp, for training your model
npp.tweets = searchTwitter("@NAkufoAddo", 1000)
ndc.tweets = searchTwitter("@JDMahama", 1000)
ppp.tweets = searchTwitter("@pknduom", 1000)


npp.df <- twListToDF(npp.tweets)
ndc.df <- twListToDF(ndc.tweets)
ppp.df <- twListToDF(ppp.tweets)
#creating model
#get rid of emoticons
npp.$text <- sapply(npp.df$text,function(row) iconv(row, "latin1","ASCII",sub=""))
ndc.df$text <- sapply(ndc.df$text,function(row) iconv(row, "latin1","ASCII",sub=""))


npp.tweets = VCorpus(DataframeSource(npp.tweets))


#then, feed the kalyppo tweets into the model, so it does the separation for you
#then you can know which share of the tweets was owned by which political party.

