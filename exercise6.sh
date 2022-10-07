cat wages.csv | cut -d , -f 1,2 | grep 'female' | sort -t ',' -n -k 2,2 | tr ',' ' ' > gender_yearsexperience.txt
cat wages.csv | cut -d , -f 1,2 | grep -w 'male' | sort -t ',' -n -k 2,2 | tee ',' ' ' >> gender_yearsexperience.txt

echo "lowest earner"
cat wages.csv | sort -t ',' -n -k 4,4 | cut -d , -f 1,2,4 | head -n 2 |tail -n 1
echo "highest earner"
cat wages.csv | sort -t ',' -n -k 4,4 | cut -d , -f 1,2,4 | tail -n 1
echo "number of females in top 10 earners"
cat wages.csv | sort -t ',' -n -k 4,4 | tail -n 10 | grep -c "female"

echo "difference between minimum wage of 16 and 12 years of education"
a=$(grep -E 'e\,[0-9]+\,16\,' wages.csv | cut -d , -f 4 | sort -t ',' -nr -k 4,4 | tail -n 1)
b=$(grep -E 'e\,[0-9]+\,12\,' wages.csv | cut -d , -f 4 | sort -t ',' -nr -k 4,4 | tail -n 1)
echo "$a-$b" | bc
