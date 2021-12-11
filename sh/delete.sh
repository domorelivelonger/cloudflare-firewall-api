#!/bin/bash

source in.sh
#source ../in1.sh

curl -X DELETE \
     -H "X-Auth-Email: $email" \
     -H "X-Auth-Key: $api" \
     "https://api.cloudflare.com/client/v4/zones/$zoneid/filters?id=$1"

