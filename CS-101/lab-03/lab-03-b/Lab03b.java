import java.util.Scanner;

/**
 * lab03b Task
 * Calculates maximum number of flowers that can be kept in a triangular garden.
 * Author - Ali Altaf Salemwala
 * 13th October, 2015
*/

public class Lab03b
{
  public static void main(String[] args)
  {
    /* Input of length of sides from user */
    
    System.out.println("Enter length of sides a, b, and c:");
    Scanner in = new Scanner(System.in);
    
    int sideA = in.nextInt();
    int sideB = in.nextInt();
    int sideC = in.nextInt();
    
    /**triangle inequality theorem:
      * "any side of a triangle is always shorter than the sum of the other two sides"
    */

    if ( sideA >= (sideB + sideC) || sideB >= (sideA + sideC) || sideC >= (sideA + sideB) ) {
      System.out.println("Please restart and enter the values of an actual triangle!");
    } else {

      /*
      * s is the s in Heron's Formula i.e. 
      * [(s)*(s-a)*(s-b)*(s-c)] ^ 0.5
      */
      
      double s = ((sideA + sideB + sideC) / 2);
      double area = Math.sqrt( s * (s - sideA) * (s - sideB) * (s - sideC));
      System.out.println("Area is " + area + " metres squared");
      
      int numFlowers = 17 * (int)area;
      System.out.println();
      System.out.println(numFlowers + " flowers can be planted.");
    }

    in.close();
  }
}