#!/bin/bash

# This script serves as a menu-driven application for analyzing numerical series.
# It allows the user to input a series of numbers, and then perform various operations
# such as sorting, finding the max/min value, calculating the average, etc.

# Function to display the main menu options.
menu(){
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
isPositiveNumber() {
    local re='^[0-9]+$'
    if [[ $1 =~ $re ]] && [ $1 -ge 0 ]; then
        return 0
    fi
    return 1
}

# Function to validate the input series. It checks for at least three numbers and positivity.
validateInput(){   
    local -a seriesToValidate=("$@") # -a means we are declaring an array
    local series_length="${#seriesToValidate[@]}"
    if (( series_length < 3)); then
        echo "[-] Error: you need to enter at least three numbers!"
        return 1
    fi
    for num in ${seriesToValidate[@]}; do
        if ! isPositiveNumber $num; then
            echo "[-] The numbers need to be positive!"
            return 1
        fi
    done
    return 0
}


# Function for updating the input series. It also validates the input using validateInput function.
updateInput(){ 
    local -a input
    read -p "[!] Renter numbers separated by spaces: " input
    while ! validateInput ${input[@]}; do
        read -p "[!] Renter numbers separated by spaces: " input
    done 
    series=("${input[@]}")
    series_length="${#input[@]}"
    series_initialized=true  # Update the flag
}

# Function to display the input series as it was entered.
displaySeries(){
    echo "[+] This is your series: ${series[*]}"
}

# Function to display the series sorted in ascending order.
displayedSorted(){
    local -a sorted_arr=($(printf "%s\n" "${series[@]}" | sort -n))
    echo "[+] This is your series sorted: ${sorted_arr[*]}"
}

# Function to find and display the maximum value in the series.
getMaxNumber(){
    local max=${series[0]}
    for val in "${series[@]}"; do
        if (($val > $max)); then
            max=$val
        fi
    done
    echo "[+] This is your Max value: $max"
}

# Function to find and display the minimum value in the series.
getMinNumber(){
    local min=${series[0]}
    for val in "${series[@]}"; do
        if (($val < $min)); then
            min=$val
        fi
    done
    echo "[+] Min value: $min"
}

# Function to calculate and display the sum of the series.
getSum(){
    local sum=0
    for val in "${series[@]}"; do
        sum=$(($sum+$val))
    done
    echo "[+] Sum of the series: $sum"
}

# Function to calculate and display the average value of the series.
getAVG(){
    local sum=0
    for val in "${series[@]}"; do
        sum=$(($sum+$val))
    done
    local avg=$(($sum / $series_length))
    echo "[+] Average of the series: $avg"
}

# Function to print the length of the series.
getLength(){
    echo -e "[+] The length is:\n$series_length"
}

#Function to Wait for the user to press enter before clearing the screen and showing the menu again
waitThenClear(){
    read -p "[!] Press enter to continue..."
    clear
}

# The main function that keeps the menu-driven program running.
main()
{
    # local series
    series_initialized=false
    while true; do
        menu
        read -p "[!] Enter your choice (a-i): " choice

        #making sure that before he does any operation he will assign the series for once at least
        if [[ "$choice" != "a" && "$choice" != "i" ]] && ! $series_initialized; then
            echo "[-] Please input a series first (option a)."
            waitThenClear
            continue
        fi
        case $choice in
            a)
                updateInput
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
                getLength
                ;;
            h)
                getSum
                ;;
            i) echo "Exiting..."
                exit ;;
            *) echo "[-] Invalid choice! Please select a-i." ;;
        esac
        waitThenClear
    done
}

# Start the script by calling main function.
main
