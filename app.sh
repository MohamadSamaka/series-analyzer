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
    echo "g. Display the Sum of the series."
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
    echo ${series[@]}
    while ! validateInput ${series[@]}; do
        read -p "Renter numbers separated by spaces:" input
        IFS=' ' read -r -a series <<< "$input"
        echo ${series[@]}
    done 
    echo $series
}

displayYourSeries()
{
    echo "This is your series:"
    for val in "${series[@]}"; do
        echo -n $val
    done
    echo ""
}


main()
{
     while true; do
        menu
        read -p "Enter your choice (a-i): " choice
        case $choice in
            a)
                updateInput 
               ;;
            b)
                displayYourSeries $series
               ;;
            c) 
                  
               ;;
            d) 
                   

               ;;
            e) 
                   
               ;;
            f)
                  
               ;;
            g)
                  
               ;;
            i) echo "Exiting..."
               exit ;;
            *) echo "Invalid choice! Please select a-g." ;;
        esac
    done
}


main