# Introduction
You should now be familiar with writing Java programs using sequences and alternations, of input, output, assignments. All that remains is automated repetition, the subject of this week's lab. 

Java has three forms of repetition (loop) statement: while, for and do-while. The while statement is the most general form in all languages, so we will concentrate on that to begin with and move on the other more specialised forms of loop in later lab assignments.

# Part a
Create a new project, Lab04a, and inside the main method, do the following tasks:

1. Write a while loop that outputs (on a single line separated by spaces) the values from -10 up to +10 inclusive.
2. Write a while loop that outputs (on a single line separated by spaces) the values from +5 down to -5 inclusive.
3. Write a code segment that gets an integer value n from the user and prints (on a single line separated by a tab character) each of the values from 0 up to, but not including, n.
4. Modify your solution to the previous task, adding code so that it,
    * prints an error message if the value given by the user is invalid, i.e. is less than zero or greater than a fixed maximum, say 25
    * starts a new output line after 5 values have been printed on the same line (the result should be columns of numbers).
5. Modify it further so that, instead of printing the values from 0 to n, it prints some function of those values, e.g. the value plus 1, or the value minus 5, or n minus the value, or twice the value, or the square of the value.

# Part b
Write a program, Lab04b, that will read exactly n integer values from the user, adding each value to a sum and simultaneously counting them; then, after the last one has been processed, report their sum and count. The value of n should be fixed, e.g. 6, and any values that are entered after the n'th one should be ignored. *Note: you do not need to store the values read from the user; simply process each one as it is read!*

In the same folder as your .class files, create a text file, "testdata.txt", containing some test data, e.g. the values [2, 9, 4, 27, 15, 4, 12], one value per line.

Open a command prompt and navigate to the folder containing your class file. From the command prompt, run your program by typing the command "java Lab04b  <  testdata.txt", which should cause your program to read its input from the specified file, rather than the keyboard. It will still output its results to the command prompt. *Note: you can have your program read data from one file and send the output to another file --as you did in the previous lab assignments-- by typing "java Lab04b < testdata.txt > results.txt" Try it, then open "results.txt" to see what happened!*

From the text file, modify your program so that it finds the average, minimum and maximum, of the first 100 values.

Next, place all of that code in a multi-line comment, then write another piece of code that uses a while loop to find the average, minimum and maximum, of all the values up to but not including the first negative value. You may assume such a value always exists.

# Part c
Create another project and try the following tasks:

1. Prompt the user to enter a character, ch, and an int value, width, and then print out a triangle formed using ch characters having a base of width characters. For example, if the user enters "*" and 5, it should print,

    *
    **
    ***
    ****
    ******

2. Can you predict what the following code will print out?

```java
    double d;
    d = 0.1;
    while ( d < 1.0 )
    {
       System.out.println( d);
       d = d + 0.1;
    }
    System.out.println( d + " <- final value after loop!");
```

Copy-paste it into your IDE and run it to check your prediction.

Modify the condition such that it says "while ( d != 1.0 )". What will happen if you run it now?
Before trying it, make sure you read the Caution at the beginning of the assignment!

Can you explain why this happens? What is the moral of the story?
