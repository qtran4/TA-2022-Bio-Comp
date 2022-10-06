# Question 1

cat wages.csv | cut -d , -f 1-2 | sed 's/,/ /g' | sort -k 1,1 -k2,2n > genderExperience.txt

# Question 2

echo 'Highest Earner'
cat wages.csv | sed 's/,/ /g' | sort -k 4r | head -2 | tail -1

echo 'Lowest Earner'
cat wages.csv | sed 's/,/ /g' | sort -k 4r | tail -1

echo 'Number of Females in Top Ten Earners'
cat wages.csv | sed 's/,/ /g' | sort -k 4r | head -11 | grep -c 'female'

# Question 3

twelve=$(cat wages.csv | cut -d , -f 3-4 | sed 's/,/ /g' | sort -k 3r | 
awk '$1$)
sixteen=$(cat wages.csv | cut -d , -f 3-4 | sed 's/,/ /g' | sort -k 3r | 
awk '$$)

difference = echo "$sixteen - $twelve" | bc

echo 'Average Wage Increase if You go to College'
echo $difference

