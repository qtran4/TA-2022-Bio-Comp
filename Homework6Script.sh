# This script will return the answers for exercise 6
# Useage: Homework6Script.sh

# Problem 1:
echo "   "
echo "Problem 1 Solution"
cat wages.csv | cut -d , -f 1,2 | sed 's/,/ /g' | sort -k 1,1 -k 2,2 -V > genderYears.txt
cat genderYears.txt
echo "Problem 1 Solution END"

# Problem 2:
echo "   "
echo "Problem 2 Solution"
cat wages.csv | cut -d , -f 1,2,4 | sed 's/,/ /g' | sort -k 3,3 -V | head -n -1 > Earners.txt
echo "The highest earner is:"
cat Earners.txt | tail -n 1 
echo "The lowest earner is:"
cat Earners.txt | head -n 1
echo "The number of females in the top 10 earners is:"
cat Earners.txt | tail -n 10 | grep 'female' -o | wc -l
echo "Problem 2 END"

# Problem 3:
echo "   "
echo "Problem 3 Solution"
Val_1=$(cat wages.csv | cut -d , -f 3,4 | sed 's/,/ /g' | grep -e '12 ' | sort -k 1,1 -k 2,2 -V | head -n 1 | cut -d ' ' -f 2) 
Val_2=$(cat wages.csv | cut -d , -f 3,4 | sed 's/,/ /g' | grep -e '16 ' | sort -k 1,1 -k 2,2 -V | head -n 1 | cut -d ' ' -f 2)
echo "The difference between the minimum salary for somone with 16 years of education and the minimum salary for someone with 12 years of education is:"
echo "$Val_2 - $Val_1" | bc
echo "Problem 3 Solution END"
