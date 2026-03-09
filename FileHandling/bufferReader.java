package FileHandling;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class bufferReader {
    public static void main(String args[]) throws IOException {

        FileReader fr = new FileReader("test3.txt");
        BufferedReader reader = new BufferedReader(fr);

        int ch;
        while ((ch = reader.read()) != -1) {
            System.out.println((char) ch);
        }

        reader.close();

    }

}
