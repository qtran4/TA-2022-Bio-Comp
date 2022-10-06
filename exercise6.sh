# Exercise 6
# Usage: bash exercise6.sh wages.csv

# Task 1
# Write a file containing the unique gender-yearsEXperience combinations contained in the file "wages.csv"
cat $1 |sed 1d| sed 's/,/ /g' | sort -k 1,1 -k 2,2n -t ' '| cut -d ' ' -f 1,2 |uniq >task1.txt

# Task 2
echo "The gender, yearsExperience, and wage for the highest earner are:" 
cat $1 |sed 1d |cut -d , -f 1,2,4|sort -t , -k 3,3rn|head -1
echo "The gender, yearsExperience, and wage for the lowest earner are:"
cat $1 |sed 1d |cut -d , -f 1,2,4|sort -t , -k 3,3n| head -1
echo "The number of females in the top ten earners is:"
cat $1 |sed 1d |cut -d , -f 1,2,4|sort -t , -k 3,3rn|head -10 | grep -c 'female'

# Task 3
# The effect of graduating college (12 vs. 16 years of school) on the minimum wage for earners in this dataset

twelve=$(cat $1 | awk -F , '$3==12 {print $4}' |sort -n |head -1)
sixteen=$(cat $1 | awk -F , '$3==16 {print $4}' |sort -n |head -1)
echo "The difference in the minimum wage for those who went to college or not is:"
echo "$sixteen - $twelve" |bc
