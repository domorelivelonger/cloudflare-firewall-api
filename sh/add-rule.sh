#!/bin/bash
source in.sh
source in1.sh

curl -X POST \
     -H "X-Auth-Email: $email" \
     -H "X-Auth-Key: $api" \
     -H "Content-Type: application/json" \
     -d '[
  {
    "filter": {
      "id": "3f232d5d95dd4c80afa8cd60f63a4b0e"
    },
    "action": "challenge",
    "description": "security1"
  }
]' "https://api.cloudflare.com/client/v4/zones/$zoneid/firewall/rules"
