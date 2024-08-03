#!/bin/bash

reqs=("GET" "POST" "PUT" "PATCH" "DELETE")

req=$(printf "%s\n" "${reqs[@]}" | fzf)

echo "${req}"
