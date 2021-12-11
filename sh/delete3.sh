#!/bin/bash

source in.sh

curl -X DELETE "https://api.cloudflare.com/client/v4/zones/$1/firewall/rules/$2" \
-H "X-Auth-Email: $email" \
-H "X-Auth-Key: $api" \
-H "Content-Type: application/json" \
--data '{}'
