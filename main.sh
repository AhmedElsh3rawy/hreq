#!/bin/bash

url=$1

body=$2

reqs=("GET" "POST" "PUT" "PATCH" "DELETE")

req=$(printf "%s\n" "${reqs[@]}" | fzf)

echo "${req} ${url}"
echo "$body" | jq
