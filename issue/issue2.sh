#!/bin/bash
cat d151-d160.txt | while read line
do
        col1=`echo ${line} | cut -d ' ' -f 1`
        col2=`echo ${line} | cut -d ' ' -f 2`
        col3=`echo ${line} | cut -d ' ' -f 3`
        c="${col2}%2F${col3}+is%3Apr+${col1}"
        URL="https://api.github.com/search/issues?q=is:pr+repo:${col2}/${col3}+sha:${col1}"
        curl -H "Authorization: token xxxxxxxxxxxxxxxx" -H "Accept: application/vnd.github.cloak-preview" ${URL}
done > output_issue2-151-160.txt
