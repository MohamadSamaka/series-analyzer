# Series Analyzer

This Bash script provides a user-friendly tool for numerical series analysis. Users can input a series of positive numbers and then perform various operations such as sorting, finding maximum and minimum values, calculating the average, and more.

## How to Use

To get started with the Series Analyzer, follow these simple steps:

1. Clone or download the script to your local machine.
2. Open your terminal.
3. Navigate to the script's directory.
4. Execute the script by running `./app.sh.sh`.
5. Use the menu to choose an operation by entering the corresponding letter.

## Menu Options

The Series Analyzer offers a comprehensive set of operations:

- **a. Input a Series**: Input your series of positive numbers, separated by spaces.
- **b. Display the series**: Shows the series in the order entered.
- **c. Display the series in sorted order**: Sorts and displays the series from lowest to highest.
- **d. Display the Max value**: Reveals the highest number in the series.
- **e. Display the Min value**: Shows the lowest number in the series.
- **f. Display the Average**: Calculates and displays the average value of the series.
- **g. Display the Number of elements**: Counts and displays the total number of elements in the series.
- **h. Display the Sum**: Calculates and displays the sum of the series.
- **i. Exit**: Closes the application.

## Functions

The script contains several functions to support its functionality:

- **menu**: Displays the main menu options.
- **isPositiveNumber**: Validates whether a given input is a positive number.
- **validateInput**: Validates the input series for positivity and ensures it contains at least three numbers.
- **updateInput**: Prompts the user for a series of numbers, validates the input using `validateInput`, and updates the global series array.
- **displaySeries**: Displays the series in the order it was entered.
- **displayedSorted**: Displays the series in sorted order, from low to high.
- **getMaxNumber**: Finds and displays the maximum value in the series.
- **getMinNumber**: Finds and displays the minimum value in the series.
- **getSum**: Calculates and displays the sum of the series.
- **getAVG**: Calculates and displays the average value of the series.
- **getLength**: Displays the number of elements in the series.
- **main**: Controls the main flow of the script, handling user inputs and executing corresponding actions based on the chosen menu option.

## Example Usage

```bash
$ ./app.sh.sh
Series Analyzer Menu:
a. Input a Series
b. Display the series in the order it was entered.
c. Display the series in sorted order (from low to high).
d. Display the Max value of the series.
e. Display the Min value of the series.
f. Display the Average of the series.
g. Display the Number of elements in the series.
h. Display the Sum of the series.
i. Exit.
Enter your choice (a-i): a
Enter numbers separated by spaces: 1 2 3 4 5
