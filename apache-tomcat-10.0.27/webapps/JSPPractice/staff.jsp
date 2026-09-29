<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Staff Registration</title>

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

            overflow: hidden;

            background:
                radial-gradient(
                    circle at top left,
                    rgba(99, 102, 241, 0.35),
                    transparent 35%
                ),
                radial-gradient(
                    circle at bottom right,
                    rgba(14, 165, 233, 0.25),
                    transparent 35%
                ),
                linear-gradient(
                    135deg,
                    #0f172a,
                    #111827,
                    #1e293b
                );

            position: relative;

            color: white;
        }

        body::before,
        body::after {
            content: "";
            position: absolute;
            border-radius: 50%;
            filter: blur(10px);
            opacity: 0.5;
        }

        body::before {
            width: 260px;
            height: 260px;
            background: #4f46e5;
            top: -80px;
            left: -60px;
        }

        body::after {
            width: 300px;
            height: 300px;
            background: #0ea5e9;
            bottom: -100px;
            right: -80px;
        }

        .message-card {
            position: relative;
            z-index: 2;

            width: 100%;
            max-width: 450px;

            padding: 44px 36px;

            text-align: center;

            background:
                rgba(255,255,255,0.10);

            backdrop-filter: blur(18px);
            -webkit-backdrop-filter: blur(18px);

            border:
                1px solid rgba(255,255,255,0.18);

            border-radius: 22px;

            box-shadow:
                0 25px 60px rgba(0,0,0,0.35);
        }

        .success-icon,
        .warning-icon,
        .error-icon {
            width: 76px;
            height: 76px;

            margin: 0 auto 22px;

            display: flex;
            justify-content: center;
            align-items: center;

            border-radius: 50%;

            font-size: 34px;
            font-weight: bold;
        }

        .success-icon {
            background:
                rgba(34,197,94,0.15);

            border:
                1px solid rgba(34,197,94,0.30);

            color: #86efac;
        }

        .warning-icon {
            background:
                rgba(245,158,11,0.15);

            border:
                1px solid rgba(245,158,11,0.30);

            color: #fcd34d;
        }

        .error-icon {
            background:
                rgba(239,68,68,0.15);

            border:
                1px solid rgba(239,68,68,0.30);

            color: #fca5a5;
        }

        h2 {
            font-size: 28px;
            margin-bottom: 12px;
        }

        p {
            color: #cbd5e1;
            font-size: 14px;
            line-height: 1.6;
            margin-bottom: 26px;
        }

        .details {
            margin-bottom: 24px;

            padding: 16px;

            border-radius: 13px;

            background:
                rgba(255,255,255,0.05);

            border:
                1px solid rgba(255,255,255,0.08);

            text-align: left;
        }

        .detail-row {
            display: flex;
            justify-content: space-between;

            padding: 8px 0;

            font-size: 13px;
        }

        .detail-label {
            color: #94a3b8;
        }

        .detail-value {
            color: white;
            font-weight: 600;
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
            color: white;

            background:
                linear-gradient(
                    135deg,
                    #6366f1,
                    #4f46e5
                );

            box-shadow:
                0 10px 25px rgba(79,70,229,0.35);
        }

        .primary-btn:visited {
            color: white;
        }

        .primary-btn:hover {
            transform: translateY(-2px);

            box-shadow:
                0 15px 35px rgba(79,70,229,0.45);
        }

        .secondary-btn {
            margin-top: 12px;

            color: #e2e8f0;

            background:
                rgba(255,255,255,0.06);

            border:
                1px solid rgba(255,255,255,0.10);
        }

        .secondary-btn:visited {
            color: #e2e8f0;
        }

        .secondary-btn:hover {
            color: white;

            background:
                rgba(255,255,255,0.10);
        }

        .error-details {
            margin-bottom: 20px;

            padding: 12px;

            border-radius: 10px;

            background:
                rgba(239,68,68,0.08);

            color: #fca5a5;

            font-size: 12px;

            word-break: break-word;
        }

        @media(max-width:500px) {

            .message-card {
                margin: 20px;
                padding: 34px 24px;
            }

        }

    </style>

