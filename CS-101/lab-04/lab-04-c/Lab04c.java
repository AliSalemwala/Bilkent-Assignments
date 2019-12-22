import java.util.Scanner;

/**lab04c task
  * Prints triangle using user inputted chars
  * Author - Ali Altaf Salemwala
  * 20th October, 2015
  */

public class Lab04c
{
  public static void main (String[] args)
  {
    //Accepts character to make triangle and width of triangle base
    Scanner in = new Scanner(System.in);
    
    System.out.println("Enter a character to make a triangle with:");
    char ch;
    ch = in.next().charAt(0);
    
    System.out.println("Enter the number of characters used in the base of the triangle:");
    int width;
    width = in.nextInt();
    
    int lineCount;
    lineCount = 0;
    int charCount;
    charCount = 1;
    int charDone;
    charDone = 0;
    
    while (lineCount < width) {
      while (charDone < charCount) {
        System.out.print(ch);
        charDone = charDone + 1;
      }
      System.out.println();
      charDone = 0;
      charCount = charCount + 1;
      lineCount = lineCount + 1;
    }
    
    double d;
    d = 0.1;
    while ( d < 1.0 ) {
        System.out.println( d);
        d = d + 0.1;
    }
    System.out.println( d + " <- final value after loop!");

    in.close();
  }
}