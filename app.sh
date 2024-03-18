#!/bin/bash
declare -a array #creating an array just to experiment with the functions in the menu
read -a array
length=${#array[@]}
options=("Display Series" "Display Series LowHigh" "Max Value" "Min Value" "Element Count" "Series Sum" "Exit")

echo "Select an option:"

select opt in "${options[@]}"
do
    case $opt in
       "Display Series")
            echo "this is your series"
            for val in "${array[@]}"; do
                echo -n $val
            done
            echo ""
            ;;
        "Display Series LowHigh")
            sorted_arr=($(printf "%s\n" "${array[@]}" | sort -n))
            echo "this is your series"
            for val in "${sorted_arr[@]}"; do
                echo -n $val
            done
            echo ""
            ;;
        "Max Value")
            echo "this is the max value in the array"
            max=${array[0]}
            if (($length>1))
            then
           for val in "${array[@]}"; do
                if (($val > $max))
                then max=$val
                fi
            done
            echo $max
            else echo $max
            fi
            ;;
        "Min Value")
           echo "this is the max value in the array"
            min=${array[0]}
            if (($length>1))
            then
           for val in "${array[@]}"; do
                if (($val < $min))
                then min=$val
                fi
            done
            echo $min
            else echo $min
            fi
            ;;
        "Element Count")
            echo "this is how many elements are in the array : $length"
            ;;
        "Series Sum")
           echo "this is the sum of the series"
           sum=0
           for val in "${array[@]}"; do
                sum=$(($sum+$val))
            done
            echo "$sum"
            ;;
        "Exit")
            echo "Exiting..."
            break
            ;;
        *)
            echo "Invalid option"
            ;;
    esac

    done
