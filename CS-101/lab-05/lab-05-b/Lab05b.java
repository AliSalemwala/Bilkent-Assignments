import java.util.Scanner;

/** Lab05b task
  * make tables with various properties using loops
  * Author - Ali Altaf Salemwala
  * 3rd November, 2015
  */

public class Lab05b
{
  public static void main (String[] args)
  {
    Scanner in = new Scanner(System.in);
    
    int rows;
    int columns;
    
    System.out.print("How many rows in your table? ");
    rows = in.nextInt();
    
    System.out.print("How many columns in your table? ");
    columns = in.nextInt();
    
    int rowCount;
    int columnCount;
    int spaceCount;
    
    // Regular Table
    
    System.out.println("Regular Table");
    // Controls row location
    for (rowCount = 1 ; rowCount <= rows ; rowCount++)
    {
      // Controls column location
      for (columnCount = 1 ; columnCount <= columns ; columnCount++)
      {
        // Controls space location
        for ( spaceCount = 0 ; spaceCount < 3 ; spaceCount++)
        {
          System.out.print(" ");
        }
        System.out.print(rowCount);
        System.out.print(",");
        System.out.print(columnCount);
      }
      System.out.println();
    }
        
    // Multiplication Table
    
    
    int product;
    
    System.out.println("Multiplication Table");
    for (rowCount = 1 ; rowCount <= rows ; rowCount++)
    {
      for (columnCount = 1 ; columnCount <= columns ; columnCount++)
      {
        for ( spaceCount = 0 ; spaceCount < 3 ; spaceCount++)
        {
          System.out.print(" ");
        }
        product = rowCount * columnCount;
        System.out.print(product);
      }
      System.out.println();
    }
    
    
    // Cell Table
    
    
    int cellCount;
    cellCount = 0;
    
    System.out.println("Cell Table");
    for (rowCount = 1 ; rowCount <= rows ; rowCount++)
    {
      for (columnCount = 1 ; columnCount <= columns ; columnCount++)
      {
        for (spaceCount = 0 ; spaceCount < 3 ; spaceCount++)
        {
          System.out.print(" ");
        }
        System.out.print(cellCount);
        cellCount++;
      }
      System.out.println();
    }
    
    
    // Only first column has row number inserted
    
    String rowReplace;
    rowReplace = "-";
    
    System.out.println("Only first column has row number inserted.");
    for (rowCount = 1 ; rowCount <= rows ; rowCount++)
    {
      for (columnCount = 1 ; columnCount <= columns ; columnCount++)
      {
        for ( spaceCount = 0 ; spaceCount < 3 ; spaceCount++)
        {
          System.out.print(" ");
        }
        System.out.print(rowCount);
        System.out.print(",");
        if (columnCount == 1)
        {
          System.out.print(columnCount);
        } else
        {
          System.out.print(rowReplace);
        }
      }
      System.out.println();
    }
    in.close();
  }
}