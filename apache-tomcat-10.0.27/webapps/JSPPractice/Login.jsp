<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Login</title>
</head>

<body>

<%

    Connection con = null;
    PreparedStatement psmt = null;
    ResultSet rs = null;

    try {

        String umobile = request.getParameter("umobile");

        Class.forName("org.postgresql.Driver");

        con = DriverManager.getConnection(
            "jdbc:postgresql://localhost:5432/demoDB",
            "postgres",
            "0617"
        );

        psmt = con.prepareStatement(
            "SELECT * FROM staff WHERE mob = ?"
        );

        psmt.setString(1, umobile);

        rs = psmt.executeQuery();

        if(rs.next()) {

            session.setAttribute(
                "Staff_ID",
                rs.getInt("id")
            );

            session.setAttribute(
                "Staff_Name",
                rs.getString("name")
            );

            session.setAttribute(
                "Staff_Mobile",
                rs.getString("mob")
            );

            session.setAttribute(
                "Staff_Salary",
                rs.getInt("salary")
            );

            response.sendRedirect("Sdash.jsp");

        } else {

            out.println("<h2>Mobile number not registered</h2>");

            out.println(
                "<a href='Login.html'>Try Again</a>"
            );

            out.println("<br><br>");

            out.println(
                "<a href='staff.html'>Register New Account</a>"
            );
        }

    } catch(Exception e) {

        out.print(e);

    }

%>

</body>
</html>