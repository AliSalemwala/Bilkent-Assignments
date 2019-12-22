import java.util.Scanner;

/**
 * lab02d Task
 * Calculates maximum number of flowers that can be kept in a triangular garden.
 * Author - Ali Altaf Salemwala
 * 5th October, 2015
*/

public class Lab02d
{
  public static void main(String[] args)
  {
    /* Input of length of sides from user */
    
    System.out.println("Enter length of sides a, b, and c:");
    Scanner in1 = new Scanner(System.in);

    int sideA = in1.nextInt();
    int sideB = in1.nextInt();
    int sideC = in1.nextInt();
    
    /*
     * s is the s in Heron's Formula i.e. 
     * [(s)*(s-a)*(s-b)*(s-c)] ^ 0.5
    */
    
    double s = ((sideA + sideB + sideC) / 2);
    double area = Math.sqrt( s * (s - sideA) * (s - sideB) * (s - sideC));
    System.out.println("Area is " + area + " metres squared");
    
    int numFlowers = 17 * (int) area;
    System.out.println();
    System.out.println(numFlowers + " flowers can be planted.");

    in1.close();
    }
}
    

    
    