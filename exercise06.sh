# this script is used to sort unique gender-yearsExperience combinations by gender and then by years experience
# usage: bash exercise06.sh
# cat wages.csv | cut -d, -f 1,2 | sed '1d' | sort -t ',' -k1,1  -k2,2n | uniq | sed 's/,/ /g' > genderandexperience.txt
# bash-3.2$ cat genderandexperience.txt


# this script is used to find the highest earner, the lowest earner, and the number of females in the top 10
# usage: bash exercise06.sh
# echo "Part 1 (higest earner):$file"
# cat 'wages.csv'| sort -t, -k4 -n | tail -n 1
# echo "Part 2 (lowest earner):$file"
# cat 'wages.csv'| sort -t, -k4 -n | head -n 2 | tail -n 1
# echo "Part 3 (number of females in top 10):$file"
# cat 'wages.csv'| sort -t, -k4 -n | tail -n 10 | grep "female" -w | wc -l

# this script is used to find the effect of graduating college on the minimum wage for earners in this dataset
# usage: bash exercise06.sh
# var1=`cat 'wages.csv'| cut -d, -f 3,4 | grep 12, | cut -d, -f 2 | sort -t, -n | head -n 1`
# var2=`cat 'wages.csv'| cut -d, -f 3,4 | grep 16, | cut -d, -f 2 | sort -t, -n | head -n 1`
# echo "$var2 - $var1" | bc
