// Maps are generally used to store key and values pairs. 

// (Fastest, Nor order) Hash Map has total of 8 methods/ functions has: put(), get(), remove(), containsKey(), containsValue(), size(), isEmpty(), clear(), 

//LinkedHash Map has all fucntions and methods same as hash Map. 

// Tree Map has a total of  13 fucntions/ methods: firstKey(), lastkey(), higherKey(), lowerkey(), ceilingKey(), floorkey(), firstEntry(), lastEntry(), pollFirstEntry(), pollLastEntry, subMap(), headMap(), tailMap().

// Hash Table has all methods and functions same as Hash map. 

import java.util.*;

public class Collections5 {
    public static void main(String args[]) {

        HashMap<Integer, String> HM1 = new HashMap<>();

        HM1.put(101, "Rohit");
        HM1.put(102, "Aman");
        HM1.put(103, "Dev");
        HM1.put(104, "Pratik");

        System.out.println(HM1);

        System.out.println(HM1.get(103));

        System.out.println(HM1.remove(104));

        System.out.println(HM1.containsKey(101));

    }

}
