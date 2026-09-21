import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class Dbconn {
    public static void main(String args[]) {
        try {

            Statement stmt;
            PreparedStatement psmt;
            ResultSet rs;

            String url = "jdbc:postgresql://localhost:5432/demoDB";
            String user_name = "postgres";
            String password = "0617";

            // con = DriverManager.getConnection(url, user_name, password);
            System.out.println("Connection Successful");

        } catch (Exception e) {
            System.out.println(e);
        }

    }

}
