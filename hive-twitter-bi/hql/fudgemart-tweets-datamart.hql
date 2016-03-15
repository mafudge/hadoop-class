DROP TABLE fudgemart.tweets_datamart;

CREATE TABLE IF NOT EXISTS fudgemart.tweets_datamart
STORED AS ORC AS
SELECT 
  c.*, t.*, s.sentiment as sentiment_label,
  case s.sentiment 
    when 'positive' then 2 
    when 'neutral' then 1 
    when 'negative' then 0 
  end as sentiment_score  
FROM fudgemart.tweets_timestamp t 
	LEFT OUTER JOIN fudgemart.tweets_sentiment s on t.tweet_id = s.tweet_id
	LEFT OUTER JOIN fudgemart.customer_surveys c on c.twitter_username = t.username;
