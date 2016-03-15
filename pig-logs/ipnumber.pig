ip  = LOAD 'iplookup' USING PigStorage(',') as (start_ipnumber:long, end_ipnumber:long, postal_code:chararray, latitude: double, longitude: double, locale_code: chararray, continent_code: chararray, contient_name: chararray, country_iso_code: chararray, country_name:chararray, subdivision_1_iso_code: chararray, subdivision_1_name: chararray, subdivision_2_iso_code: chararray, subdivision_2_name: chararray, metro_code: chararray, time_zone: chararray );
ip_noheader  = filter ip by postal_code!='postal_code';
store ip_noheader into '/user/mafudge/iplookup.orc' USING OrcStorage();

