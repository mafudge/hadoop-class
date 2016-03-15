		create view fudgemart.tweets_sentences as
				select tweet_id, words from fudgemart.tweets 
				lateral view explode(sentences(lower(text))) dummy as words;
		
		
		create view fudgemart.tweets_words as 
				select tweet_id, word from fudgemart.tweets_sentences
				lateral view explode( words ) dummy as word;
		
		(show sample output) 
	
	create view fudgemart.tweets_words_polarity as
			select 
		    	tw.tweet_id, 
		    	tw.word, 
		    	case d.polarity 
		      	when  'negative' then -1
		      	when 'positive' then 1 
		      	else 0 end as polarity 
	 		from fudgemart.tweets_words tw left outer join fudgemart.dictionary d 
				on tw.word = d.word;
	
	create view fudgemart.tweets_sentiment as
		select tweet_id, 
	  		case 
	    	when sum( polarity ) > 0 then 'positive' 
	    	when sum( polarity ) < 0 then 'negative'  
	    	else 'neutral' end as sentiment 
		from fudgemart.tweets_words_polarity 
		group by tweet_id;

