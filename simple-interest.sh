#!/bin/bash
# Simple interest calculator: SI = (P * R * T) / 100

read -p "Enter principal amount: " principal
read -p "Enter rate of interest (%): " rate
read -p "Enter time period (years): " time

num='^[0-9]+([.][0-9]+)?$'
for v in "$principal" "$rate" "$time"; do
  [[ $v =~ $num ]] || { echo "Error: enter positive numbers only." >&2; exit 1; }
done

si=$(awk -v p="$principal" -v r="$rate" -v t="$time" 'BEGIN { printf "%.2f", p * r * t / 100 }')
total=$(awk -v p="$principal" -v s="$si" 'BEGIN { printf "%.2f", p + s }')

echo "Simple Interest = $si"
echo "Total Amount    = $total"
