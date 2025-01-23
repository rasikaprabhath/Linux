#!/bin/bash

#this is to print a pattern using the for loop
# 1
# 2 3
# 3 4 5
# 4 5 6 7

rows=4

for ((i=1; i<=$rows; i++));
do
    
    for((j=i; j<2*i; j++));
    do
        echo -n "$j "
    done
    echo " "
done
