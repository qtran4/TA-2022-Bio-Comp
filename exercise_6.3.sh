#usage: bash excersice_6.1.sh wages.csv

lowest_in_12=$(cat $1 | cut -d ',' -f 3,4 | grep -e "^12" | sort -t ',' -k 2 -n | head -n 1 | cut -d ',' -f 2)

lowest_in_16=$(cat $1 | cut -d ',' -f 3,4 | grep -e "^16" | sort -t ',' -k 2 -n | head -n 1 | cut -d ',' -f 2)

echo "$lowest_in_16-$lowest_in_12" | bc