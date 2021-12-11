#!/bin/bash

source in.sh

bash sh/get-zoneid.sh > tmp/get-zoneid.log
cat tmp/list.txt | while read line; do bash sh/list1.sh "$line"; done



