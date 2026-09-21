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

/* 
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
    */

/* 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

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

            Scanner id = new Scanner(System.in);
            System.out.println("Enter the ID of the user: ");
            int ID_result = id.nextInt();

            Scanner name = new Scanner(System.in);
            System.out.println("Enter the name of the user: ");
            String name_result = id.next();

            Scanner mobile = new Scanner(System.in);
            System.out.println("Enter the mobile of the user: ");
            String mobile_result = id.next();

            Scanner salary = new Scanner(System.in);
            System.out.println("Enter the salary of the user: ");
            int salary_result = id.nextInt();

            psmt = con.prepareStatement("Insert into staff (id, name, mob, salary) values(?, ?, ?, ?)");
            psmt.setInt(1, ID_result);
            psmt.setString(2, name_result);
            psmt.setString(3, mobile_result);
            psmt.setInt(4, salary_result);

            int result = psmt.executeUpdate();

            if (result > 0) {
                System.out.println("Insert Successful");
            } else {
                System.err.println("Insert Unsuccessful");
            }

        } catch (Exception e) {
            System.out.println(e);
        }

    }
}
    */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

class Project_2026 {
    public static void main(String args[]) {
        try {

            Connection con;
            PreparedStatement psmt;
            ResultSet rs;

            String url = "jdbc:postgresql://localhost:5432/demoDB";
            String user_name = "postgres";
            String passworwd = "0617";

            con = DriverManager.getConnection(url, user_name, passworwd);
            System.out.println("Connection Successful");

            Scanner name = new Scanner(System.in);
            System.out.println("Enter the Name of the user: ");
            String name_result = name.next();

            Scanner mobile = new Scanner(System.in);
            System.out.println("Enter the Mobile of the user: ");
            String mobile_result = mobile.next();

            Scanner salary = new Scanner(System.in);
            System.out.println("Enter the Salary of the user: ");
            int salary_result = salary.nextInt();

            Scanner ID = new Scanner(System.in);
            System.out.println("Enter the ID of the user: ");
            int ID_result = ID.nextInt();

            psmt = con.prepareStatement("update staff set name = ?, mob = ?, salary = ? where id = ?");
            psmt.setString(1, name_result);
            psmt.setString(2, mobile_result);
            psmt.setInt(3, salary_result);
            psmt.setInt(4, ID_result);

            int update_result = psmt.executeUpdate();

            if (update_result > 0) {
                System.out.println("Update Successful");

            } else {
                System.err.println("Update Unsuccessful");
            }

        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
