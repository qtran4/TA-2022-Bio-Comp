#usage: bash excersice_6.1.sh wages.csv

cat $1 | sed '1d' | cut -d ',' -f 1,2 | sort -u | sort -t ',' -k1,1d -k2,2n | tr ',' ' ' > unique_combination.txt
echo "The unique gender-yearsExperience combinations are now in file unique_combination.txt."

echo -e "Highest earner: \c"
cat $1 | sort -t ',' -k 4 -n | tail -n 1 | cut -d ',' -f 1,2,4
echo -e "Lowest earner: \c"
cat $1 | sort -t ',' -k 4 -n | sed '1d' | head -n 1 | cut -d ',' -f 1,2,4
echo -e "Number of females in the top ten earners: \c"
cat $1 | sort -t ',' -k 4 -n | tail -n 10 | grep -c "female"

lowest_in_12=$(cat $1 | cut -d ',' -f 3,4 | grep -e "^12" | sort -t ',' -k 2 -n | head -n 1 | cut -d ',' -f 2)
lowest_in_16=$(cat $1 | cut -d ',' -f 3,4 | grep -e "^16" | sort -t ',' -k 2 -n | head -n 1 | cut -d ',' -f 2)
echo -e "The effect of graduating college on the minimum wage is: \c"
echo "$lowest_in_16-$lowest_in_12" | bc