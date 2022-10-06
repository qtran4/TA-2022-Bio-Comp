#usage: bash excersice_6.1.sh wages.csv

echo "Highest earner:"
cat $1 | sort -t ',' -k 4 -n | tail -n 1 | cut -d ',' -f 1,2,4

echo "Lowest earner:"
cat $1 | sort -t ',' -k 4 -n | sed '1d' | head -n 1 | cut -d ',' -f 1,2,4

echo "Number of females in the top ten earners:"
cat $1 | sort -t ',' -k 4 -n | tail -n 10 | grep -c "female"