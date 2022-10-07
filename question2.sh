# This is a shell script to calculate and display the information for the highest & lowest earners, as 
# well as the number of women in the top 10 earners in the data set
# suck my ass
# Usage: bash test.sh
echo 'Highest earner'
cat wages.csv | cut -d , -f 1,2,4 | sed 's/\,/\t/g' | head -1
cat wages.csv | cut -d , -f 1,2,4 | sed 's/\,/\t/g' | sort -k3 -r -n | head -1
echo 'Lowest earner'
cat wages.csv | cut -d , -f 1,2,4 | sed 's/\,/\t/g' | head -1
cat wages.csv | cut -d , -f 1,2,4 | sed 's/\,/\t/g' | sort -k3 -n | head -2 | tail -1
