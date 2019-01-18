#!/bin/bash
echo "Searching for : $@"
for term in $@ ; do
    echo "$term"
    search="$search%20$term"
done
    w3m "http://www.google.com/search?q=$search"
