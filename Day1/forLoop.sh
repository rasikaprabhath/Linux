#!/usr/bin/bash

# demo to print the below pattern
# 1
# 1 2
# 1 2 3 
# 1 2 3 4
# 1 2 3 4 5


# Number of rows in the pattern
rows=4

for ((i=1; i<=$rows; i++)); 
do
    for((j=1; j<=$i; j++));
    do    
        echo -n $j
    done
    echo " "
done
