package Constructors;
// When the name of the fucntion and class are same, we call it as constructor. It doesn't require a function call statement. Java complier implicitly calls the fucntion in the backend. 

//Polymorphism means that the same method or interface can perform different actions depending on the object that is using it. ()

// Inheritence is the ability to acquire to properties, behaviour, and functions of one class into another class. It ensures reusibility. (Parent child relationship)

/* 
class extract {
    private int x, y;

    void test1() {
        x = 5;
        y = 2;
        // System.out.println(x);
        // System.out.println(y);
    }
}

class Construct1 {
    public static void main(String args[]) {
        extract newObject1 = new extract();
        extract newObject2 = new extract();

        newObject1.test1();
        newObject2.test1();

    }

}
    */

/* 
class extract {
    extract() {
        System.out.println("Special function excuted: ");
    }

    void fun1() {
        System.out.println("Normal function excuted: ");
    }
}

class Construct1 extends extract {
    public static void main(String args[]) {
        extract newObject = new extract();

        newObject.fun1();

    }
}
    */

class A {
    A() {
        System.out.println("Special Function executed: ");
    }
}

class B extends A {
    B() {
        System.out.println("Normal fucntion executed: ");
    }
}

class Construct1 {
    public static void main(String args[]) {
        // B newObject = new B();

    }

}