import java.util.*;

public class Prac {
    public static void main(String args[]) {

        // Integer arr[] = { 1, 2, 3, 4, 5 };

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

        /*
         * Q7
         * Integer arr[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
         * 
         * ArrayList<Integer> A1 = new ArrayList<>(Arrays.asList(arr));
         * System.out.println("The created array is: " + A1);
         * 
         * Iterator<Integer> I1 = A1.iterator();
         * 
         * while (I1.hasNext()) {
         * int number = (int) I1.next();
         * if (number % 2 == 0) {
         * I1.remove();
         * }
         * }
         * 
         * System.out.println("Latest array is: " + A1);
         */

        /*
         * Q8
         * Integer arr[] = { 3, 1, 2, 5, 4, 2 };
         * 
         * ArrayList<Integer> A1 = new ArrayList<>(Arrays.asList(arr));
         * 
         * TreeSet<Integer> TS1 = new TreeSet<>();
         * 
         * TS1.addAll(A1);
         * System.out.println("The converted list is: " + TS1);
         */

        /*
         * Q9
         * Integer arr[] = { 1, 2, 3, 4, 5 };
         * ArrayList<Integer> A1 = new ArrayList<>(Arrays.asList(arr));
         * 
         * int left = 0;
         * int right = A1.size() - 1;
         * 
         * while (left < right) {
         * int temp = A1.get(left);
         * A1.set(left, A1.get(right));
         * A1.set(right, temp);
         * 
         * left++;
         * right--;
         * }
         * System.out.println("The reversed list is: " + A1);
         */

        /*
         * Q10
         * Integer arr[] = { 2, 1, 5, 3, 4 };
         * ArrayList<Object> array = new ArrayList<>(Arrays.asList(arr));
         * 
         * TreeSet<Object> map = new TreeSet<>();
         * map.addAll(array);
         * System.out.println("The list is: " + map);
         * 
         * int length = map.size();
         * System.out.println("The length is: " + length);
         * 
         * System.out.println("The second largest number is: " + map.lower(map.last()));
         */

    }

}
