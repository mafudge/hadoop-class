logs = LOAD '/user/mafudge/remotelablogs/*' USING PigStorage(' ') AS (req_date : chararray, req_time: chararray, server_ip: chararray, http_method: chararray, req_uri : chararray, query_string: chararray, server_port: int, req_username: chararray, client_ip: chararray, user_agent: chararray);
nocomments = filter logs BY not STARTSWITH(req_date,'#');
nocomments_ipnumber  = foreach nocomments generate ipaddress.toNumber(client_ip) as client_ipnumber, *;
store nocomments_ipnumber  into '/user/mafudge/remotelablogs.orc-done' USING OrcStorage();

