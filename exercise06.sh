#Q1
#usage: bash exercise06.sh wages.csv
cat $1 | tail -n +2 | cut -d , -f 1,2 | tr "," " " | sort -t " " -k 1,1 -k2,2n | uniq > answer1.txt

#Q2
#usage: bash exercise06.sh wages.csv
echo "Gender, Years Experience, and Wage for highest earner" 
cat $1 | cut -d , -f 1,2,4 | sort -t , -k 3n | uniq | tail -n 1
echo "Gender, Years Experience, and Wage for lowest earner"
cat $1 | cut -d , -f 1,2,4 | sort -t , -k 3n | uniq | head  -n 2 | tail -n 1
echo "Number of females in top ten earners"
cat $1 | cut -d , -f 1,2,4 | sort -t , -k 3n | uniq | tail -n 10 | grep "female" | wc -l

#Q3
#usage: bash exercise06.sh wages.csv
echo "Effect of graduating college on minimum wage"
no_college=$(cat $1 | cut -d , -f 3,4 | grep "12," | cut -d , -f 2 | sort -n | head -n 1)
college=$(cat $1 | cut -d , -f 3,4 | grep "16," | cut -d , -f 2 | sort -n | head -n 1)
echo "$college-$no_college" | bc
