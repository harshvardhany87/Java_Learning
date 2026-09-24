<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = " java.sql.*"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=!, initial-scale=1.0">
    <title>Student Registration</title>
</head>
<body>

    <%

        String umobile =  request.getParameter("umobile");
        out.println(umobile); 

            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;

        try{

            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/demoDB", "postgres","0617");
            out.println("Connection Successful <br>:");

            stmt = con.createStatement();
            rs = stmt.executeQuery("select id, name from staff where mob = '"+umobile+"'");

            while (rs.next()){

                out.println("ID: " + rs.getString(1));
                out.println("<br>");

                out.println("Name: " + rs.getString(2));
                out.println("<br>");
            }

        }catch (Exception e){
            out.print(e);
        }
    
    %>
    
</body>
</html>