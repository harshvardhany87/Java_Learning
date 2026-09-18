/* 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class Project_2026 {

    public static void main(String args[]) {

        Connection con;
        Statement stmt;
        PreparedStatement pmst;
        ResultSet rs;

        try {

            // Class.forName("org.postgresql.Driver");
            // System.out.println("PostgreSQL Driver Loaded!");

            String url = "jdbc:postgresql://localhost:5432/demoDB";
            String user_name = "postgres";
            String password = "0617";

            con = DriverManager.getConnection(url, user_name, password);

            System.out.println("Connection Successful! :)");

            stmt = con.createStatement();

            Scanner sc = new Scanner(System.in);
            System.out.println("Enter the Employee ID:");
            int result = sc.nextInt();

            rs = stmt.executeQuery("select * from staff where id = " + result);

            while (rs.next()) {
                System.out.println(rs.getString("name") + " " + rs.getInt("salary"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
    */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

class Project_2026 {
    public static void main(String args[]) {

        Statement stmt;
        ResultSet rs;
        PreparedStatement pmst;
        Connection con;

        try {

            String url = "jdbc:postgresql://localhost:5432/demoDB";
            String user_name = "postgres";
            String password = "0617";

            con = DriverManager.getConnection(url, user_name, password);
            System.out.println("Connection Successfull: ");

            stmt = con.createStatement();

            Scanner sc = new Scanner(System.in);
            System.out.println("Enter the user ID of the employee: ");
            int result = sc.nextInt();

            rs = stmt.executeQuery("select * from staff where id = " + result);

            while (rs.next()) {
                System.out.println(rs.getString("name") + " = " + rs.getInt("salary"));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
    }
}