//package FileHandling;

import java.io.*;

class Prac {
    public static void main(String args[]) throws IOException {

        File inputFile = new File("test2.txt");

        int totalLength = Math.toIntExact(inputFile.length());
        System.out.println("Total length is: " + totalLength);

        FileInputStream f1 = new FileInputStream("test2.txt");
        int k;

        while ((k = f1.read()) != -1) {
            System.out.print((char) k);

            FileOutputStream outputFile = new FileOutputStream("test1.txt", true);
            String name = ", After that 2032 will be the leap year; ";

            char ch[] = name.toCharArray();
            for (int i = 0; i < name.length(); i++) {
                outputFile.write(ch[i]);
            }

        }

    }
}
