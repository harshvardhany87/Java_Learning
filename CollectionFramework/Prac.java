import java.util.*;

public class Prac {
    public static void main(String args[]) {

        /*
         * Q1
         * public class Prac {
         * public static void main(String args[]) {
         * Integer arr[] = { 1, 2, 3, 4, 5, 6, 7 };
         * 
         * HashSet<Integer> H1 = new HashSet<>();
         * Collections.addAll(H1, arr);
         * System.out.println(H1);
         * }
         * }
         */

        /*
         * Q2
         * public class Prac {
         * public static void main(String args[]) {
         * Integer arr[] = { 20, 20, 40, 56, 56, 60, 89, 90 };
         * 
         * HashSet<Integer> H1 = new HashSet<>();
         * for (int num : arr) {
         * H1.add(num);
         * }
         * System.out.println("Array without duplicates is: " + H1);
         * 
         * }
         * }
         */

        /*
         * Q3
         * HashSet<Integer> arr1 = new HashSet<>();
         * arr1.add(10);
         * arr1.add(60);
         * arr1.add(30);
         * arr1.add(50);
         * 
         * HashSet<Integer> arr2 = new HashSet<>();
         * arr2.add(10);
         * arr2.add(20);
         * arr2.add(30);
         * arr2.add(40);
         * 
         * arr1.retainAll(arr2);
         * System.out.println("Common elements are: " + arr1);
         */

        /*
         * Q4
         * TreeSet<Integer> TS1 = new TreeSet<>();
         * TS1.add(20);
         * TS1.add(40);
         * TS1.add(10);
         * TS1.add(30);
         * TS1.add(50);
         * 
         * System.out.println("Sorted set is: " + TS1);
         */

        /*
         * Q5
         * String sentence = "Java is easy and Java is powerfull";
         * 
         * String[] words = sentence.split(" ");
         * 
         * HashSet<String> HS1 = new HashSet<>();
         * for (String word : words) {
         * HS1.add(word);
         * }
         * 
         * System.out.println("Unique words: " + HS1);
         * System.out.println("COunt of unique words: " + HS1.size());
         */

        /*
         * Q6
         * ArrayList<Integer> list = new ArrayList<>();
         * list.add(10);
         * list.add(20);
         * list.add(20);
         * list.add(30);
         * list.add(40);
         * list.add(40);
         * System.out.println("The generated lsit is: " + list);
         * 
         * HashSet<Integer> duplicates = new HashSet<>();
         * HashSet<Integer> set = new HashSet<>();
         * 
         * for (int numbers : list) {
         * if (!set.add(numbers)) {
         * duplicates.add(numbers);
         * }
         * }
         * 
         * System.out.println("Duplicate elements: " + duplicates);
         */

        HashSet<Integer> set1 = new HashSet<>();
        set1.add(11);
        set1.add(21);
        set1.add(31);
        set1.add(41);

        HashSet<Integer> set2 = new HashSet<>();
        set2.add(11);
        set2.add(34);
        set2.add(35);
        set2.add(41);

        set1.removeAll(set2);
        System.out.println("Difference: " + set1);
    }

}
