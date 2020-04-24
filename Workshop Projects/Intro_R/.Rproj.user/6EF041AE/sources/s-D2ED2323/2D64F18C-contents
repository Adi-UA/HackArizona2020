library(rtweet)
library(readr) # Helps read files
library(tidyverse)
library(tidytext)

# you can also use twitterR which doesnt require an authorization key.
# twitterR also allows for data from further back (in time)

# The code below requires a twitter account
# iran_tweets <- search_tweets("iran",
#                             n = 5000,
#                             lang = "en",
#                             iinclude_rts = FALSE,
#                             retryonratelimit = TRUE) 

# retryonratelimit times its requests from twitter every 9 minutes
# if it reaches twitters limit of data

iran_tweets <- read_tsv("iran_tweets.tsv")
nrow(iran_tweets) # numer of rows. use ncol for columns

#iran_tweets$text # accessses a column

# tokenize tweets. SPlits strings by delimiter.
tokenize_tweets <- iran_tweets %>%
  unnest_tokens(word, text) # text refers to the column text. 
# This essentially gets words from the contents of the text column

word_count <- tokenize_tweets %>%
  count(word,sort=TRUE)

# The above will count the words in the column named word from the
# data in the tokenize_tweets variable we just created


# clean the stopwords
clean_tokeized_tweets <- tokenize_tweets %>%
  anti_join(get_stopwords())
get_stopwords()

# clean word count
# dplyr specifies which library to use. In this case, dplyr.
clean_word_count <- clean_tokeized_tweets %>%
  dplyr::count(word,sort = TRUE)

# The code below requires a twitter account. Same as before but with 
# geolocation. The example below uses lat and long for new york in
# a 100 mile radius.
# iran_tweets_ny <- search_tweets("iran",
#                             n = 5000,
#                             lang = "en",
#                             iinclude_rts = FALSE,
#                             retryonratelimit = TRUE,
#                             geocode = " 40.730610,-73.935242,100mi")

# read the data for both regions
iran_tweets_ny <- read_tsv("iran_tweets_ny.tsv")
iran_tweets_az <- read_tsv("iran_tweets_az.tsv")

# tokenizes the tweets for each region
tokenize_tweets_ny = iran_tweets_ny %>%
  unnest_tokens(word,text)
tokenize_tweets_az = iran_tweets_az %>%
  unnest_tokens(word,text)

# cleans stopwords from the tweets
clean_tokeized_tweets_ny <- tokenize_tweets_ny %>%
  anti_join(get_stopwords())
get_stopwords()
clean_tokeized_tweets_az <- tokenize_tweets_az %>%
  anti_join(get_stopwords())
get_stopwords()

# clean word count for each region
clean_word_count_ny <- clean_tokeized_tweets_ny %>%
  dplyr::count(word,sort = TRUE)
clean_word_count_az <- clean_tokeized_tweets_az %>%
  dplyr::count(word,sort = TRUE)

# inverse docuent frequency is a measure of how much information
# a word provides. It is a measure of term frequency
# idf(term) ln(numer_of_documents/number of_documents_containing_term)
# This is because raw counts cant be used and data size should be
# considered. This is why we must normalize.

iran_tweets_az$my_location <- "arizona" # adds a column with given values
iran_tweets_ny$my_location <- "new york"

combined_tweets <- bind_rows(iran_tweets_az, iran_tweets_ny)

unique(combined_tweeets$my_location)


# tokenize
combined_tweets_tokens <- combined_tweets %>%
  unnest_tokens(word,text)


# creating a comparable dataframe
word_count_combined <- combined_tweets_tokens %>%
  group_by(my_location,word) %>%
  summarise(n = n()) %>% # n() is the same as count used earleir
  mutate(total = sum(n),
         norm_freq = n/total)

# for the idf frequency calculation
word_count_combined_v2 = word_count_combined %>%
  bind_tf_idf(word,my_location,n)
