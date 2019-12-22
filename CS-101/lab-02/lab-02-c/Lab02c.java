import java.util.Scanner;

/**
 * lab02c Task
 * Performs mathematical functions on two numbers given by the user.
 * Author - Ali Altaf Salemwala
 * 5th October, 2015
 */

public class Lab02c
{
  public static void main(String[] args)
  {
    Scanner in1 = new Scanner(System.in);
    Scanner in2 = new Scanner(System.in);
    
    /* Numbers taken from user */
    
    int num_1st = in1.nextInt();
    int num_2nd = in2.nextInt();
    
    System.out.println(num_1st);
    System.out.println(num_2nd);
    
    /*Computes values*/
    System.out.println(num_1st + " + " + num_2nd + " is " + (num_1st + num_2nd));
    System.out.println(num_1st + " - " + num_2nd + " is " + (num_1st - num_2nd));
    System.out.println(num_1st + " * " + num_2nd + " is " + (num_1st * num_2nd));
    System.out.println(num_1st + " / " + num_2nd + " is " + (double)(num_1st / num_2nd));
    System.out.println(num_1st + " % " + num_2nd + " is " + (num_1st % num_2nd));
    System.out.println("The higher value is:" + Math.max(num_1st, num_2nd));
    System.out.println("The lower value is:" + Math.min(num_1st, num_2nd));

    in1.close();
    in2.close();
  }
}