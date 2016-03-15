	CREATE EXTERNAL TABLE IF NOT EXISTS fudgemart.surveys(
	  email string,
	  twitter_username string,
	  marital_status string,
	  household_income double,
	  own_your_home string,
	  education string,
	  fav_department string
	)
	ROW FORMAT DELIMITED 
	FIELDS TERMINATED BY ","
	LOCATION "/user/ischool/surveys"
	tblproperties ("skip.header.line.count"="1");

