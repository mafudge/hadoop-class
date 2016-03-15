#!/bin/bash

TIMESTAMP=`date +'%y%m%d%H%M%S'`
FILE="$TIMESTAMP-$RANDOM.psv"
DEST=../data/stream/$FILE
./simtweet.py -c 10 -s "1/1/2016 12:00 AM" -e "3/15/2016 11:59 PM" -f psv >  $DEST
hadoop fs -moveFromLocal $DEST tweets/$FILE





