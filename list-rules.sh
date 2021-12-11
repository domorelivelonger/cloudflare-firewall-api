#!/bin/bash

source in.sh
bash sh/get-zoneid.sh > tmp/get-zoneid.log
cat tmp/list.txt
cat tmp/list.txt | while read line; do bash sh/list-rules1.sh "$line"; done
