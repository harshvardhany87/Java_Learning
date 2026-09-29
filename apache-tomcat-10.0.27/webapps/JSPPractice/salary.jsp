<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    Integer Staff_ID =
        (Integer) session.getAttribute("Staff_ID");

    String Staff_Name =
        (String) session.getAttribute("Staff_Name");

    String Staff_Mobile =
        (String) session.getAttribute("Staff_Mobile");

    Integer Staff_Salary =
        (Integer) session.getAttribute("Staff_Salary");


    // Prevent access without login
    if (Staff_ID == null || Staff_Name == null) {

        response.sendRedirect("Login.html");
        return;
    }


    // Annual salary calculation
    int Annual_Salary = Staff_Salary * 12;
%>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Salary Details</title>


    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;

            font-family:
                Arial,
                sans-serif;
        }


        body {

            min-height: 100vh;

            color: white;

            background:

                radial-gradient(
                    circle at top left,
                    rgba(99,102,241,0.27),
                    transparent 32%
                ),

                radial-gradient(
                    circle at bottom right,
                    rgba(14,165,233,0.20),
                    transparent 35%
                ),

                linear-gradient(
                    135deg,
                    #0f172a,
                    #111827,
                    #1e293b
                );

            overflow-x: hidden;
        }


        .page {

            min-height: 100vh;

            padding: 40px;
        }


        /* ---------------- TOP NAV ---------------- */


        .top-nav {

            max-width: 1200px;

            margin:
                0 auto 32px auto;

            display: flex;

            align-items: center;

            justify-content: space-between;
        }


        .brand {

            font-size: 24px;

            font-weight: 700;
        }


        .brand span {

            color: #818cf8;
        }


        .back-button {

            padding:
                11px 18px;

            border-radius: 11px;

            background:
                rgba(255,255,255,0.08);

            border:
                1px solid
                rgba(255,255,255,0.10);

            color: white;

            text-decoration: none;

            transition: 0.25s;
        }


        .back-button:visited {

            color: white;
        }


        .back-button:hover {

            background:
                rgba(99,102,241,0.18);

            transform:
                translateY(-2px);
        }


        /* ---------------- HEADER ---------------- */


        .header {

            max-width: 1200px;

            margin:
                0 auto 30px auto;

            display: flex;

            justify-content: space-between;

            align-items: center;
        }


        .heading h1 {

            font-size: 32px;

            margin-bottom: 7px;
        }


        .heading p {

            color: #94a3b8;

            line-height: 1.5;
        }


        .staff-box {

            display: flex;

            align-items: center;

            gap: 12px;

            padding:
                10px 16px;

            background:
                rgba(255,255,255,0.08);

            border:
                1px solid
                rgba(255,255,255,0.10);

            border-radius: 15px;

            backdrop-filter:
                blur(15px);
        }


        .avatar {

            width: 44px;
            height: 44px;

            display: flex;

            justify-content: center;

            align-items: center;

            border-radius: 50%;

            background:
                linear-gradient(
                    135deg,
                    #6366f1,
                    #0ea5e9
                );

            font-weight: bold;

            font-size: 18px;
        }


        .staff-small {

            color: #94a3b8;

            font-size: 12px;

            margin-top: 3px;
        }


        /* ---------------- SUMMARY CARDS ---------------- */


        .summary-grid {

            max-width: 1200px;

            margin:
                0 auto 28px auto;

            display: grid;

            grid-template-columns:
                repeat(4, 1fr);

            gap: 20px;
        }


        .summary-card {

            padding: 23px;

            border-radius: 18px;

            background:
                rgba(255,255,255,0.08);

            border:
                1px solid
                rgba(255,255,255,0.10);

            backdrop-filter:
                blur(16px);

            box-shadow:
                0 15px 35px
                rgba(0,0,0,0.18);

            transition: 0.25s;
        }


        .summary-card:hover {

            transform:
                translateY(-4px);

            background:
                rgba(255,255,255,0.11);
        }


        .summary-label {

            color: #94a3b8;

            font-size: 12px;

            text-transform: uppercase;

            letter-spacing: 0.5px;

            margin-bottom: 12px;
        }


        .summary-value {

            font-size: 22px;

            font-weight: 700;
        }


        .status-paid {

            display: inline-block;

            padding:
                7px 13px;

            border-radius: 25px;

            background:
                rgba(34,197,94,0.15);

            color: #86efac;

            font-size: 13px;

            font-weight: 600;
        }


        /* ---------------- MAIN CONTENT ---------------- */


        .main-grid {

            max-width: 1200px;

            margin: auto;

            display: grid;

            grid-template-columns:
                1.2fr 1fr;

            gap: 25px;
        }


        .panel {

            padding: 28px;

            border-radius: 20px;

            background:
                rgba(255,255,255,0.08);

            border:
                1px solid
                rgba(255,255,255,0.10);

            backdrop-filter:
                blur(17px);

            box-shadow:
                0 18px 45px
                rgba(0,0,0,0.20);
        }


        .panel-title {

            font-size: 21px;

            font-weight: 700;

            margin-bottom: 6px;
        }


        .panel-description {

            color: #94a3b8;

            font-size: 13px;

            margin-bottom: 25px;

            line-height: 1.5;
        }


        /* ---------------- SALARY DETAILS ---------------- */


        .salary-row {

            display: flex;

            justify-content: space-between;

            align-items: center;

            padding:
                17px 0;

            border-bottom:
                1px solid
                rgba(255,255,255,0.08);
        }


        .salary-row:last-child {

            border-bottom: none;
        }


        .salary-label {

            color: #94a3b8;

            font-size: 14px;
        }


        .salary-value {

            font-weight: 600;

            font-size: 15px;
        }


        .highlight-value {

            color: #a5b4fc;

            font-size: 18px;

            font-weight: 700;
        }


        /* ---------------- SALARY CARD ---------------- */


        .salary-main-card {

            padding: 25px;

            border-radius: 18px;

            background:
                linear-gradient(
                    135deg,
                    rgba(99,102,241,0.20),
                    rgba(14,165,233,0.12)
                );

            border:
                1px solid
                rgba(129,140,248,0.20);

            margin-bottom: 22px;
        }


        .salary-main-label {

            color: #cbd5e1;

            font-size: 13px;

            margin-bottom: 10px;
        }


        .salary-main-value {

            font-size: 34px;

            font-weight: 700;

            margin-bottom: 6px;
        }


        .salary-sub {

            color: #94a3b8;

            font-size: 12px;
        }


        /* ---------------- HISTORY ---------------- */


        .history-item {

            display: flex;

            justify-content: space-between;

            align-items: center;

            padding: 16px;

            margin-bottom: 12px;

            border-radius: 13px;

            background:
                rgba(255,255,255,0.05);

            border:
                1px solid
                rgba(255,255,255,0.07);
        }


        .history-left {

            display: flex;

            flex-direction: column;

            gap: 5px;
        }


        .history-month {

            font-weight: 600;
        }


        .history-date {

            color: #64748b;

            font-size: 12px;
        }


        .history-amount {

            font-weight: 700;
        }


        .empty-note {

            color: #64748b;

            text-align: center;

            padding: 25px 10px;

            line-height: 1.6;
        }


        /* ---------------- RESPONSIVE ---------------- */


        @media(max-width:1000px) {

            .summary-grid {

                grid-template-columns:
                    repeat(2,1fr);
            }


            .main-grid {

                grid-template-columns:
                    1fr;
            }
        }


        @media(max-width:650px) {

            .page {

                padding: 20px;
            }


            .top-nav,
            .header {

                flex-direction:
                    column;

                align-items:
                    flex-start;

                gap: 18px;
            }


            .summary-grid {

                grid-template-columns:
                    1fr;
            }

        }

    </style>

