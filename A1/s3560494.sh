#!/bin/bash

#This script is able to find out the password if the input file only has 1 username and 1 password
#Inputting a file with more than 1 username and password will be separated properly, but the testing part will not show any results


echo -------------------------
echo Password Testing Program
echo -------------------------
echo -n "Enter input file to extract usernames and hashes: "
read -r input1
#names=($(awk -F ':' '{ print $1 }' $input1))
#real=($(awk -F ':' '{ print $2 }' $input1))

names=( $( cut -d':' -f1 "$input1") )
real=( $( cut -d':' -f2 "$input1" ) )

for i in "${names[@]}"
do
    echo "$i"
done

for i in "${real[@]}"
do
    echo "$i"
done

#passwords file t1000.txt is taken from top 1000 passwords used in the world
echo -n "Enter password file to test against: "
read -r input2
#input="pwtest.txt"
while IFS= read -r var
do
    hashed=$(echo -n "$var" | sha256sum | awk '{ print $1 }')
    for i in "${var[@]}"
    do
        for j in "${names[@]}"
        do
            if [ "${hashed[i]}" == "${real[j]}" ] ; 
            then
            echo "${names[j]}'s" "password is" "${var[i]}"
            fi
        done
    done
done < "$input2"

echo "Testing against linux.words"
input2="linux.words"
while IFS= read -r dicvar
do 
    hashed=$(echo -n "$dicvar" | sha256sum | awk '{ print $1 }')
    for i in "${var[@]}"
    do
        for j in "${names[@]}"
        do
            if [ "${hashed[i]}" == "${real[j]}" ] ; 
            then
            echo "${names[j]}'s" "password is" "${var[i]}"
            fi
        done
    done
done < "$input2"

echo "Testing against randomized set"
end=$((SECONDS+120))
while [ $SECONDS -lt $end ]; 
do
    choose() { echo "${1:RANDOM%${#1}:1} $RANDOM"; }
    pass="$({ choose 'abcdefghijklmnopqrstuvwxyz'
    for i in $( seq 1 $(( 1 + RANDOM % 3 )) )
        do
            choose 'abcdefghijklmnopqrstuvwxyz'
        done
    } | sort -R | awk '{printf "%s",$1}')"
    hashed=$(echo -n "$pass" | sha256sum | awk '{ print $1 }')
    #echo $hashed
    for j in "${names[@]}"
    do
        if [ "$hashed" == "${real[j]}" ] ; 
        then
        echo "${names[j]}'s" "password is" "$pass"
        fi
    done
done
echo "Terminated script after 2 minutes"
