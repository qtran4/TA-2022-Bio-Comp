# This script uses wages.csv to demonstrate the effect of attending and graduating college on minimum wage
# Usage: bash question3.sh
No_college=$(cat wages.csv | grep -E ',[0-9]{1,2},12,' | cut -d, -f 3,4 | sed 's/\,/ /g' | sort -k1,2 -n | head -1 | cut -d ' ' -f 2)
One_year=$(cat wages.csv | grep -E ',[0-9]{1,2},13,' | cut -d, -f 3,4 | sed 's/\,/ /g' | sort -k1,2 -n | head -1 | cut -d ' ' -f 2)
Two_years=$(cat wages.csv | grep -E ',[0-9]{1,2},14,' | cut -d, -f 3,4 | sed 's/\,/ /g' | sort -k1,2 -n | head -1 | cut -d ' ' -f 2)
Three_years=$(cat wages.csv | grep -E ',[0-9]{1,2},15,' | cut -d, -f 3,4 | sed 's/\,/ /g' | sort -k1,2 -n | head -1 | cut -d ' ' -f 2)
Four_years=$(cat wages.csv | grep -E ',[0-9]{1,2},16,' | cut -d, -f 3,4 | sed 's/\,/ /g' | sort -k1,2 -n | head -1 | cut -d ' ' -f 2)
echo "How each subsequent year of higher-education increases your wage:"
echo "Just one year" 
echo "$One_year - $No_college" | bc
echo "Two years" 
echo "$Two_years - $No_college" | bc
echo "Three years" 
echo "$Three_years - $No_college" | bc
echo "Four years (college degree!)" 
echo "$Four_years - $No_college" | bc
