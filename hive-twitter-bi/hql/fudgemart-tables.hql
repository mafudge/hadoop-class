	CREATE EXTERNAL TABLE IF NOT EXISTS fudgemart.customers(
		  first_name string,
		  last_name string,
		  email string,
		  gender string,
		  last_ip string,
		  city string,
		  state string,
		  total_orders int,
		  total_purchased double,
		  months_customer int
		)
		ROW FORMAT DELIMITED 
		FIELDS TERMINATED BY ","
		LOCATION "/user/ischool/customers"
		tblproperties ("skip.header.line.count"="1");
	
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
	
	CREATE EXTERNAL TABLE if not exists fudgemart.dictionary (
		    type string,
	  		length int,
		    word string,
		    pos string, 
		    stemmed string, 
		    polarity string )
		ROW FORMAT DELIMITED 
		FIELDS TERMINATED BY '\t' 
		STORED AS TEXTFILE
		LOCATION '/user/ischool/dictionary';
	
		create view fudgemart.customer_surveys as
				SELECT 
					concat(c.last_name , ', ', c.first_name)  as full_name,
					c.email,
					c.gender,
					c.last_ip,
					c.city,
					c.state,
					c.total_orders,
					c.total_purchased,
					c.months_customer,
					cast(c.months_customer / 12 as smallint) as years_customer,
					s.twitter_username,
					s.marital_status,
					s.household_income,
					s.own_your_home,
					s.education,
					s.fav_department
				FROM fudgemart.customers c 
				join fudgemart.surveys s on c.email = s.email;

