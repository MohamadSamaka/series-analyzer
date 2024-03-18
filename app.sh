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
           
            ;;
        "Max Value")
            
            ;;
        "Min Value")
           
            ;;
        "Element Count")
            
            ;;
        "Series Sum")
           
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
