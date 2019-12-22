import java.util.Scanner;
import java.lang.Math;

/** Lab05c task
  * Simple Calculator
  * Author - Ali Altaf Salemwala
  * 3rd November, 2015
  */

public class Lab05c
{
  public static void main(String[] args)
  {
    Scanner in = new Scanner(System.in);
    System.out.println("Welcome to \"SimpleCalc\"...\n");
    
    String lines;
    lines = "------------------";
    
    double accumulator;
    accumulator = 0.0;
    
    int contCalc;
    
    double inputNum;
    String input;
    String[] letAndNum;
    String num;
    char operator;
    
    int terms;
    int decimals;
    String accuracy;
    String[] befAndAftDec;
    String aftDec;
    double sinValue;
    double tenPowDecimals;
    int factorialValue;
    int factorialStart;
    
    do
    {
      contCalc = 0;
      System.out.println(lines);
      System.out.println("[ " + accumulator + "]");
      System.out.println(lines);
      System.out.println("+,-,*,/, sin value");
      System.out.println("Clear");
      System.out.println("Quit");
      System.out.println(lines);
      System.out.print("Select: ");
      input = in.nextLine();
      operator = input.charAt(0);

      // Continues if user doesn't want to quit
      if (!input.equals("Q") && !input.equals("q") && !input.equals("Quit") && !input.equals("quit"))
      {
        // Continues if user doesn't want to clear
        if (input.equals("C") || input.equals("c") || input.equals("Clear") || input.equals("clear"))
        {
          accumulator = 0;
        }
        //Continues with simple operators
        else if (operator == '+' || operator == '-' || operator == '*' || operator == '/')
        {
          letAndNum = input.split(" ");
          num = letAndNum[1]; 
          inputNum = Double.parseDouble(num);
          
          if (operator == '+')
          {
            accumulator = accumulator + inputNum;
          } else if (operator == '-')
          {
            accumulator = accumulator - inputNum;
          } else if (operator == '*')
          {
            accumulator = accumulator * inputNum;
          } else if (operator == '/')
          {
            accumulator = accumulator / inputNum;
          }
        }
        // Continues with sin of accumulator
        else if (input.contains("sin"))
        {
          // Using Math.sin method
          //accumulator = Math.sin(accumulator);
          
          
          // Using Taylor Series Expansion
          /*
          // Specified number of terms
          System.out.println("How many terms in Taylor Series Expansion Formula?");
          terms = in.nextInt();
          in.nextLine();
          sinValue = 0.0;
          
          // Taylor Expansion formula = ((-1) ^ n) * (2 * n + 1)! * (x ^ (2 * n + 1))
          for ( int n = 0 ; n < terms ; n++)
          {
            factorialStart = (2 * n) + 1;
            factorialValue = factorialStart;
            for ( int j = 1 ; factorialStart - j > 0 ; j++)
            {
              factorialValue = factorialValue * (factorialStart - j);
            }
            sinValue = sinValue + (Math.pow((-1), n) * Math.pow(accumulator, (2 * n + 1)) / factorialValue );
          }
          accumulator = sinValue;
          */
          
          // Using accuracy level
          /**System.out.print("Please input your desired accuracy level: ");
          accuracy = in.nextLine();
          befAndAftDec = accuracy.split(".");
          System.out.println(befAndAftDec.length);
          aftDec = befAndAftDec[befAndAftDec.length - 1];
          decimals = aftDec.length();
          */
          
          System.out.println("Please enter the number of decimal places.");
          decimals = in.nextInt();
          in.nextLine();
          tenPowDecimals = Math.pow(10, decimals);
          sinValue = 0.0;
          
          // Taylor Expansion formula = ((-1) ^ n) * (2 * n + 1)! * (x ^ (2 * n + 1))
          for ( int n = 0 ; n < 4 ; n++)
          {
            factorialStart = (2 * n) + 1;
            factorialValue = factorialStart;
            for ( int j = 1 ; factorialStart - j > 0 ; j++)
            {
              factorialValue = factorialValue * (factorialStart - j);
            }
            sinValue = sinValue + (Math.pow((-1), n) * Math.pow(accumulator, (2 * n + 1)) / factorialValue );
          }
          accumulator = Math.round(sinValue * tenPowDecimals) / tenPowDecimals;
        } else
        {
          System.out.println("Please enter something valid.");
        }
        contCalc = 1;
      }
    } while (contCalc == 1);
    
    System.out.println("Thanks for using \"SimpleCalc\", goodbye.");

    in.close();
  }
}