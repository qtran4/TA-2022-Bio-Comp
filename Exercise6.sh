#Usage: bash ex6.sh

# Number 1
#Write file with unique gender and years of experience combinations
cat wages.csv | grep -E "(male|female),[0-9]{1,2}" | cut -d "," -f 1,2 | tr ',' ' ' > ex6.txt

# Number 2
#return gender, years exp, wage for HIGHEST earner
echo Gender, years of experience, and wage for highest earner
cat wages.csv | tail -n 3294 | sort -n -t , -k 4 | cut -d , -f 1,2,4 | tail -n 1
#return gender, years exp, wage for LOWEST earner
echo Gender, years of experience, and wage for lowest earner
cat wages.csv | tail -n 3294 | sort -n -t , -k 4 | cut -d , -f 1,2,4 | head -n 1
#the number of females in the top ten earners in this data set
echo Number of females in the top ten of earnes for this data set
cat wages.csv | tail -n 3294 | sort -n -t , -k 4 | tail -n 10 | grep -E "female" | wc -l

# Number 3
#effect of graduating college on minimum wages earners for this set
echo Effect of graduating college on minimum wages earners
grad12_wage=$(cat wages.csv | tail -n 3294 | sort -n -t , -k 4 | cut -d , -f 3,4 | grep -E "12," | head -n 1 | cut -d, -f 2)
grad16_wage=$(cat wages.csv | tail -n 3294 | sort -n -t , -k 4 | cut -d , -f 3,4 | grep -E "16," | head -n 1 | cut -d, -f 2)

echo "$grad16_wage - $grad12_wage" | bc
