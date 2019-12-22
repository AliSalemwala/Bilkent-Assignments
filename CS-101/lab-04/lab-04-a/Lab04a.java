import java.util.Scanner;

/**lab04a task
  * while statements
  * Author - Ali Altaf Salemwala
  * 20th October, 2015
  */

public class Lab04a
{
  public static void main (String[] args)
  {
      // Part 1 of a
    int i = -10;

    while (i < 11){
      System.out.print (i + " ");
      i++;
    }
    System.out.println();

    // Part 2 of a
    i = 5;

    while (i > -6){
      System.out.print (i + " ");
      i--;
    }
    System.out.println();

    // Part 3 of a
    Scanner in = new Scanner(System.in);
    int n = in.nextInt();
    i = 0;

    while (i < n){
      System.out.print(i + "\t");
      i++;
    }
    System.out.println();

    // Part 4 of a
    n = in.nextInt();

    if (i < 0 || i > 25){
        System.out.println("Invalid number!");
    }

    i = 0;
    int count = 0;

    while (i < n){
      System.out.print(i + "\t");
      i++;
      count++;
      if (count == 4){
          System.out.println();
          count = 0;
      }
    }
    System.out.println();

    // Part 5 of a
    n = in.nextInt();

    if (i < 0 || i > 25){
        System.out.println("Invalid number!");
    }

    i = 0;
    count = 0;

    while (i < n){
      System.out.print(i*2 + "\t");
      i++;
      count++;
      if (count == 4){
          System.out.println();
          count = 0;
      }
    }
    System.out.println();
    
    in.close();
  }
}