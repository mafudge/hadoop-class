	create view fudgemart.tweets_words_polarity as
	select 
	    tw.tweet_id, 
	    tw.word, 
	    case d.polarity 
	      when  'negative' then -1
	      when 'positive' then 1 
	      else 0 end as polarity 
	 from fudgemart.tweets_words tw left outer join dictionary d on tw.word = d.word;

