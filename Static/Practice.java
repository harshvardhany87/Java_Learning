package Static;
/* 
class test1 {
    int x, y;

    void fun1(int x, int y) {
        this.x = x;
        this.y = y;
    }

    void fun2() {
        System.out.println(x);
        System.out.println(y);
    }
}

class Practice {
    public static void main(String args[]) {
        test1 newObject = new test1();
        newObject.fun1(10, 20);
        newObject.fun2();
    }

}
    */

/* 
class ParentClass {
    int inner = 100;

    public void display() {
        System.out.println("Parents Number: " + inner);
    }
}

class childClass extends ParentClass {
    int inner = 200;

    public void display() {
        System.out.println("Childs Number: " + inner);
        System.out.println("Parents Number via supper: " + super.inner);
        System.out.println("Current object number via this: " + this.inner);
        super.display();
    }
}

class Practice {
    public static void main(String args[]) {
        childClass newObejct = new childClass();
        newObejct.display();

    }

}
    */

/* 
abstract class shape {
    protected String name;

    shape(String name) {
        this.name = name;
    }

    abstract double Area();

    void displayName() {
        System.out.println("Shape:" + name);
    }
}

class Circle extends shape {

    private double radius;

    Circle(String name, double radius) {
        super(name);
        this.radius = radius;
    }

    double Area() {
        return Math.PI * radius * radius;
    }
}

class Rectangle extends shape {

    private int length;
    private int breadth;

    Rectangle(String name, int length, int breadth) {
        super(name);
        this.length = length;
        this.breadth = breadth;
    }

    double Area() {
        return length * breadth;
    }
}

class Practice {
    public static void main(String[] args) {

        shape circle = new Circle("Circle", 5);
        shape rectangle = new Rectangle("Rectangle", 4, 6);

        circle.displayName();
        System.out.println("Area: " + circle.Area());

        rectangle.displayName();
        System.out.println("Area: " + rectangle.Area());
    }
}
    */

/* 
abstract class Employee {
    protected String name;
    protected int salary;

    Employee(String name, int salary) {
        this.name = name;
        this.salary = salary;
    }

    abstract double calculateBonus();

    void displayDetails() {
        System.out.println("Name: " + name);
        System.out.println("Salary: " + salary);
    }
}

class Manager extends Employee {

    Manager(String name, int salary) {
        super(name, salary);

    }

    double calculateBonus() {
        return 0.2 * salary;
    }

}

class Developer extends Employee {
    Developer(String name, int salary) {
        super(name, salary);
    }

    double calculateBonus() {
        return 0.1 * salary;
    }
}

class Practice {
    public static void main(String args[]) {
        Employee newObjectEmployee1 = new Manager("Amit: ", 100000);
        Employee newObjectEmployee2 = new Developer("Rahul: ", 500000);

        newObjectEmployee1.displayDetails();
        System.out.println("Bonus: " + newObjectEmployee1.calculateBonus());
        System.out.println();

        newObjectEmployee2.displayDetails();
        System.out.println("Bonus: " + newObjectEmployee2.calculateBonus());
        System.out.println();
    }

}
    */

/* 
abstract class Payment {
    protected double amount;

    public Payment(double amount) {
        this.amount = amount;
    }

    public final void processPayment() {
        validate();
        authorize();
        transfer();
        System.out.println("Payment successful\n");
    }

    protected abstract void validate();

    protected abstract void authorize();

    protected abstract void transfer();

    public void generateReceipt() {
        System.out.println("Receipt generated for amount: " + amount);
    }
}

class CreditCardPayment extends Payment {
    private String cardNumber;

    public CreditCardPayment(double amount, String cardNumber) {
        super(amount);
        this.cardNumber = cardNumber;
    }

    protected void validate() {
        System.out.println("Validating credit card number: " + cardNumber);
    }

    protected void authorize() {
        System.out.println("Authorizing credit card payment of " + amount);
    }

    protected void transfer() {
        System.out.println("Transferring amount using Credit Card");
    }
}

class UPIPayment extends Payment {
    private String upiId;

    public UPIPayment(double amount, String upiId) {
        super(amount);
        this.upiId = upiId;
    }

    protected void validate() {
        System.out.println("Validating UPI ID: " + upiId);
    }

    protected void authorize() {
        System.out.println("Authorizing UPI payment of " + amount);
    }

    protected void transfer() {
        System.out.println("Transferring amount using UPI");
    }
}

public class Practice {
    public static void main(String[] args) {

        Payment[] payments = {
                new CreditCardPayment(5000, "1234-5678-9012-3456"),
                new UPIPayment(2500, "user@upi")
        };

        for (Payment p : payments) {
            p.processPayment();
        }
    }
}
    */

