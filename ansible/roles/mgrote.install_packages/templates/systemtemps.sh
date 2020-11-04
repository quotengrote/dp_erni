#!/bin/bash
watch --interval 10 --differences --color --no-title  "sudo ipmitool sensor | cut --delimiter '|' -f 1-3 | grep -i "degrees" | sort -k2 -r | tr --delete \"|\" | tr --squeeze-repeats \" \" | sed -r 's/(degrees C)/°C/g;s/([[:alnum:]]+[[:space:]][[:alpha:]]+ )([[:digit:]]+\.[[:digit:]]+ )(°C)/\2\3\t\1/g;s/(.000)//g;s/( Temp)//g'"
