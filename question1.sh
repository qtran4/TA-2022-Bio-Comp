# This is the script used to create the .csv file answer for question 1.
# Usage: bash question1.sh
cat wages.csv | cut -d , -f 1-2 | tail -n +2 | sed 's/\,/ /g' | sort -u -V > question1.csv
