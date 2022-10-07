#!/bin/bash
echo "Highest wage earner stats: "
cat wages.csv | awk 'NR>1' | cut -d ',' -f1,2,4 | sort -t, -k3,3rn | head -n 1
echo "Lowest wage earner stats: "
cat wages.csv | awk 'NR>1' | cut -d ',' -f1,2,4 | sort -t, -k3,3n | head -n 1
echo "Number of females in top ten wage earners: "
cat wages.csv | awk 'NR>1' | cut -d ',' -f1,2,4 | sort -t, -k3,3rn | head -n 10 | grep -c 'female'
echo "Difference between minimum wage of college grads vs. non-grads: "
colMin=$(cat wages.csv | awk 'NR>1' | grep ',16,' | cut -d ',' -f4 | sort -n | head -n 1)
nonColMin=$(cat wages.csv | awk 'NR>1' | grep -v ',16,' | cut -d ',' -f4 | sort -n | head -n 1)
echo "$colMin - $nonColMin" | bc

