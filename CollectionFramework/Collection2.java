//package CollectionFramework;

import java.util.Iterator;
//import java.util.Enumeration;
import java.util.Vector;

// Vector is a class in Java used to store a dynamic list of elements. When you add values to it, they are stored inside the vector object. To traverse these elements, the `elements()` method is used. This method returns an object of an internal inner class called **`Vector$Enumeration`**, which implements the `Enumeration` interface. The reference variable `e1` stores the reference to this Enumeration object. Using methods like `hasMoreElements()` and `nextElement()`, the program iterates through the vector and prints each element.

// Typically, you would use an `Enumeration` to traverse the elements of a `Vector`. However, in modern Java programming, it is more common to use an `Iterator` or enhanced for-loop for such purposes, as they provide better performance and more features compared to `Enumeration`.

// Enumeration Cursor: has two methods: `hasMoreElements()` and `nextElement()`. Only supports ArrayList and Vector classes.

// Iterator Cursor: has three methods: `hasNext()`, `next()`, and `remove()`.

// ListIterator Cursor: has six methods: `hasNext()`, `next()`, `remove()`, `hasPrevious()`, `previous()`, and `add()`.

public class Collection2 {
    public static void main(String args[]) {

        Vector<Integer> vector1 = new Vector<>();
        vector1.add(12);
        vector1.add(23);
        vector1.add(43);
        vector1.add(35);
        vector1.add(45);
        int number;
        

        /*
         * Iterator i1 = vector1.iterator();
         * while (i1.hasNext()) {
         * // System.out.println(i1.next());
         * 
         * number = (int) i1.next();
         * if (number == 35) {
         * i1.remove();
         * }
         * }
         * 
         * Iterator i2 = vector1.iterator();
         * while (i2.hasNext()) {
         * System.out.println(i2.next());
         * }
         * 
         * System.out.println(i2.next());
         */

        /*
         * Enumeration e1 = vector1.elements();
         * while (e1.hasMoreElements()) {
         * System.out.println(e1.nextElement());
         * }
         */

    }

}
