import java.util.Scanner;

/**lab 03a task
  * Prints output of for loop
  * Author - Ali Altaf Salemwala
  * 13th October, 2015
 */

public class Lab03a
{
  public static void main (String[] args)
  {
      // Accept an integer n between 1 and 10 inclusive
      Scanner in = new Scanner(System.in);
      
      System.out.println("Enter an integer between 1 and 10 inclusive");
      int n = in.nextInt();
      
      if (n > 1 ||  n < 10) {
      
        int sumOfx = 0;
        int negNum = 0;
        int posNum = 0;
      
        for ( int x = -10; x <= 10; x++ ) 
        {
          // your code goes here
      
          // prints if x is between 4 and 8 inclusive
          if ( x >= 4 && x <= 8)
          {
            System.out.println("in range: " + x);
          }
      
          // counts number of poitive and negative numbers
          if ( x < 0 )
          {
            negNum++;
          }
          if ( x > 0)
          {
            posNum++;
          }
      
          /** if x is less than -5 print "Too Low"
            * if it is between -5 and +5 exclusive print the message "Acceptable"
            * if it is exactly 5 print "Right on!"
            * if it is greater than 5 print the message "Too High"
            */
      
          if ( x < -5 )
          {
            System.out.println("TooLow");
          } else if ( x >= -5 && x < 5 ) {
            System.out.println("Acceptable");
          } else if ( x == 5) {
            System.out.println("Right on!");
          } else if ( x > 5) {
            System.out.println("Too High");
          }
          
          // add values of x between 1 and n
          
          if ( x >= 1 && x <= n ) {
            sumOfx = sumOfx + x;
          }
      
        }
        // prints number of positive and negative numbers
        System.out.println( "There are " + posNum +  " positive numbers and " + negNum + " negative numbers.");
        
        // copmarison of sumOfx and formula using n
        double formOfn = n * (n + 1) * 0.5;
        if ( sumOfx == formOfn ) {
          System.out.println("They are the same!");
        } else {
          System.out.println("They are not the same.");
        }
      
      } else {
        System.out.println("Please restart the program and enter an integer between 1 and 10 inclusive");
      }

      in.close();
     }
}