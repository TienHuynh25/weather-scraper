#!/bin/bash
cities=("Winnipeg" "Toronto" "Vancouver")

> temperatures.txt

for city in "${cities[@]}"; do
  ./weather.sh -s "$city" | sed -n 's/+\(.*\) +\([0-9]\{1,3\}\)°C/\1 \2/p' >> temperatures.txt
  sleep 1
done

# Sort the temperatures.txt and save the sorted result
sort -k2 -r temperatures.txt > sorted_temperatures.txt

cat sorted_temperatures.txt