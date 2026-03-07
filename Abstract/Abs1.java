package Abstract;
// The output of this code will be 10, but before test2's constructor runs, Java automatically implicitly calls the constructor of its parent class (test1) using super() keyword. Even though test1 is abstract, its constructor still runs when a subclass object is created

abstract class test1 {
    private int x;

    abstract void fun1();

    test1() {
        x = 10;
        System.out.println(x);
    }

}

class test2 extends test1 {
    void fun1() {
    }

    test2() {

    }
}

class Abs1 {
    public static void main(String args[]) {
        // test2 newObject = new test2();
    }

}
