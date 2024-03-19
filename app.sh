#!/bin/bash

# This script serves as a menu-driven application for analyzing numerical series.
# It allows the user to input a series of numbers, and then perform various operations
# such as sorting, finding the max/min value, calculating the average, etc.

# Function to display the main menu options.
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

# Function to validate if the input is a positive number.
validate_positive_number() {
    re='^[0-9]+$'
    if [[ $1 =~ $re ]] && [ $1 -ge 0 ]; then
        return 0
    fi
    return 1
}

# Function to validate the input series. It checks for at least three numbers and positivity.
validateInput()
{   
    series=$1
    series_length="${#series[@]}"
    if (( series_length < 3)); then
        echo "Error: you need to enter at least three numbers!"
        return 1
    else
        for num in ${series[@]}; do
            if ! validate_positive_number $num; then
                echo "The numbers need to be positive!"
                return 1
            fi
        done
        return 0
    fi
}

# Function for updating the input series. It also validates the input using validateInput function.
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

# Function to display the input series as it was entered.
displaySeries()
{
    echo "This is your series: ${series[*]}"
}

# Function to display the series sorted in ascending order.
displayedSorted(){
    local sorted_arr=($(printf "%s\n" "${series[@]}" | sort -n))
    echo "This is your series sorted: ${sorted_arr[*]}"
}

# Function to find and display the maximum value in the series.
getMaxNumber(){
    max=${series[0]}
    for val in "${series[@]}"; do
        if (($val > $max)); then
            max=$val
        fi
    done
    echo "Max value: $max"
}

# Function to find and display the minimum value in the series.
getMinNumber(){
    min=${series[0]}
    for val in "${series[@]}"; do
        if (($val < $min)); then
            min=$val
        fi
    done
    echo "Min value: $min"
}

# Function to calculate and display the sum of the series.
getSum(){
    sum=0
    for val in "${series[@]}"; do
        sum=$(($sum+$val))
    done
    echo "Sum of the series: $sum"
}

# Function to calculate and display the average value of the series.
getAVG(){
    sum=0
    for val in "${series[@]}"; do
        sum=$(($sum+$val))
    done
    avg=$(($sum / $series_length))
    echo "Average of the series: $avg"
}

# The main function that keeps the menu-driven program running.
main()
{
    while true; do
        menu
        read -p "Enter your choice (a-i): " choice
        case $choice in
            a)
                updateInput $series
                ;;
            b)
                displaySeries
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
                echo -e "The length is:\n$series_length"
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

# Start the script by calling main function.
main
