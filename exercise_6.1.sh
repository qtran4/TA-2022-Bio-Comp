#usage: bash excersice_6.1.sh wages.csv
for gender in female male
do
    cat $1 | cut -d ',' -f 1,2 | grep -e "^$gender" | sort -t ',' -k 2 -n | uniq >> unique_combination.txt
done