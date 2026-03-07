package Practice;
// In this program, class A contains two instance variables, x and y. The method setData(int x, int y) takes two parameters that have the same names as those instance variables. Inside the method, the statements x = x; and y = y; are executed. Because method parameters have higher priority than instance variables within the method scope, the parameters shadow the instance variables. As a result, both the left-hand side and right-hand side of each assignment refer to the method parameters, not the object’s instance variables. This means each parameter is simply assigned to itself, and the instance variables remain unchanged. Since instance variables of type int are automatically initialized to 0 by default in Java, their values stay 0. Later, when displayData() is called, it prints the instance variables, which were never updated. Therefore, the output is 0 and 0. In order to print the same values as the main function, we use the keyword this to initialize the value. 

class A {
    int x, y; // Instance member variable

    void setData(int x, int y) {
        // int p = 0, q = 0; // Local member variable

        this.x = x;
        this.y = y;
    }

    void displayData() {
        System.out.println(x);
        System.out.println(y);
    }
}

class ThisK {
    public static void main(String args[]) {

        A newObject = new A();
        newObject.setData(6, 1);
        newObject.displayData();

    }

}
