#!/bin/bash

cp sh/in1.sh.template in1.sh
sed -i "s%00000000000000000000000000000000%$1%g" "in1.sh"
cat in1.sh
bash sh/challange.sh
