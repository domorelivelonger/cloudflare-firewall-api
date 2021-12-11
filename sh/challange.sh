#!/bin/bash

source in.sh
source in1.sh

curl -X POST \
     -H "X-Auth-Email: $email" \
     -H "X-Auth-Key: $api" \
     -H "Content-Type: application/json" \
     -d '[
{"expression": "(http.request.uri.path eq \"/wp-login.php\" and http.request.uri.query ne \"redirect=logout\")", "description":"security1"}
]' "https://api.cloudflare.com/client/v4/zones/$zoneid/filters"


bash sh/list.sh | jq '.result[] | "\(.id)"' > tmp/filterid.txt
sed -i 's%"%%g' tmp/filterid.txt

filterid=`cat tmp/filterid.txt`
cp sh/add-rule.sh.template add-rule.sh
sed -i "s%00000000000000000000000000000000000000000%$filterid%g" "add-rule.sh"
bash add-rule.sh
rm add-rule.sh
rm tmp/filterid.txt

