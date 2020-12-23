#!/bin/bash
cat d161-d170.txt | while read line
do
        col1=`echo ${line} | cut -d ' ' -f 1`
        col2=`echo ${line} | cut -d ' ' -f 2`
        col3=`echo ${line} | cut -d ' ' -f 3`
        c="${col2}%2F${col3}+is%3Apr+${col1}"
        URL="https://api.github.com/search/issues?q=repo%3A${c}"
        pull_requests=(`curl -s -H "Authorization: Bearer xxxxxxxxxx" "${URL}" | jq ".items[].number"`)
        curl -H "Accept: application/vnd.github.v3+json" -H "Authorization: token xxxxxxxxxxxx" "https://api.github.com/repos/${col2}/${col3}/issues/${pull_requests}/comments"
done > output_issue161-170.txt
