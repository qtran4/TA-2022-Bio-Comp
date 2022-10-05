##usage: bash script.sh $1 
##Question No. 1###
cat $1 | cut -d "," -f 1,2 | sort -t , -k1,1 -k2,2n | uniq | tr "," " " > wages1.txt

##Question No. 2#####
echo "highest_earner" 
cat $1 | cut -d "," -f 1,2,4 | sort -t , -k 3 -n | 
tail -n 1
echo "lowest_earner"
cat $1 | cut -d "," -f 1,2,4 | sort -t , -k 3 -n | head -n 2 | tail -n 1 
echo "the_number_of_females_in_the_top_ten_earners"
cat $1 | cut -d "," -f 1,2,4 | sort -t , -k 3 -n | tail -n 10 | grep "female"| wc -l 

#Question No. 3####
high_school=$(cat $1 | cut -d , -f 3,4 | grep -w "12" | sort -t , -k 2 -n | head -n 1 | cut -d , -f 2)

college_degree=$(cat $1 | cut -d, -f 3,4 | grep -w "16" | sort -t , -k 2 -n | head -n 1 | cut -d , -f 2)
echo "the effect if graduation college on the minimum wage for earners"
echo "$college_degree - $high_school" | bc
