package CollectionFramework;

import java.util.Enumeration;
import java.util.Vector;

// Vector is a class in Java used to store a dynamic list of elements. When you add values to it, they are stored inside the vector object. To traverse these elements, the `elements()` method is used. This method returns an object of an internal inner class called **`Vector$Enumeration`**, which implements the `Enumeration` interface. The reference variable `e1` stores the reference to this Enumeration object. Using methods like `hasMoreElements()` and `nextElement()`, the program iterates through the vector and prints each element.

public class Collection2 {
    public static void main(String args[]) {

        Vector<Integer> vector1 = new Vector<>();
        vector1.add(12);
        vector1.add(23);
        vector1.add(43);
        vector1.add(35);
        vector1.add(45);

        Enumeration e1 = vector1.elements();
        while (e1.hasMoreElements()) {
            System.out.println(e1.nextElement());
        }

    }

}
