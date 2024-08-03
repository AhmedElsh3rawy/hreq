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
  res=$(curl -sSX POST -H "Content-Type: application/json" -d "$body" "$url")
  ;;
PUT)
  res=$(curl -sSX PUT -H "Content-Type: application/json" -d "$body" "$url")
  ;;
PATCH)
  res=$(curl -sSX PATCH -H "Content-Type: application/json" -d "$body" "$url")
  ;;
DELETE)
  res=$(curl -sSX DELETE "$url")
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
