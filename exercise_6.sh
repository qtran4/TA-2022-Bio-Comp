# exercise_6.sh is a script that returns a file with all unique gender and yearsExp combos from wages.csv
# it also returns the hgihest earner, the lowest earner, and number of females in top 10 earners, and finally
# and then determines the effect of graduating college on the minimum wage for earners
# usage bash exercise_6.sh *.csv

cat *.csv | cut -d, -f 1,2 | tail -n +2 |sort -t"," -k1,1 -k2n,2 | uniq > question_1.txt
echo "This is the highest earner"
cat *.csv | cut -d, -f 1,2,4 | sort -t"," -k3n,3 | tail -n 1 
echo "This is the lowest earner"
cat *.csv | cut -d, -f 1,2,4 | sort -t"," -k3n,3 | head -n 2 | tail -n 1
echo "The number of females in the top ten earners is:"
cat *.csv | cut -d, -f 1,2,4 | sort -t"," -k3n,3 | tail -n 10 | grep -w -c female
highschool_wage=$(cat *.csv | cut -d, -f 1,3,4 | sort -t"," -k3n,3 | grep -w 12 | head -n 1 | cut -d, -f 3)
college_wage=$(cat *.csv | cut -d, -f 1,3,4 | sort -t"," -k3n,3 | grep -w 16 | head -n 1 | cut -d, -f 3)
echo "The effect of graduating college on minimum wage in this dataset is:"
echo "$college_wage - $highschool_wage" | bc
