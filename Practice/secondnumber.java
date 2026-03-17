// package Practice;
public class secondnumber {
    public static void main(String[] args) {
        int[] arr = { 10, 12, 3, 48, 51 };
        int result = secondLargestElement(arr);

        System.out.println("Second largest number is: " + result);
    }

    public static int secondLargestElement(int[] arr) {

        int largest = Integer.MIN_VALUE;
        int secondLargest = Integer.MIN_VALUE;

        for (int i = 0; i < arr.length; i++) {
            if (arr[i] > largest) {
                secondLargest = largest;
                largest = arr[i];
            } else if (arr[i] > secondLargest && arr[i] != largest) {
                secondLargest = arr[i];
            }
        }
        return secondLargest;
    }

}

// 10, 12, 3, 48, 51
// 51-> largest
// 48 -> secondLargest