import java.util.Scanner;

/**
 * lab02e Task
 * Creates template for html pages for company employees
 * Author - Ali Altaf Salemwala
 * 5th October, 2015
*/

public class Lab02e
{
  public static void main(String[] args)
  {
    /* Input of employee details */
    System.out.println("Enter name, age, salary, and comments:");
    Scanner in1 = new Scanner(System.in);
    
    String name     = in1.next();
    int age         = in1.nextInt();
    int salary      = in1.nextInt();
    String comments = in1.next();
    
    System.out.println("<html>\n");
    System.out.println("<head>");
    System.out.println("<title>" + name + "'s Home Page</title>");
    System.out.println("</head>\n");
    System.out.println("body\n");
    System.out.println("<hr>");
    System.out.println("<h1>" + name + "</h1>");
    System.out.println("<p>Age: " + age + "</p>");
    System.out.println("<p>Salary: " + salary + "</p>");
    System.out.println("<p>Comments: " + comments + "</p>");
    System.out.println("<br clear=\"all\">");
    System.out.println("<hr>\n");
    System.out.println("/body\n");
    System.out.println("</html>");

    in1.close();
  }
}