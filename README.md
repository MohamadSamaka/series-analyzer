# Series Analyzer

The Series Analyzer is a versatile Bash script designed for numerical analysis of series. It offers a menu-driven interface that allows users to perform a wide range of operations on a series of positive numbers, including sorting, finding maximum and minimum values, calculating averages, and much more.

## Features

- **User-friendly Interface**: A simple menu-driven interface for easy navigation and operation.
- **Robust Input Validation**: Ensures that all inputs are positive numbers and that the series contains at least three numbers, promoting accurate analyses.
- **Comprehensive Analysis Tools**: Perform various statistical analyses with ease, including sorting, max/min values, average, sum, and element count.

## Getting Started

### Prerequisites

Ensure you have a Bash shell available on your system. This script is compatible with Linux and macOS terminals, as well as Windows systems running a Bash environment like Git Bash or WSL (Windows Subsystem for Linux).

### Installation

1. Clone or download the script to your local machine.
2. Open your terminal and navigate to the script's directory.
3. Grant execution permissions to the script (if necessary) with `chmod +x app.sh`.
4. Run the script by executing `./app.sh`.

## Usage

Upon launching the script, you'll be presented with the Series Analyzer Menu. Use the menu to navigate through the available operations:

- **a. Input a Series**: Input your series of positive numbers, separated by spaces.
- **b. Display the series**: Shows the series as originally entered.
- **c. Display the series in sorted order**: Displays the series from lowest to highest.
- **d. Display the Max value**: Reveals the highest number in the series.
- **e. Display the Min value**: Shows the lowest number in the series.
- **f. Display the Average**: Calculates and displays the average value of the series.
- **g. Display the Number of elements**: Counts and displays the number of elements in the series.
- **h. Display the Sum**: Calculates and displays the sum of all elements in the series.
- **i. Exit**: Closes the application.

Follow the prompts for each option to input data or perform analyses.

## Script Functions Overview

This script is structured around key functions to enhance modularity and ease of maintenance:

- **Validation Functions**: `isPositiveNumber` and `validateInput` ensure the integrity of user inputs.
- **Analysis Functions**: `displaySeries`, `displayedSorted`, `getMaxNumber`, `getMinNumber`, `getSum`, and `getAVG` provide comprehensive statistical analyses.
- **Utility Functions**: `menu`, `updateInput`, `getLength`, and `waitThenClear` support the script's interactive functionality.
- **Main Loop**: The `main` function orchestrates the script's workflow, handling user input and executing the corresponding actions.

## Example Session

```bash
$ ./app.sh
Series Analyzer Menu:
a. Input a Series
...
Enter your choice (a-i): a
Enter numbers separated by spaces: 1 2 3 4 5