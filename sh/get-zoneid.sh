#!/bin/bash

source in.sh
echo "-----------------------------------"
echo "get-zoneid.sh started"
echo "-----------------------------------"
curl -X  GET "https://api.cloudflare.com/client/v4/zones" \
     -H "X-Auth-Email: $email" \
     -H "X-Auth-Key: $api" \
    -H "Content-Type: application/json" | jq '.result[] | "\(.id) \(.name)"' > tmp/zones-domains.txt

curl -X  GET "https://api.cloudflare.com/client/v4/zones" \
     -H "X-Auth-Email: $email" \
     -H "X-Auth-Key: $api" \
    -H "Content-Type: application/json" | jq '.result[] | "\(.id)"' > tmp/zone-ids.txt

cp tmp/zone-ids.txt tmp/list.txt
sed -i 's%"%%g' tmp/list.txt
echo "-----------------------------------"
echo "Got next zone ids:"
cat tmp/list.txt

echo "-----------------------------------"
echo "get-zoneid.sh finished"
echo "-----------------------------------"