/* 
abstract class Number {
    int x;
    int y;
}

class Add extends Number {
    void fun1(int a, int b) {
        int sum = x + y;
        System.out.println(sum);
    }

}

class Practice {
    public static void main(String args[]) {
        Add newObject = new Add();
        newObject.fun1(3, 4);

    }

}
    */

/* 
abstract class geometricShape {

    abstract void area();

    abstract void perimeter();
}

class rectangle extends geometricShape {
    private double side1;
    private double side2;

    public rectangle(double side1, double side2) {
        this.side1 = side1;
        this.side2 = side2;
    }

    void area() {
        double calculatedArea = side1 * side2;
        System.out.println("Area of rectangle: " + calculatedArea);
    }

    void perimeter() {
        double calculatePerimeter = 2 * (side1 + side2);
        System.out.println("Perimeter of rectangle is: " + calculatePerimeter);

    }
}

class Practice {
    public static void main(String args[]) {
        rectangle newObject = new rectangle(10, 5);
        newObject.area();
        newObject.perimeter();
    }

}
    */

/* 
interface RemoteControl {
    void turnON();

    void turnOff();
}

class TV implements RemoteControl {
    public void turnON() {
        System.out.println("Turn on the television: ");
    }

    public void turnOff() {
        System.out.println("Turn off the television: ");
    }
}

class Practice {
    public static void main(String args[]) {
        RemoteControl newObject = new TV();
        newObject.turnON();
        newObject.turnOff();
    }

}
    */

/* 
interface BankAccount {
    void deposit(double amount);

    void withdraw(double amount);

    double getBalance();
}

class SavingsAccount implements BankAccount {

    private double balance;

    SavingsAccount(double initialBalance) {
        balance = initialBalance;
    }

    public void deposit(double amount) {
        if (amount <= 0) {
            throw new IllegalArgumentException("Invalid deposit amount");
        }
        balance += amount;
        System.out.println("Deposited: " + amount);
    }

    public void withdraw(double amount) {
        if (amount > 0 && amount <= balance) {
            balance -= amount;
            System.out.println("Withdrawn: " + amount);
        } else {
            throw new IllegalArgumentException("Invalid withdrawal amount");
        }
    }

    public double getBalance() {
        return balance;
    }
}

class CurrentAccount implements BankAccount {

    private double balance;
    private double overdraftLimit = 5000;

    CurrentAccount(double initialBalance) {
        balance = initialBalance;
    }

    public void deposit(double amount) {
        if (amount <= 0) {
            throw new IllegalArgumentException("Invalid deposit amount");
        }
        balance += amount;
        System.out.println("Deposited: " + amount);
    }

    public void withdraw(double amount) {
        if (amount > 0 && amount <= balance + overdraftLimit) {
            balance -= amount;
            System.out.println("Withdrawn: " + amount);
        } else {
            throw new IllegalArgumentException("Overdraft limit exceeded");
        }
    }

    public double getBalance() {
        return balance;
    }
}

class Practice {
    public static void main(String[] args) {

        BankAccount savings = new SavingsAccount(10000);
        BankAccount current = new CurrentAccount(5000);

        System.out.println("---- Savings Account ----");
        savings.deposit(2000);
        savings.withdraw(5000);
        System.out.println("Balance: " + savings.getBalance());

        System.out.println("\n---- Current Account ----");
        current.deposit(3000);
        current.withdraw(10000);
        System.out.println("Balance: " + current.getBalance());
    }
}
    */

/* 
interface Calculator {
    int add(int a, int b);

    int subtract(int a, int b);
}

class BasicCalculator implements Calculator {
    public int add(int a, int b) {
        return a + b;
    }

    public int subtract(int a, int b) {
        return a - b;
    }
}

class Practice {
    public static void main(String args[]) {
        Calculator newObejct = new BasicCalculator();

        System.out.println(newObejct.add(4, 6));
        System.out.println(newObejct.subtract(5, 2));

    }

}
    */

