CREATE EXTERNAL TABLE IF NOT EXISTS fudgemart.customers(
  first_name string,
  last_name string,
  email string,
  gender string,
  last_ip string,
  address string,
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

