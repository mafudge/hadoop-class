CREATE EXTERNAL TABLE if not exists fudgemart.tweets (
    id bigint,
    created_unixtime bigint,
    created_time string,
    username string, 
    text string
    )
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY '|' 
STORED AS TEXTFILE
LOCATION '/user/ischool/tweets';
