<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>
    <meta charset="UTF-8">
    <title>First JSP</title>
</head>

<body>

    <h1>JSP Page</h1>

    <%

        String Name = request.getParameter("Name");

        out.print("JSP PAGE = " + Name);

        // http://localhost:8080/JSPPractice/first.html

    %>

</body>

</html>