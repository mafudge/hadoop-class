ip  = LOAD 'iplookup' USING PigStorage(',') as (start_ipnumber:long, end_ipnumber:long, postal_code:chararray, latitude: double, longitude: double, locale_code: chararray, continent_code: chararray, contient_name: chararray, country_iso_code: chararray, country_name:chararray, subdivision_1_iso_code: chararray, subdivision_1_name: chararray, subdivision_2_iso_code: chararray, subdivision_2_name: chararray, metro_code: chararray, time_zone: chararray );
ip_noheader  = filter ip by postal_code!='postal_code';

REGISTER 'ipaddress.py' using jython as ipaddress;
logs = LOAD '/user/mafudge/remotelablogs/*' USING PigStorage(' ') AS (req_date : chararray, req_time: chararray, server_ip: chararray, http_method: chararray, req_uri : chararray, query_string: chararray, server_port: int, req_username: chararray, client_ip: chararray, user_agent: chararray);
nocomments = filter logs BY not STARTSWITH(req_date,'#');
nocomments_ipnumber  = foreach nocomments generate ipaddress.toNumber(client_ip) as client_ipnumber, *;

ipanalysis_cross = CROSS nocomments_ipnumber, ip_noheader PARALLEL 4;
ipanalysis = FILTER ipanalysis_cross BY (client_ipnumber>=start_ipnumber AND client_ipnumber<=end_ipnumber);
STORE ipanalysis INTO '/user/mafudge/ipanalysis.orc' USING OrcStorage();