</head>

<body>

<%

    Connection con = null;
    PreparedStatement psmt = null;
    ResultSet rs = null;

    try {

        int Staff_ID =
            Integer.parseInt(
                request.getParameter("Staff_ID")
            );

        String Staff_Name =
            request.getParameter("Staff_Name");

        String Staff_Mobile =
            request.getParameter("Staff_Mobile");

        int Staff_Salary =
            Integer.parseInt(
                request.getParameter("Staff_Salary")
            );

        Class.forName("org.postgresql.Driver");

        con = DriverManager.getConnection(
            "jdbc:postgresql://localhost:5432/demoDB",
            "postgres",
            "0617"
        );

        psmt = con.prepareStatement(
            "SELECT * FROM staff WHERE mob = ?"
        );

        psmt.setString(
            1,
            Staff_Mobile
        );

        rs = psmt.executeQuery();

        if (rs.next()) {

%>

<div class="message-card">

    <div class="warning-icon">
        !
    </div>

    <h2>
        Already Registered
    </h2>

    <p>
        An account with this mobile number already exists.
        Please login using the registered mobile number.
    </p>

    <a href="Login.html"
       class="primary-btn">
        Go to Login
    </a>

    <a href="staff.html"
       class="secondary-btn">
        Back to Registration
    </a>

</div>

<%

        } else {

            psmt = con.prepareStatement(
                "INSERT INTO staff (id, name, mob, salary) VALUES (?, ?, ?, ?)"
            );

            psmt.setInt(
                1,
                Staff_ID
            );

            psmt.setString(
                2,
                Staff_Name
            );

            psmt.setString(
                3,
                Staff_Mobile
            );

            psmt.setInt(
                4,
                Staff_Salary
            );

            int result =
                psmt.executeUpdate();

            if (result > 0) {

%>

<div class="message-card">

    <div class="success-icon">
        ✓
    </div>

    <h2>
        Registration Successful
    </h2>

    <p>
        Your staff account has been created successfully.
        You can now login using your registered mobile number.
    </p>

    <div class="details">

        <div class="detail-row">

            <span class="detail-label">
                Staff ID
            </span>

            <span class="detail-value">
                #<%= Staff_ID %>
            </span>

        </div>

        <div class="detail-row">

            <span class="detail-label">
                Name
            </span>

            <span class="detail-value">
                <%= Staff_Name %>
            </span>

        </div>

        <div class="detail-row">

            <span class="detail-label">
                Mobile
            </span>

            <span class="detail-value">
                <%= Staff_Mobile %>
            </span>

        </div>

        <div class="detail-row">

            <span class="detail-label">
                Salary
            </span>

            <span class="detail-value">
                ¥ <%= String.format("%,d", Staff_Salary) %>
            </span>

        </div>

    </div>

    <a href="Login.html"
       class="primary-btn">
        Continue to Login
    </a>

</div>

<%

            } else {

%>

<div class="message-card">

    <div class="error-icon">
        !
    </div>

    <h2>
        Registration Failed
    </h2>

    <p>
        Your account could not be created.
        Please check the information and try again.
    </p>

    <a href="staff.html"
       class="primary-btn">
        Try Again
    </a>

</div>

<%

            }

        }

    } catch (Exception e) {

%>

<div class="message-card">

    <div class="error-icon">
        !
    </div>

    <h2>
        Something Went Wrong
    </h2>

    <p>
        We were unable to complete your registration.
    </p>

    <div class="error-details">
        <%= e.getMessage() %>
    </div>

    <a href="staff.html"
       class="primary-btn">
        Return to Registration
    </a>

    <a href="Login.html"
       class="secondary-btn">
        Go to Login
    </a>

</div>

<%

    }

%>

</body>

</html>