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

/* 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

class Project_2026 {
    public static void main(String args[]) {

        try {

            Statement stmt;
            ResultSet rs;
            PreparedStatement psmt;
            Connection con;

            String url = "jdbc:postgresql://localhost:5432/demoDB";
            String user_name = "postgres";
            String password = "0617";

            con = DriverManager.getConnection(url, user_name, password);
            System.out.println("Connection Successful");

            Scanner sc = new Scanner(System.in);
            System.out.println("Enter the employee id = ");
            int result = sc.nextInt();

            stmt = con.createStatement();
            rs = stmt.executeQuery("select * from staff where ID = " + result);

            while (rs.next()) {
                System.out.println(rs.getString("name") + " " + rs.getInt("salary"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }

    }
}
    */

import java.sql.Connection;
import java.sql.DriverAction;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

class Project_2026 {
    public static void main(String args[]) {

        try {

            Connection con;
            PreparedStatement psmt;
            ResultSet rs;

            String url = "jdbc:postgresql://localhost:5432/demoDB";
            String user_name = "postgres";
            String password = "0617";

            con = DriverManager.getConnection(url, user_name, password);
            System.out.println("Connection Successful");

            psmt = con.prepareStatement("delete from staff where id = 5");

            int result = psmt.executeUpdate();
            System.out.println(result);

            if (result > 0) {
                System.out.println("Delete Successful: ");

            } else {
                System.err.println("Delete Unsuccessful:");
            }

        } catch (Exception e) {
            System.out.println(e);
        }

    }
}