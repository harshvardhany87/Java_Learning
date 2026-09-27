<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Staff Login</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            min-height: 100vh;

            display: flex;
            justify-content: center;
            align-items: center;

            background:
                radial-gradient(
                    circle at top left,
                    rgba(99, 102, 241, 0.32),
                    transparent 35%
                ),
                radial-gradient(
                    circle at bottom right,
                    rgba(14, 165, 233, 0.24),
                    transparent 35%
                ),
                linear-gradient(
                    135deg,
                    #0f172a,
                    #111827,
                    #1e293b
                );

            color: white;
        }

        .message-card {

            width: 100%;
            max-width: 430px;

            padding: 42px 36px;

            text-align: center;

            background:
                rgba(255,255,255,0.08);

            backdrop-filter: blur(18px);

            border:
                1px solid rgba(255,255,255,0.12);

            border-radius: 22px;

            box-shadow:
                0 25px 60px rgba(0,0,0,0.35);
        }

        .error-icon {

            width: 72px;
            height: 72px;

            margin: 0 auto 22px;

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 50%;

            background:
                rgba(239,68,68,0.15);

            border:
                1px solid rgba(239,68,68,0.25);

            color: #fca5a5;

            font-size: 34px;
        }

        h2 {
            font-size: 28px;
            margin-bottom: 12px;
        }

        p {
            color: #94a3b8;
            line-height: 1.6;
            margin-bottom: 26px;
        }

        .primary-btn,
        .secondary-btn {

            display: block;

            width: 100%;

            padding: 14px;

            border-radius: 11px;

            text-decoration: none;

            font-weight: 600;

            transition: 0.25s;
        }

        .primary-btn {

            background:
                linear-gradient(
                    135deg,
                    #6366f1,
                    #4f46e5
                );

            color: white;

            box-shadow:
                0 10px 25px rgba(79,70,229,0.35);
        }

        .primary-btn:hover {

            transform: translateY(-2px);

            box-shadow:
                0 15px 35px rgba(79,70,229,0.45);
        }

        .secondary-btn {

            margin-top: 12px;

            background:
                rgba(255,255,255,0.06);

            color: #e2e8f0;

            border:
                1px solid rgba(255,255,255,0.10);
        }

        .secondary-btn:hover {

            background:
                rgba(255,255,255,0.10);

            color: white;
        }

        .error-details {

            margin-top: 15px;

            color: #fca5a5;

            font-size: 13px;
        }

    </style>

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
            return;

        } else {

%>

<div class="message-card">

    <div class="error-icon">
        !
    </div>

    <h2>
        Mobile Number Not Registered
    </h2>

    <p>
        We couldn't find an account associated with this mobile number.
        Please check the number and try again, or create a new account.
    </p>

    <a href="Login.html"
       class="primary-btn">
        Try Again
    </a>

    <a href="staff.html"
       class="secondary-btn">
        Register New Account
    </a>

</div>

<%

        }

    } catch(Exception e) {

%>

<div class="message-card">

    <div class="error-icon">
        !
    </div>

    <h2>
        Something Went Wrong
    </h2>

    <p>
        We were unable to process your login request.
    </p>

    <div class="error-details">
        <%= e.getMessage() %>
    </div>

    <br>

    <a href="Login.html"
       class="primary-btn">
        Return to Login
    </a>

</div>

<%

    }

%>

</body>

</html>