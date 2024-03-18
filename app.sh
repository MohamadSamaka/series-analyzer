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
    if ! [[ $1 =~ $re ]] || [ $1 -le 0 ]; then
        return 1
    fi
    return 0
}


# Function to check if a number is positive
# Arguments:
#   $1: The number to check
# Returns:
#   0 if the input is valid, 1 otherwise
validateInput()
{   
    local series = $1
    local series_length ="${#series[@]}"
    if (( series_length < 3)); then
        echo "Error: you need to enter at last three numbers!"
        return 1
    else
        for num in series; do
            if ! validate_positive_number(num)
                echo "The numbers need to positive!"
                return 1
        done
        return 0
    fi
}


updateInput()
{
    read -r "Enter numbers separated by spaces:" input
    series=($input)
    while ! validateInput($series); do
        read -r "Renter numbers separated by spaces:" input
        series=($input)
    done   
}



main()
{
     while true; do
        local result
        menu
        read -p "Enter your choice (a-i): " choice
        case $choice in
            a)
                   result=$(add $num1 $num2)
               ;;
            b)
                   result=$(subtract $num1 $num2)
               ;;
            c) 
                   result=$(multiply $num1 $num2)
               ;;
            d) 
                   result=$(divide $num1 $num2)

               ;;
            e) 
                   result=$(power_of  $num1 $num2)
               ;;
            f)
                   result=$(modulus  $num1 $num2)
               ;;
            g)
                   result=$(modulus  $num1 $num2)
               ;;
            i) echo "Exiting..."
               exit ;;
            *) echo "Invalid choice! Please select a-g." ;;
        esac
    done
}