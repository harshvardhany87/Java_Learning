package ExceptionHandling;
/* 
public class Exceptions {
    public static void main(String[] args) {
        System.out.println("Exception Handling...");
        System.out.println("Normal flow1...");
        System.out.println("Normal flow2...");
        System.out.println("Normal flow3...");

        try {
            String name = null;
            System.out.println("The length of the string is: " + name.length());

        } catch (Exception e) {
            System.out.println(e);

        }
        try {
            int n = 10 / 0;
            System.out.println("ANS is: " + n);

        } catch (Exception e) {
            System.out.println(e);

        }

        System.out.println("Normal flow100...");
    }

}
    */

/* 
import java.util.Scanner;

class Exceptions {
    public static void main(String args[]) {

        try {
            Scanner s1 = new Scanner(System.in);

            System.out.println("Enter your age: ");
            int ageVal = s1.nextInt();

            if (ageVal < 18) {
                throw new Exception("Invalid age, Must be above 18: ");
            } else {
                System.out.println("The age is valid: " + ageVal);
            }

        } catch (Exception e) {
            System.out.println(e);
        }

        try {

            int a1[] = { 10, 20, 30, 40 };
            Scanner newObjScanner = new Scanner(System.in);

            System.out.println("Enter index to get array values: ");
            int checking = newObjScanner.nextInt();

            System.out.println(a1[checking]);

        } catch (Exception e) {
            System.out.println(e);
        }

    }

}
    */

public class Exceptions {

}
