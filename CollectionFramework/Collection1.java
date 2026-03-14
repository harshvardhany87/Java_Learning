import java.util.*;

public class Collection1 {
    public static void main(String args[]) {

        Vector<String> vector1 = new Vector<>();
        vector1.add("10");
        vector1.add("22");
        vector1.add("41");

        ArrayList<String> list1 = new ArrayList<>(5);
        list1.add("Sam");
        list1.add("John");
        list1.add("Josh");
        list1.add("Noah");

        list1.addAll(vector1);

        System.out.println("The list is: " + list1);

    }

}
