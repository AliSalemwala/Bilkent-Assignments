import java.util.Scanner;
import java.nio.file.*;   
import java.io.*;

/**
 * lab03c Task
 * Creates template for html pages for company employees
 * Author - Ali Altaf Salemwala
 * 13th October, 2015
*/

public class Lab03c
{
  public static void main(String[] args)
  {
    /* Input of employee details */
    System.out.println("Enter name, age, salary, comments, and image filename:");
    Scanner in = new Scanner(System.in);
    
    String name     = in.next();
    int age         = in.nextInt();
    int grossSalary = in.nextInt();
    String comments = in.next();
    String filename = in.next();
    
    // checks age
    if ( age > 0) {
      
      // checks grossSalary
      if (grossSalary > 0 && grossSalary < 10000) {
    
        double netSalary = 0;
        double taxRateLow = 0.05;
        double taxRateMid = 0.15;
        double taxRateHigh = 0.25;
        if (grossSalary < 1000) {
          netSalary = (grossSalary - 100) * (1 - taxRateLow);
        } else if (grossSalary >= 1000 || grossSalary < 5000) {
          netSalary = (grossSalary - 100) * (1 - taxRateMid);
        } else if (grossSalary >= 5000) {
          netSalary = (grossSalary - 100) * (1 - taxRateHigh);
        }
        
        if (Files.exists( Paths.get( filename ) )) {
        
          System.out.println("<html>\n");
          System.out.println("<head>");
          System.out.println("<title>" + name + "'s Home Page</title>");
          System.out.println("</head>\n");
          System.out.println("body\n");
          System.out.println("<hr><img src=" + filename + "\" align=\"left\">");
          System.out.println("<h1>" + name + "</h1>");
          System.out.println("<p>Age: " + age + "</p>");
          System.out.println("<p>Salary: " + netSalary + "</p>");
          System.out.println("<p>Comments: " + comments + "</p>");
          System.out.println("<br clear=\"all\">");
          System.out.println("<hr>\n");
          System.out.println("/body\n");
          System.out.println("</html>");
        } 

       //img file non-existant
        else {
          System.out.println("<html>\n");
          System.out.println("<head>");
          System.out.println("<title>" + name + "'s Home Page</title>");
          System.out.println("</head>\n");
          System.out.println("body\n");
          System.out.println("<hr>");
          System.out.println("<h1>" + name + "</h1>");
          System.out.println("<p>Age: " + age + "</p>");
          System.out.println("<p>Salary: " + netSalary + "</p>");
          System.out.println("<p>Comments: " + comments + "</p>");
          System.out.println("<br clear=\"all\">");
          System.out.println("<hr>\n");
          System.out.println("/body\n");
          System.out.println("</html>");
        }
      } // grossSalary warning
      else {
        System.out.println("Please enter a positive salary value that is less than $10000");
      }
   
    } // age warning
    else {
      System.out.println("Please enter a positive value for the age.");
    }

    in.close();
  }
}