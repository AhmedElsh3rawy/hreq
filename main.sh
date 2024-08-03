#!/bin/bash

url=$1

headers=$(curl -sSI "$url")

content_type=$(echo "$headers" | grep 'Content-Type:' | awk '{print $2}')

body=$2

reqs=("GET" "POST" "PUT" "PATCH" "DELETE")

req=$(printf "%s\n" "${reqs[@]}" | fzf)

res=""

case $req in
GET)
	res=$(curl -sS "$url")
	;;

POST)
	echo "POST"
	;;
PUT)
	echo "PUT"
	;;
PATCH)
	echo "PATCH"
	;;
DELETE)
	echo "DELETE"
	;;
*)
	echo "Unknown method: $method"
	;;
esac

if [[ "$content_type" == *"application/json"* ]]; then
	echo "${res}" | jq
else
	echo "${res}"
fi
