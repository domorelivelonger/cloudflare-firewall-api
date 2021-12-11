source in.sh
#source in1.sh

bash list-rules.sh > tmp/rules-list1.txt
cat tmp/rules-list1.txt| grep "id" > tmp/rules-list.txt
sed -i 's%"id": "%%g' tmp/rules-list.txt
sed -i 's%",%%g' tmp/rules-list.txt
sed -i 's%      %%g' tmp/rules-list.txt
sed -i 's%  %%g' tmp/rules-list.txt
cat tmp/rules-list.txt
paste -d ' '  tmp/list.txt /dev/null tmp/rules-list.txt > tmp/result2.txt
cat tmp/result2.txt | while read line1 line2
do
echo "$line1" "$line2";
echo "-------------- doing deletion --------------"
bash sh/delete3.sh "$line1" "$line2";
done
