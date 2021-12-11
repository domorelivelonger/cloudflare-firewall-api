#!/bin/bash
source in.sh


curl -X GET \
     -H "X-Auth-Email: $email" \
     -H "X-Auth-Key: $api" \
     "https://api.cloudflare.com/client/v4/zones/$1/firewall/rules"
