#!/bin/bash

rm tmp/list.txt
rm tmp/zone-ids.txt
rm tmp/zones-domains.txt

bash sh/get-zoneid.sh
cat tmp/list.txt | while read line; do bash sh/get1.sh "$line"; done
