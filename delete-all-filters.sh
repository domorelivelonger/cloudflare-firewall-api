#!/bin/bash

source in.sh
#source in1.sh

bash list-filter-ids.sh > tmp/filterid-list1.txt
cat tmp/filterid-list1.txt| grep "id" > tmp/filterid-list.txt
sed -i 's%"id": "%%g' tmp/filterid-list.txt
sed -i 's%",%%g' tmp/filterid-list.txt
sed -i 's%      %%g' tmp/filterid-list.txt
cat tmp/filterid-list.txt
paste -d ' '  tmp/list.txt /dev/null tmp/filterid-list.txt > tmp/result.txt
cat tmp/result.txt | while read line1 line2
do
echo "-------------- doing deletion --------------"
bash sh/delete1.sh "$line1" "$line2";
done
