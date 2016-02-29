#!/usr/bin/python2
import sys

for line in sys.stdin:
	line = line.strip()
	course, grade = line.split('\t',1)
	print '%s\t%s' % (grade,1)

