#!/bin/bash


# Function to print the menu
menu()
 {
    echo "Series Analyzer Menu:"
    echo "a. Input a Series"
    echo "b. Display the series in the order it was entered."
    echo "c. Display the series in sorted order (from low to high)."
    echo "d. Display the Max value of the series."
    echo "e. Display the Min value of the series."
    echo "f. Display the Average of the series."
    echo "g. Display the Number of elements in the series."
    echo "h. Display the Sum of the series."
    echo "i. Exit."
}


# Function to check if a input  is a positive number
# Arguments:
#   $1: The number to check
# Returns:
#   0 if the number is positive, 1 otherwise
validate_positive_number() {
    re='^[0-9]+$'
    if [[ $1 =~ $re ]] && [ $1 -ge 0 ]; then
        return 0
    fi
    return 1
}

# Function to check if a number is positive
# Arguments:
#   $1: The number to check
# Returns:
#   0 if the input is valid, 1 otherwise
validateInput()
{   
    series=$1
    series_length="${#series[@]}"
    if (( series_length < 3)); then
        echo "Error: you need to enter at last three numbers!"
        return 1
    else
        for num in ${series[@]}; do
            if ! validate_positive_number $num;
                then echo "The numbers need to positive!"
                return 1
            fi
        done
        return 0
    fi
}


updateInput()
{ 
    echo "Enter numbers separated by spaces:" 
    read input
    IFS=' ' read -r -a series <<< "$input"
    while ! validateInput ${series[@]}; do
        read -p "Renter numbers separated by spaces:" input
        IFS=' ' read -r -a series <<< "$input"
    done 
}

displayYourSeries()
{
    echo "This is your series:"
    for val in "${series[@]}"; do
        echo -n "$val "
    done
    echo ""
}

displayedSorted(){
    sorted_arr=($(printf "%s\n" "${series[@]}" | sort -n))
    echo "this is your series"
    for val in "${sorted_arr[@]}"; do
        echo -n "$val "
    done
    echo ""
}

getMaxNumber(){
    max=${series[0]}
    if (($series_length>1))
    then
        for val in "${series[@]}"; do
            if (($val > $max))
                then max=$val
            fi
        done
        echo $max
    else echo $max
    fi
}

getMinNumber(){
    echo "this is the max value in the series"
    min=${series[0]}
    if (($series_length>1))
    then
        for val in "${series[@]}"; do
            if (($val < $min))
                then min=$val
            fi
        done
        echo $min
        else echo $min
    fi
}


getSum(){
    echo "this is the sum of the series"
    sum=0
    for val in "${series[@]}"; do
        sum=$(($sum+$val))
    done
    echo "$sum"
}

getAVG(){
    echo "this is the avarage of the series"
    sum=0
    for val in "${series[@]}"; do
        sum=$(($sum+$val))
    done
    avg=$(($sum / $series_length))
    echo "$avg"
}


main()
{
     while true; do
        menu
        read -p "Enter your choice (a-i): " choice
        # clear
        case $choice in
            a)
                updateInput $series
               ;;
            b)
                displayYourSeries
               ;;
            c) 
                displayedSorted
               ;;
            d) 
                getMaxNumber
               ;;
            e) 
                getMinNumber
               ;;
            f)
                getAVG
               ;;
            g)
                echo -e "the length is:\n$series_length"
               ;;
            h)
                getSum
               ;;
            i) echo "Exiting..."
               exit ;;
            *) echo "Invalid choice! Please select a-i." ;;
        esac
    done
}


main
