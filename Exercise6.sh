#usage: bash Exercise6.sh input.csv

#Part1

cat wages.csv | grep -E -w "female" | cut -d , -f 1,2 | sed 's/,/ /g' | sort -k 2n | uniq > gender-yearsExperience.csv
cat wages.csv | grep -E -w "male" | cut -d , -f 1,2 | sed 's/,/ /g' | sort -k 2n | uniq >> gender-yearsExperience.csv


#Part2

echo "Highest Earner:Gender,YearsExperience,Wage"
cat wages.csv | cut -d , -f 1,2,4 | sed 's/,/ /g' | sort -k 3n | tail -n 1

echo "Lowest Earner:Gender,YearsExperience,Wage"
cat wages.csv | cut -d , -f 1,2,4 | sed 's/,/ /g' | sort -k 3n | head -n 2 | tail -n 1

echo "Number of Females in TopTen Earners"
cat wages.csv | cut -d , -f 1,2,4 | sed 's/,/ /g' | sort -k 3n | tail -n 10 | grep -w "female" | wc -l

 
#Part 3

va12=$(cat wages.csv | cut -d , -f 3,4 | grep -E "12," | sed 's/,/ /g' | sort -k 2n | cut -d " " -f 2 | head -n 1)
va16=$(cat wages.csv | cut -d , -f 3,4 | grep -E "16," | sed 's/,/ /g' | sort -k 2n | cut -d " " -f 2 | head -n 1)


echo "Effect of Graduating College on Wages"
echo "$va16 -$va12" | bc