/* 
interface Shape {
    double area();
}

class Circle implements Shape {
    private double radius;

    Circle(double radius) {
        this.radius = radius;
    }

    public double area() {
        return Math.PI * radius * radius;
    }

}

class Rectangle implements Shape {
    private double length;
    private double breadth;

    Rectangle(double length, double breadth) {
        this.length = length;
        this.breadth = breadth;
    }

    public double area() {
        return length * breadth;
    }

}

class Practice {
    public static void main(String args[]) {
        Shape newObject1 = new Circle(4);
        System.out.println("Area of circle is: " + newObject1.area());

        Shape newObject2 = new Rectangle(10, 10);
        System.out.println("Area of rectangle is: " + newObject2.area());

    }

}
    */

/* 
import java.util.Scanner;

class Practice {
    public static void main(String[] args) {
        Scanner s1 = new Scanner(System.in);

        System.out.println("Enter the size: ");
        int size = s1.nextInt();

        int numbers[] = new int[size];
        System.out.println("Enter " + size + " Numbers");

        for (int i = 0; i < size; i++) {
            numbers[i] = s1.nextInt();

        }
        System.out.println("Array elements are: ");
        for (int i = 0; i < size; i++) {
            System.out.println(numbers[i]);
        }

    }

}
    */

/* 
import java.util.Scanner;

class Practice {
    public static void main(String args[]) {
        Scanner s1 = new Scanner(System.in);

        System.out.println("Enter the array length: ");
        int size = s1.nextInt();

        System.out.println("Enter " + size + " Numbers");
        int array[] = new int[size];

        for (int i = 0; i < size; i++) {
            array[i] = s1.nextInt();
        }

        // Important part for formatting the last comma
        System.out.print("[");
        for (int i = 0; i < array.length; i++) {
            System.out.print(array[i]);

            if (i != array.length - 1) {
                System.out.print(",");
            }
        }
        System.out.print("]");
    }

}
    */

/* 
import java.util.Scanner;

public class Practice {
    public static void main(String args[]) {
        Scanner subject1 = new Scanner(System.in);
        Scanner subject2 = new Scanner(System.in);
        Scanner subject3 = new Scanner(System.in);
        Scanner Name = new Scanner(System.in);

        System.out.println("Enter the name of the student: ");
        String name = Name.next();

        System.out.println("Enter the marks for 1st Subject: ");
        int marks1 = subject1.nextInt();
        System.out.println("Enter the marks for 2nd Subject: ");
        int marks2 = subject1.nextInt();
        System.out.println("Enter the marks for 3rd Subject: ");
        int marks3 = subject1.nextInt();

        int Total = marks1 + marks2 + marks3;
        System.out.println("The total marks scored by the student " + name + " = " + Total);

        double Average = (marks1 + marks2 + marks3) / 3.0;
        System.out.println("The average  by the student " + name + " = " + Average);

        if (Average >= 90 && Average <= 100) {
            System.out.println("Grade scored by the student " + name + " = A");
        } else if (Average >= 80 && Average <= 89) {
            System.out.println("Grade scored by the student " + name + " = B");
        } else if (Average >= 70 && Average <= 79) {
            System.out.println("Grade scored by the student " + name + " = C");
        } else if (Average >= 60 && Average <= 69) {
            System.out.println("Grade scored by the student " + name + " = D");
        } else {
            System.out.println("Failed: ");
        }

    }

}
    */

/* 
import java.util.Scanner;

public class Practice {

    public static void main(String args[]) {
        Scanner newOjScanner1 = new Scanner(System.in);

        System.out.println("Enter a password: ");
        String checkPass = newOjScanner1.next();

        boolean hasDigit = true;

        // Check for digit
        for (int i = 0; i < checkPass.length(); i++) {
            if (Character.isDigit(checkPass.charAt(i))) {
                hasDigit = true;
                break;
            }
        }

        if (checkPass.length() >= 8 && hasDigit) {
            System.out.println("It is a valid password: ");

        } else {
            System.out.println("Invalid Password, Must be 8 digit and have atleast 1 digit: ");
        }

    }
}
    */

/* 
interface Flyable {
    void fly();
}

interface Swimmable {
    void swim();
}

class Ducks implements Flyable, Swimmable {
    public void fly() {
        System.out.println("I can Fly: ");
    }

    public void swim() {
        System.out.println("I can swim: ");
    }

}

public class Practice {
    public static void main(String args[]) {
        Ducks newObject = new Ducks();
        newObject.fly();
        newObject.swim();

        Flyable f = new Ducks();
        f.fly();

        Swimmable s = new Ducks();
        s.swim();

    }

}
    */