</head>


<body>


<div class="page">


    <!-- TOP NAV -->


    <div class="top-nav">

        <div class="brand">

            Staff<span>Portal</span>

        </div>


        <a href="Sdash.jsp"
           class="back-button">

            ← Back to Dashboard

        </a>

    </div>



    <!-- HEADER -->


    <div class="header">


        <div class="heading">

            <h1>
                Salary Details
            </h1>

            <p>
                View your salary information and payment summary.
            </p>

        </div>


        <div class="staff-box">


            <div class="avatar">

                <%= Staff_Name.substring(0,1).toUpperCase() %>

            </div>


            <div>

                <strong>
                    <%= Staff_Name %>
                </strong>

                <div class="staff-small">

                    Staff ID #<%= Staff_ID %>

                </div>

            </div>


        </div>


    </div>



    <!-- SUMMARY CARDS -->


    <div class="summary-grid">


        <div class="summary-card">

            <div class="summary-label">
                Monthly Salary
            </div>

            <div class="summary-value">

                ¥ <%= String.format("%,d", Staff_Salary) %>

            </div>

        </div>



        <div class="summary-card">

            <div class="summary-label">
                Annual Salary
            </div>

            <div class="summary-value">

                ¥ <%= String.format("%,d", Annual_Salary) %>

            </div>

        </div>



        <div class="summary-card">

            <div class="summary-label">
                Payment Status
            </div>

            <div class="status-paid">

                Active

            </div>

        </div>



        <div class="summary-card">

            <div class="summary-label">
                Staff ID
            </div>

            <div class="summary-value">

                #<%= Staff_ID %>

            </div>

        </div>


    </div>



    <!-- MAIN CONTENT -->


    <div class="main-grid">


        <!-- SALARY BREAKDOWN -->


        <div class="panel">


            <div class="panel-title">

                Salary Overview

            </div>


            <div class="panel-description">

                A summary of your current salary information.

            </div>


            <div class="salary-main-card">


                <div class="salary-main-label">

                    Current Monthly Salary

                </div>


                <div class="salary-main-value">

                    ¥ <%= String.format("%,d", Staff_Salary) %>

                </div>


                <div class="salary-sub">

                    Based on your current staff record

                </div>


            </div>


            <div class="salary-row">


                <span class="salary-label">
                    Staff Name
                </span>


                <span class="salary-value">

                    <%= Staff_Name %>

                </span>


            </div>


            <div class="salary-row">


                <span class="salary-label">
                    Staff ID
                </span>


                <span class="salary-value">

                    <%= Staff_ID %>

                </span>


            </div>


            <div class="salary-row">


                <span class="salary-label">
                    Monthly Salary
                </span>


                <span class="highlight-value">

                    ¥ <%= String.format("%,d", Staff_Salary) %>

                </span>


            </div>


            <div class="salary-row">


                <span class="salary-label">
                    Estimated Annual Salary
                </span>


                <span class="salary-value">

                    ¥ <%= String.format("%,d", Annual_Salary) %>

                </span>


            </div>


            <div class="salary-row">


                <span class="salary-label">
                    Account Status
                </span>


                <span class="status-paid">

                    Active

                </span>


            </div>


        </div>



        <!-- PAYMENT HISTORY -->


        <div class="panel">


            <div class="panel-title">

                Payment History

            </div>


            <div class="panel-description">

                Your salary payment records will appear here.

            </div>


            <div class="empty-note">

                No salary payment history is currently stored in the database.

                <br><br>

                Once you create a salary-payment table,
                monthly payment records can automatically appear here.

            </div>


        </div>


    </div>


</div>


</body>

</html>