#!/bin/bash

TIMESTAMP=`date +'%y%m%d%H%M%S'`
FILE="$TIMESTAMP-$RANDOM.psv"
DEST=../data/stream/$FILE
./simtweet.py -c 10 -s "1/1/2015 12:00 AM" -e "12/31/2015 11:59 PM" -f psv >  $DEST
hadoop fs -moveFromLocal $DEST tweet_stream/$FILE





