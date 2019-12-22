# Introduction
Now you have had some practice using while statements to do repetition in Java, it's time to try the other forms of loop; the for and do-while statements. These are not necessary as such, but can make for shorter, more elegant code in some cases; the trick is to know which cases!

# Part a
Design and implement a program that uses for loops to print the following rectangular pattern with a user specified width, height and wall thickness. Check the values entered by the user and, (a) simply output an error message (& stop) if any of the values are invalid (i.e not positive), and (b) display the rectangle but print a warning message if it does not have a hole in the middle!

Enter width, height & thickness: 5  6  2

*****
*****
** **
** **
*****
*****

Enter width, height & thickness: 10   10   3

**********
**********
**********
***    ***
***    ***
***    ***
***    ***
**********
**********
**********

Enter width, height & thickness: 10   5   3

**********
**********
**********
**********
**********

Oops... no hole!	

Enter width, height & thickness: 15   6   0

Error: all values must be positive!

Once this is working, modify your program so that, after outputting the pattern, it will ask the user if they wish to create another pattern and, if the user responds 'Y' or 'y', does so --any other response causing the program to print the message "goodbye" and stop. Hint: your program will always try to create at least one rectangular pattern.

# Part b
Design and implement a Java program that will ask the user for the required number of rows and columns, and then generate a neatly laid out table, with each cell indicating the "row,col" values, as in the following example (a table having 3 rows and 4 columns):

   1,1   1,2   1,3   1,4
   2,1   2,2   2,3   2,4
   3,1   3,2   3,3   3,4

Note that the cell contents are aligned to the right of a 6 character wide cell. Rather than rely on tabs for such spacing, write a loop that will add space characters to the output data so as to align it within a given column width.

Copy-paste the relevant segment of your code four times, such that your program produces four tables (precede each by an appropriate title), and then modify the copies so they each display one of the following:

1. the row & column numbers as shown in the example
2. the product of the row & column number (a multiplication table!)
3. the cell number beginning from 0 and increasing left to right, top to bottom
4. the row number in the first column only (putting the String "-" into the other cells.)

# Part c
Design and implement a Simple Calculator program. The program should present a menu to the user, allowing them to select any of the basic arithmetic operations "+", "-", "*", "/", as well as "Clear" and "Quit". Like most simple hand-held calculators, it should display the current (accumulator) result. The user will enter their selected operation and, if appropriate, a value. The program should apply the specified operation and value to the result, and re-display it and the menu, only stopping when the user selects "Quit". An example interaction is shown below (user entries are shown in red, the "result" display in green):

Welcome to "SimpleCalc"...

------------------
[ 0.0 ]
------------------
  +,-,*,/ value
  Clear
  Quit
------------------
Select: + 25.0

------------------
[ 25.0 ]
------------------
  +,-,*,/ value
  Clear
  Quit
------------------
Select: / 4

------------------
[ 6.25 ]
------------------
  +,-,*,/ value
  Clear
  Quit
------------------
Select: Clear

------------------
[ 0.0 ]
------------------
  +,-,*,/ value
  Clear
  Quit
------------------
Select: q

Thanks for using "SimpleCalc", goodbye.

Note: you should read the operation as a word (String), allowing it to accept single character commands as well as the full ones (i.e. "Clear", "clear", "C" and "c" should all work nicely). The user will have to enter a space between the arithmetic operator and the value, however.

Time permitting, add another menu option allowing users to compute the (trigonometric) sin function of the displayed result. Try doing this in three different ways:

* using the Math.sin method
* using the Taylor series expansion formula to compute it to a specified number of terms
* using the Taylor series expansion formula to compute it to a specified accuracy, e.g. < 0.0001
