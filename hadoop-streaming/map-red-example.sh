#!/bin/bash

 echo "a b f d e f b d a s a " | ./mapper.py | sort | ./reducer.py 
