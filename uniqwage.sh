# used to sort unique gender-yearsExperience combinations. First by gender then by Years experience
# usage bash uniqwage.sh
cat wages.csv | cut -d, -f 1,2 | sed '1d' | sort -t ',' -k1,1 -k2,2n |uniq | sed 's/,/ /g' > sortedgenderexperience.txt
