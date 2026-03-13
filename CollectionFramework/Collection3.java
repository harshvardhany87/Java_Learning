package CollectionFramework;

// Hash set has total of 8 methods/ functions: add(), remove(), contains(), size(), isEmpty(), clear(), iterator(), clone(). 

// LinkedHash  set has total of 8 methods/ functions: add(), remove(), contains(), size(), isEmpty(), clear(), iterator(), clone(). 

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

    }
}
