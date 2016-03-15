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
