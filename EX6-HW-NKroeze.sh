# Nate Kroeze Exercise 6 HW Script 10-07-2022

# Running this script with satisfy the questions outlined in Exercise06.pdf

# Usage: bash EX6-HW-NKroeze.sh

#Q1 Creates a file containing the unique gender:YearsExperience combinations within wages.csv
cat wages.csv | sort -t "," -k 1,1 -k2,2n -u | cut -d "," -f1,2 | tr "," " " > wages_sorted.csv

#Q2 Returns information about the highest paid, lowest paid, and number of females in the top earner category
echo "Gender, YearsExperience, and Wage of Highest Earner"
cat wages.csv | sort -t "," -rn -k4,4 | head -n 1 | cut -d "," -f1,2,4 | tr "," " "

echo "Gender, YearsExperience, and Wage of Lowest Earner"
cat wages.csv | sort -t "," -rn -k4,4 | tail -n 2 | cut -d "," -f1,2,4 | head -n 1 | tr "," " "

echo "Number of Females in the Top Ten Earners"
cat wages.csv | sort -t "," -rn -k4,4 | head -n 10 | cut -d "," -f1,2,4 | grep female -c

#Q3 Effect of graduate college (12 v. 16 years) on the minimum wage for earners in the dataset
echo "Difference between Minimum Wage Earned by College Graduates vs Non-Graduates"
highWage=$( cat wages.csv | awk -F, '$3 >= 16 {print $4}' | sort -n | head -n 2 | tail -n 1)

lowWage=$(cat wages.csv | awk -F, '$3 <= 12 {print $4}' | sort -n | head -n 1)
echo $highWage - $lowWage | bc
