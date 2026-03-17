// Maps are generally used to store key and values pairs. 

// (Fastest, Nor order) Hash Map has total of 8 methods/ functions: put(), get(), remove(), containsKey(), containsValue(), size(), isEmpty(), clear(), 

//LinkedHash Map has all fucntions and methods same as hash Map. 

// Tree Map has a total of  13 fucntions/ methods: firstKey(), lastkey(), higherKey(), lowerKey(), ceilingKey(), floorKey(), firstEntry(), lastEntry(), pollFirstEntry(), pollLastEntry, subMap(), headMap(), tailMap().

// Hash Table has all methods and functions same as Hash map. 

import java.util.*;

public class Collections5 {
    public static void main(String args[]) {

        /*
         * HashMap<Integer, String> HM1 = new HashMap<>();
         * 
         * HM1.put(101, "Rohit");
         * HM1.put(102, "Aman");
         * HM1.put(103, "Dev");
         * HM1.put(104, "Pratik");
         * 
         * System.out.println("--------HashMap--------");
         * System.out.println(HM1);
         * 
         * System.out.println(HM1.get(103)); // returns the value assigned to the key
         * 
         * System.out.println(HM1.remove(104)); // returns and removes the value which
         * is assigned to the respective key
         * 
         * System.out.println(HM1.containsKey(101)); // returns true if the key is
         * present in the list, else false
         * 
         * System.out.println(HM1.containsValue("Dev")); // returns true if value is
         * present in the list, else false.
         * 
         * System.out.println("------------------------------------------");
         */

        TreeMap<Integer, String> TM1 = new TreeMap<>();

        TM1.put(101, "Ajaykumar");
        TM1.put(102, "Nirmala");
        TM1.put(103, "Aditya");
        TM1.put(104, "Harshvardhan");

        System.out.println(TM1);

        System.out.println("First Key: " + TM1.firstKey()); // returns the value of the first key.

        System.out.println("last Key: " + TM1.lastKey()); // returns the value of the second key.

        System.out.println("Higher Key: " + TM1.higherKey(102));// returns the value of the key which is greater than
                                                                // the specified key.

        System.out.println("Lower Key: " + TM1.lowerKey(103)); // returns the value of the key which is smaller than the
                                                               // specified key.

        System.out.println("Ceiling Key: " + TM1.ceilingKey(102)); // returns the value of the key which is higher than
                                                                   // or equals the specified key.

        System.out.println("Floor Key: " + TM1.floorKey(106)); // returns the value of the key which is smaller than or
                                                               // equals the specified key.

        System.out.println("First Entry: " + TM1.firstEntry()); // retruns the first value of the first key:value in the
                                                                // list

        System.out.println("Last Entry: " + TM1.lastEntry()); // retruns the last value of the first key:value in the
                                                              // list

        System.out.println("Poll First Entry: " + TM1.pollFirstEntry()); // retruns the first value of the first
                                                                         // key:value in the list, and also deletes it
                                                                         // from the list.

        System.out.println("Poll Last Entry: " + TM1.pollLastEntry()); // retruns the last value of the first key:value
                                                                       // in the list, and also deletes it from the
                                                                       // list.

    }

}
