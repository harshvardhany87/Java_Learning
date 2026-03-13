//package CollectionFramework;

// Hash set has total of 8 methods/ functions: add(), remove(), contains(), size(), isEmpty(), clear(), iterator(), clone(). 

// LinkedHash  set has total of 8 methods/ functions: add(), remove(), contains(), size(), isEmpty(), clear(), iterator(), clone(). 

// Sorted Set has total of 6 methods/ fucntions: first(), last(), headSet(), tailSet(), subSet(), comparator().

// Navigable Set has total of 7 mathods: ceiling(), floor(), higher(), lower(), pollFirst(), pollLast(), descendingSet().

import java.util.*;

public class Collection3 {
    public static void main(String args[]) {

        // Hash Set
        HashSet<Integer> H1 = new HashSet<>();
        H1.add(30);
        H1.add(100);
        H1.add(40);
        H1.add(20);
        System.out.println("Hash set: " + H1);

        // LinkedHash Set
        LinkedHashSet<Integer> LH1 = new LinkedHashSet<>();
        LH1.add(30);
        LH1.add(10);
        LH1.add(40);
        LH1.add(20);
        System.out.println("LinkedHash set: " + LH1);

        // Sorted Set
        TreeSet<Integer> T1 = new TreeSet<>();
        T1.add(30);
        T1.add(40);
        T1.add(20);
        T1.add(70);
        System.out.println("Sorted Set: " + T1);
        System.out.println(T1.first()); // returns the first value after sorted
        System.out.println(T1.last()); // returns the last value after sorted
        System.out.println(T1.headSet(40)); // returns the value from starting point to n-1
        System.out.println(T1.tailSet(20)); // returns the value from the element stated
        System.out.println(T1.subSet(20, 40)); // returns the value from stated to n-1

        System.out.println(T1.ceiling(32)); // returns the value of greater than or equal to, to the stated element
        System.out.println(T1.floor(31));// returns the value of smaller than or equal to, to the stated element
        System.out.println(T1.higher(30));// returns the value of greater than the stated element
        System.out.println(T1.lower(30));// returns the value of smaller than the stated element
        System.out.println(T1.pollFirst());// return the value after removing the very first element from the list
        System.out.println("Sorted Set: " + T1);
        System.out.println(T1.pollLast());// return the value after removing the very last element from the list
        System.out.println("Sorted Set: " + T1);

    }
}
