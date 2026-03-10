//package FileHandling;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

class bufferWriter {
    public static void main(String args[]) throws IOException {

        FileWriter f1 = new FileWriter("test3.txt");
        BufferedWriter writer = new BufferedWriter(f1);

        writer.write("Hello");
        writer.close();
    }

}