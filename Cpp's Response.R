#@author Cynthia Gouanfo

#Of all the other parties with an exemption of NDC, CPP was the
# only party that reacted to the Kalyppo challenge with their 
# representative Ivor Greenstreet posting a picture of himself
# on facebook drinking coconut water, with the hashtag "Coconutisbetter
# Url: https://twitter.com/search?q=coconutisbetter&src=typd

#This data was obtained from the tweets I pasted on the txt file
#Since the data was not large, I was able to count the number of tweets
# in response to the Kalypo challenge on the various days

#Plotting cpp's response with to the #Kalyppo with #Coconutisbetter

y =  c(37, 4, 1, 1)
x = c(7,8,9,15)

plot(x, y,type = "l", col = "red", xlab = "October 2016", 
     ylab = "Number of Tweets", main = "CPP responds with #Coconutisbetter", 
     ylim=c(0,40), xlim=c(4,20))

