create view fudgemart.tweets_sentiment as
select tweet_id, 
  	case 
    when sum( polarity ) > 0 then 'positive' 
    when sum( polarity ) < 0 then 'negative'  
    else 'neutral' end as sentiment 
from fudgemart.tweets_words_polarity 
group by tweet_id;