/* 
import java.util.Scanner;

public class Practice {

    public static void main(String args[]) {

        Scanner newObject = new Scanner(System.in);

        System.out.println("Enter the array size: ");
        int sizeArray = newObject.nextInt();

        System.out.println("Enter " + sizeArray + " Numbers: ");
        int numbers[] = new int[sizeArray];

        for (int i = 0; i < sizeArray; i++) {
            numbers[i] = newObject.nextInt();
        }

        System.out.print("[");

        for (int i = 0; i < numbers.length; i++) {
            System.out.print(numbers[i]);

            if (i != numbers.length - 1) {
                System.out.print(",");
            }
        }
        System.out.println("]");

        try {
            System.out.println("Enter the index to get values from the array: ");
            int numberFetch = newObject.nextInt();

            if (numberFetch < 0 || numberFetch > sizeArray) {
                throw new Exception("Index out of range: ");

            } else {
                System.out.println("the number at " + numberFetch + " position is " + numbers[numberFetch]);
            }

        } catch (Exception e) {
            System.out.println(e);
        }

    }
}
    */

import javax.swing.*;
import java.awt.Font;
import java.awt.event.*;

class Practice extends JFrame {

    JLabel label1, label2, label3, label4;
    JTextField text1, text2;
    JPasswordField passwordField;
    JButton button1, button2, button3;

    Practice(String name) {
        super(name);
    }

    Practice() {
        setComponents();
    }

    void setComponents() {

        Font f1 = new Font("Times New Roman", Font.BOLD, 24);

        setLayout(null);
        label1 = new JLabel("Welcome to CS");
        label1.setBounds(210, 60, 200, 30);
        label1.setFont(f1);
        add(label1);

        label2 = new JLabel("Username: ");
        label2.setBounds(120, 120, 90, 25);
        add(label2);

        label3 = new JLabel("Password: ");
        label3.setBounds(120, 170, 90, 25);
        add(label3);

        label4 = new JLabel();
        label4.setBounds(120, 300, 280, 25);
        add(label4);

        text1 = new JTextField();
        text1.setBounds(220, 120, 180, 25);
        add(text1);

        text2 = new JPasswordField();
        text2.setBounds(220, 170, 180, 25);
        add(text2);

        button1 = new JButton("Login");
        button1.setBounds(100, 250, 100, 30);
        add(button1);

        button2 = new JButton("Clear");
        button2.setBounds(200, 250, 100, 30);
        add(button2);

        button3 = new JButton("Autofill");
        button3.setBounds(300, 250, 100, 30);
        add(button3);

        button1.addActionListener(new Login());
        button2.addActionListener(new clear());
        button3.addActionListener(new AutoFill());

        label1.addMouseListener(new MouseL());
        label2.addMouseListener(new MouseL());
        label3.addMouseListener(new MouseL());
        label4.addMouseListener(new MouseL());
        text1.addMouseListener(new MouseL());
        text2.addMouseListener(new MouseL());
        button1.addMouseListener(new MouseL());
        button2.addMouseListener(new MouseL());
        button3.addMouseListener(new MouseL());
    }

    public static void main(String args[]) {

        Practice newFrame = new Practice("AWT Swing");
        newFrame.setVisible(true);
        newFrame.setSize(600, 500);
        newFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        newFrame.setComponents();
    }

    class Login implements ActionListener {
        public void actionPerformed(ActionEvent e1) {

            String name = text1.getText();
            String password = text2.getText();

            if (name.equals("Harsh") && password.equals("1234")) {
                JOptionPane.showMessageDialog(null, "Login Successful");
                // label4.setText("Login Successful: ");
            } else {
                JOptionPane.showMessageDialog(null, "Login Unsuccessful");
                // label4.setText("Login Unsuccessful: ");
            }

        }
    }

    class clear implements ActionListener {
        public void actionPerformed(ActionEvent e2) {
            text1.setText("");
            text2.setText("");
            label4.setText("");
        }
    }

    class AutoFill implements ActionListener {
        public void actionPerformed(ActionEvent e) {

            text1.setText(("Harsh"));
            text2.setText(("1234"));

        }
    }

    class MouseL implements MouseListener {
        public void mouseReleased(MouseEvent e1) {

        }

        public void mouseExited(MouseEvent e1) {

        }

        public void mousePressed(MouseEvent e1) {
        }

        public void mouseEntered(MouseEvent e1) {

        }

        public void mouseClicked(MouseEvent e1) {

        }

    }

}
