	create view fudgemart.tweets_sentences as
		select tweet_id, words from fudgemart.tweets 
		lateral view explode(sentences(lower(text))) dummy as words;

