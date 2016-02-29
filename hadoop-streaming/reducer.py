#!/usr/bin/python2
from operator import itemgetter
import sys

current_item = None
current_count = 0
word = None

for line in sys.stdin:
	line = line.strip()
	item, count = line.split('\t',1)
	try: 
		count = int(count)
	except ValueError:
		continue 

	if current_item == item:
		current_count +=count
	else:
		if current_item:
			print '%s\t%s' % (current_item, current_count)
		current_count = count
		current_item = item

if current_item == item:
	print '%s\t%s' % (current_item, current_count)
