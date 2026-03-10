//package FileHandling;

import java.io.*;
import java.util.Scanner;

public class FH1 {
    public static void main(String args[]) throws IOException {

        Scanner input = new Scanner(System.in);

        // InputFileStream
        /*
         * File inputFile = new File("test1.txt");
         * 
         * int length = Math.toIntExact(inputFile.length());
         * System.out.println("The length of the file is: " + length);
         * 
         * FileInputStream f2 = new FileInputStream("test1.txt");
         * int k;
         * while ((k = f2.read()) != -1) {
         * System.out.print((char) k);
         * }
         */

        // OutputFileStream

        FileOutputStream outputFile = new FileOutputStream("test2.txt");
        String name = "My name is Harshvardhan: ";

        char ch[] = name.toCharArray();
        for (int i = 0; i < name.length(); i++) {
            outputFile.write(ch[i]);
        }

        System.out.println("Enter the index to get the letter: ");
        int index = input.nextInt();

        if (index >= 0 && index < ch.length) {
            System.out.println("the letter at " + index + " position is: " + ch[index]);
        } else {
            System.out.println("Invalid index:  ");

        }
        outputFile.close();
        input.close();
    }
}