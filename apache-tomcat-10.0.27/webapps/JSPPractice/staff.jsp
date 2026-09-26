<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=!, initial-scale=1.0">
    <title>Student Registration</title> 
</head>
<body>

    <%

        Connection con = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;

        try {

            int Staff_ID = Integer.parseInt(request.getParameter("Staff_ID"));
            String Staff_Name = request.getParameter("Staff_Name");
            String Staff_Mobile = request.getParameter("Staff_Mobile");
            int Staff_Salary = Integer.parseInt(request.getParameter("Staff_Salary"));

            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/demoDB", "postgres","0617");
            out.println("Connection Successful: <br>");

            psmt = con.prepareStatement("Select * from staff where mob = ?");
            psmt.setString(1, Staff_Mobile);
            rs = psmt.executeQuery();

            if (rs.next()){
                out.println("Already Registered: <br>0");
            } else {
                    psmt = con.prepareStatement("Insert into staff (id, name, mob, Salary) values(?,?,?,?)");

                    psmt.setInt(1, Staff_ID);
                    psmt.setString(2, Staff_Name);
                    psmt.setString(3, Staff_Mobile);
                    psmt.setInt(4, Staff_Salary);

                    int result = psmt.executeUpdate();

                    if (result > 0){
                        out.println("Insert Successfull: ");
                    } else{
                        out.println("Insert Failed: ");
                    }

            }
           

        }catch (Exception e){
            out.println(e);
        }
    
    %>
    
</body>
</html>