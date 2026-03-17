// Queue has a total of 9 methods/ functions: add() and offer(), peek(), poll(), remove(), size(), isEmpty(), contains(), iterator(), clear().  

import java.util.*;

public class Collections4 {
    public static void main(String args[]) {

        PriorityQueue<Object> PQ1 = new PriorityQueue<>();

        PQ1.offer("A");
        PQ1.offer("B");
        PQ1.offer("C");
        PQ1.offer("D");

        System.out.println(PQ1.peek()); // returns the top element from the queue without removinf the element from the
                                        // list
        System.out.println(PQ1);

        System.out.println(PQ1.poll());// returns the top element from the queue, and also removes that element from
                                       // the list created.
        System.out.println(PQ1);

        System.out.println(PQ1.remove()); // same as Poll function, but throws an exception if the list is empty
        System.out.println(PQ1);

        System.out.println(PQ1.size()); // checks the size of the of list which is created
        System.out.println(PQ1);

        System.out.println(PQ1.isEmpty());// returns true is the list is empty, else false.
        System.out.println(PQ1);

        System.out.println(PQ1.contains("C")); // checks if a specific element is present in the list or not
        System.out.println(PQ1);

        System.out.println(PQ1.iterator()); // tracerses the list (Order is not guaranteed)
        System.out.println(PQ1);

    }

}