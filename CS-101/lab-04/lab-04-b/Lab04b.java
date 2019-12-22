import java.util.Scanner;

/**lab04b task
  * if and while statements
  * Author - Ali Altaf Salemwala
  * 20th October, 2015
  */

public class Lab04b
{
  public static void main (String[] args)
  {
    /**Scanner in = new Scanner(System.in);
    System.out.println("Please enter 6 integers.");
    
    int sum;
    sum = 0;
    int count;
    count = 0;
    int limit;
    limit = 6;
    
    while (count < limit) {
      sum = sum + in.nextInt();
      count = count + 1;
    }
    System.out.println("Sum is: " + sum + ".\nThere were " + count + " numbers");
    */
    
    /**Scanner in = new Scanner(System.in);
    System.out.println("Please enter 100 integers.");
    
    int sum;
    sum = 0;
    int count;
    count = 0;
    int limit;
    limit = 100;
    int valueA;
    int min;
    min = 0;
    int max;
    max = 0;
    
    while (count < limit) {
      valueA = in.nextInt();
      
      if (count == 0) {
          min = valueA;
          max = valueA;
      }
      sum = sum + valueA;
      count = count + 1;
      
      if (min > valueA) {
          min = valueA;
      }
      if (max < valueA) {
          max = valueA;
      }
    }
    double average;
    average = sum / limit;
    System.out.println("Sum is: " + sum + ".");
    System.out.println("There were " + count + " numbers.");
    System.out.println("The average is " + average + ".");
    System.out.println("The minimum value is " + min + ".");
    System.out.println("The maximumm value is " + max + ".");
    */
      
    Scanner in = new Scanner(System.in);
    System.out.println("Please enter integers.");
    
    int sum;
    sum = 0;
    int count;
    count = 0;
    int valueA;
    valueA = in.nextInt();
    int min;
    min = 0;
    int max;
    max = 0;
    
    while (valueA >= 0) {
      
      if (count == 0) {
          min = valueA;
          max = valueA;
      }
      sum = sum + valueA;
      count = count + 1;
      
      if (min > valueA) {
          min = valueA;
      }
      if (max < valueA) {
          max = valueA;
      }
      valueA = in.nextInt();
    }
    double average;
    average = sum / count;
    System.out.println("Sum is: " + sum + ".");
    System.out.println("There were " + count + " numbers.");
    System.out.println("The average is " + average + ".");
    System.out.println("The minimum value is " + min + ".");
    System.out.println("The maximumm value is " + max + ".");

    in.close();
  }
}