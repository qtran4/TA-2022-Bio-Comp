#Question 1

cat wages.csv|cut -d, -f 1,2|grep -v "gender"|sort -t, -k 1,1 -k 2,2n|uniq|sed 's/,/ /'>gender-yearsExp.txt

#keeps first 2 columns, excludes headers, sorts first by gender then years experience, keeps unique pairs,
#switches commas for spaces, then writes to a file

echo "**gender-yearsExp.txt was created and contains unique gender-yearsExperience pairs sorted by gender and then year"

#Question 2

echo "**the below shows data for the highest earner"

cat wages.csv|cut -d, -f 1,2,4|sort -t, -k 3nr|head -n 1

#keeps columns 1,2,4, sorts by wage numerically in descending order, outputs row with highest wage

echo "**the below shows data for the lowest earner"

cat wages.csv|cut -d, -f 1,2,4|grep -v "gender"|sort -t, -k 3nr|tail -n 1

#keeps columns 1,2,4, excludes header, sorts by wage numerically in descending order, outputs row with lowest wage

echo "**the below shows how many females are in the top 10 earners"

cat wages.csv|cut -d, -f 1,2,4|sort -t, -k 3nr|head -n 10|grep "female"|wc -l

#keeps columns 1,2,4, sorts by wage numerically in descending order, outputs rows with top 10 wages,
#takes rows that have female earners, outputs number of rows left

#Question 3

echo "**the below shows the difference in wage between the lowest earner with 16 years of school and the lowest earner with 12 years of school"

twelve_min=$(cat wages.csv|cut -d, -f 3,4|grep -E "^12"|sort -t, -nk 2|cut -d, -f 2|head -n 1)

#defines variable as lowest wage for earners with 12 years of school

sixteen_min=$(cat wages.csv|cut -d, -f 3,4|grep -E "^16"|sort -t, -nk 2|cut -d, -f 2|head -n 1)

#defines variable as lowest wage for earners with 16 years of school

echo "$sixteen_min - $twelve_min"|bc

#outputs the difference between the minimum wage for 16 years school and 12 years school
