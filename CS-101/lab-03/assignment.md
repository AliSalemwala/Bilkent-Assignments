# Introduction

The previous lab focused on creating, compiling, running & debugging a Java program, and using a sequence of input, output and assignment statements to solve simple problems. This week's lab should help you become familiar with decision statements, if statements, which enable your program to do either one thing or another, never both. Some of the exercises are extensions of the previous lab assignment, which should save you time (you  only need to add the new bits) and give you an opportunity to make sure they really were correct after all!

# Part a
The following exercise should help get you up to speed using simple Java if statements. Start by creating a new project and include the following for loop statement in its body. This loop automatically generates values of the variable **x** from -10 to +10. Add a statement that prints the value of the variable **x**, then compile and run the program to see this.

```java
    for ( int x = -10; x <= 10; x++ )
    {
        // your code goes here
    }
```

Once you have this working, insert an if statement into the body of the loop so that:

* whenever **x** is between 4 and 8 inclusive, print out the message "in range"  together with the value of **x**.

Having done that, comment it out and then do each of the following in a similar way:

* count the number of positive and the number of negative values that **x** takes.

* if **x** is less than -5 print the message "Too Low", if it is between -5 and +5 exclusive print the message "Acceptable", if it is exactly 5 print "Right on!", and if it is greater than 5 print the message "Too High" .

* sum only the values of **x** between 1 and **n** inclusive. Add statements before the loop to read in an integer value **n** (where **n** is less than or equal to 10). After the loop add a statement that compares the sum you computed with that from the formula **n** (**n**+1)/2 and print out a message saying whether they are the same or not! Test with various values of **n**.

# Part b
Last week, Lab02d asked you to calculate the number of flowers that could be planted in a triangular garden. You probably assumed that whatever values the user entered for the lengths of the sides of the garden, did actually form a triangle, but obviously this may not be the case! Make a copy of your solution from Lab02d into a new project, Lab03b, and add the code necessary to check whether the values entered do indeed form a triangle. Use the triangle inequality theorem: "any side of a triangle is always shorter than the sum of the other two sides". Print a warning message and stop if the values are invalid.

# Part c
The world moves on and you often find yourself modifying programs to keep up with the times; in computer jargon it's called maintenance! For Lab03c, make a copy of your webpage generating program from Lab2e and modify it to do the following:

* Consider the salary value entered by the user to be the gross salary. Compute the employee's net salary by subtracting a fixed amount of $100 and then take off 15% tax from what is left. On the webpage, display the net salary value (together with the tax rate between brackets) instead of the gross salary.

* Check that the user has entered a positive value for the age. Print an error message and stop if they haven't. Do the same for salary, but make sure it is also less than a maximum, say $10000 for example.

* Rather than have a constant 15% tax rate for all, the government decides to take only 5% from employees earning below $1000 gross, but to take 25% from those earning more than $5000. Implement this.

Last, but not least, the company decides it would like to include a picture of each employee in their webpage. The pictures are to be stored in a file with the employee's name and a .gif extension (e.g. einstein.gif or taz.gif) Add the necessary html code immediately after the first "<hr>" tag to display the employee's picture. For example, to display taz's picture include:

<img src="taz.gif" align="left">

Hint: place the images and the html file in the same folder. You can find your own images or use the following ones for practice: einstein.gif, taz.gif

Of course, some employees may not have pictures available, in which case the company asks that no image be shown at all. In other words, only include the html "img" tag in the webpage if the image file actually exists.

The method call Files.exists( Paths.get( filename ) ) returns true if the specified filename exists, and false otherwise.

Note: You don't need to understand the above method call, however, you will need to include the following magic right at the top of your program (immediately after the existing import java.util.Scanner; statement) in order for it to work:

```java
import java.nio.file.*;  
import java.io.*;
```
