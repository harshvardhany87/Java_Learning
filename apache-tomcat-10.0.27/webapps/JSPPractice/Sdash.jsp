<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    Integer Staff_ID = (Integer) session.getAttribute("Staff_ID");
    String Staff_Name = (String) session.getAttribute("Staff_Name");
    String Staff_Mobile = (String) session.getAttribute("Staff_Mobile");
    Integer Staff_Salary = (Integer) session.getAttribute("Staff_Salary");

    // If user opens dashboard without logging in
    if (Staff_Name == null) {
        response.sendRedirect("Login.html");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Staff Dashboard</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            min-height: 100vh;
            color: white;

            background:
                radial-gradient(
                    circle at top left,
                    rgba(99,102,241,0.24),
                    transparent 32%
                ),

                radial-gradient(
                    circle at bottom right,
                    rgba(14,165,233,0.18),
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


        .dashboard {
            display: flex;
            min-height: 100vh;
        }


        /* ---------------- SIDEBAR ---------------- */

        .sidebar {

            width: 250px;
            height: 100vh;

            position: fixed;

            padding: 30px 20px;

            background:
                rgba(15,23,42,0.88);

            backdrop-filter: blur(18px);

            border-right:
                1px solid rgba(255,255,255,0.08);

            box-shadow:
                8px 0 30px rgba(0,0,0,0.15);
        }


        .logo {

            font-size: 24px;
            font-weight: bold;

            margin-bottom: 45px;
        }


        .logo span {
            color: #818cf8;
        }


        .menu {
            list-style: none;
        }


        .menu li {

            padding: 14px 16px;

            margin-bottom: 10px;

            border-radius: 12px;

            color: #cbd5e1;

            cursor: pointer;

            transition: 0.25s;
        }


        .menu li:hover {

            background:
                rgba(99,102,241,0.15);

            color: white;

            transform:
                translateX(4px);
        }


        .menu .active {

            background:
                linear-gradient(
                    135deg,
                    #6366f1,
                    #4f46e5
                );

            color: white;
        }


        .logout {

            position: absolute;

            bottom: 30px;

            left: 20px;

            width: 210px;
        }


        .logout a {

            display: block;

            text-align: center;

            padding: 13px;

            border-radius: 11px;

            background:
                rgba(239,68,68,0.14);

            color: #fca5a5;

            text-decoration: none;

            transition: 0.25s;
        }


        .logout a:hover {

            background: #ef4444;
            color: white;
        }



        /* ---------------- MAIN ---------------- */

        .main {

            margin-left: 250px;

            width:
                calc(100% - 250px);

            padding:
                35px 45px;
        }



        /* ---------------- TOP BAR ---------------- */

        .topbar {

            display: flex;

            justify-content:
                space-between;

            align-items: center;

            margin-bottom: 35px;
        }


        .welcome h1 {

            font-size: 32px;

            margin-bottom: 8px;
        }


        .welcome p {

            color: #94a3b8;
        }


        .profile-box {

            display: flex;

            align-items: center;

            gap: 12px;

            padding:
                10px 16px;

            border-radius: 15px;

            background:
                rgba(255,255,255,0.08);

            border:
                1px solid rgba(255,255,255,0.10);

            backdrop-filter:
                blur(15px);
        }


        .avatar {

            width: 44px;
            height: 44px;

            border-radius: 50%;

            display: flex;

            align-items: center;

            justify-content: center;

            background:
                linear-gradient(
                    135deg,
                    #6366f1,
                    #0ea5e9
                );

            font-size: 18px;
            font-weight: bold;
        }


        .small-text {

            color: #94a3b8;

            font-size: 12px;
        }



        /* ---------------- CARDS ---------------- */

        .cards {

            display: grid;

            grid-template-columns:
                repeat(4,1fr);

            gap: 20px;

            margin-bottom: 30px;
        }


        .card {

            padding: 24px;

            border-radius: 18px;

            background:
                rgba(255,255,255,0.08);

            border:
                1px solid rgba(255,255,255,0.10);

            backdrop-filter:
                blur(16px);

            box-shadow:
                0 15px 35px
                rgba(0,0,0,0.20);

            transition: 0.25s;
        }


        .card:hover {

            transform:
                translateY(-5px);

            background:
                rgba(255,255,255,0.11);
        }


        .card-title {

            color: #94a3b8;

            font-size: 13px;

            margin-bottom: 12px;
        }


        .card-value {

            font-size: 23px;

            font-weight: bold;
        }


        .status {

            display: inline-block;

            padding:
                7px 14px;

            border-radius: 20px;

            background:
                rgba(34,197,94,0.15);

            color: #86efac;

            font-size: 13px;

            font-weight: bold;
        }



        /* ---------------- CONTENT ---------------- */

        .content-grid {

            display: grid;

            grid-template-columns:
                2fr 1fr;

            gap: 25px;
        }


        .panel {

            padding: 28px;

            border-radius: 20px;

            background:
                rgba(255,255,255,0.08);

            border:
                1px solid rgba(255,255,255,0.10);

            backdrop-filter:
                blur(16px);

            box-shadow:
                0 15px 35px
                rgba(0,0,0,0.18);
        }


        .panel h2 {

            margin-bottom: 22px;

            font-size: 21px;
        }


        .detail-row {

            display: flex;

            justify-content:
                space-between;

            padding:
                17px 0;

            border-bottom:
                1px solid
                rgba(255,255,255,0.08);
        }


        .detail-row:last-child {
            border-bottom: none;
        }


        .label {
            color: #94a3b8;
        }


        .value {
            font-weight: 600;
        }



        /* ---------------- QUICK ACTIONS ---------------- */

        .quick-action {

            padding: 15px;

            margin-bottom: 12px;

            border-radius: 12px;

            background:
                rgba(255,255,255,0.05);

            border:
                1px solid
                rgba(255,255,255,0.07);

            cursor: pointer;

            transition: 0.2s;
        }


        .quick-action:hover {

            background:
                rgba(99,102,241,0.14);

            transform:
                translateX(4px);
        }



        /* ---------------- RESPONSIVE ---------------- */

        @media(max-width:1000px) {

            .cards {

                grid-template-columns:
                    repeat(2,1fr);
            }

            .content-grid {

                grid-template-columns:
                    1fr;
            }
        }


        @media(max-width:750px) {

            .sidebar {
                display: none;
            }

            .main {

                margin-left: 0;

                width: 100%;

                padding: 25px;
            }

            .cards {

                grid-template-columns:
                    1fr;
            }

            .topbar {

                flex-direction:
                    column;

                align-items:
                    flex-start;

                gap: 20px;
            }
        }

    </style>

</head>

<body>


<div class="dashboard">


    <!-- Sidebar -->

    <aside class="sidebar">

        <div class="logo">
            Staff<span>Portal</span>
        </div>


        <ul class="menu">

            <li class="active">
                Dashboard
            </li>

            <li>
                My Profile
            </li>

            <li>
                Attendance
            </li>

            <li>
                Salary
            </li>

            <li>
                Settings
            </li>

        </ul>


        <div class="logout">

            <a href="Login.html">
                Logout
            </a>

        </div>

    </aside>



    <!-- Main Dashboard -->

    <main class="main">


        <!-- Header -->

        <div class="topbar">


            <div class="welcome">

                <h1>
                    Welcome, <%= Staff_Name %> 👋
                </h1>

                <p>
                    Here's an overview of your staff account.
                </p>

            </div>



            <div class="profile-box">

                <div class="avatar">

                    <%= Staff_Name.substring(0,1).toUpperCase() %>

                </div>


                <div>

                    <strong>
                        <%= Staff_Name %>
                    </strong>

                    <br>

                    <span class="small-text">
                        Staff Member
                    </span>

                </div>

            </div>


        </div>



        <!-- Cards -->

        <section class="cards">


            <div class="card">

                <div class="card-title">
                    STAFF ID
                </div>

                <div class="card-value">
                    #<%= Staff_ID %>
                </div>

            </div>



            <div class="card">

                <div class="card-title">
                    MOBILE NUMBER
                </div>

                <div class="card-value">
                    <%= Staff_Mobile %>
                </div>

            </div>



            <div class="card">

                <div class="card-title">
                    MONTHLY SALARY
                </div>

                <div class="card-value">
                    ¥ <%= String.format("%,d", Staff_Salary) %>
                </div>

            </div>



            <div class="card">

                <div class="card-title">
                    ACCOUNT STATUS
                </div>

                <div class="status">
                    Active
                </div>

            </div>


        </section>



        <!-- Information -->

        <section class="content-grid">


            <div class="panel">

                <h2>
                    Staff Information
                </h2>


                <div class="detail-row">

                    <span class="label">
                        Full Name
                    </span>

                    <span class="value">
                        <%= Staff_Name %>
                    </span>

                </div>


                <div class="detail-row">

                    <span class="label">
                        Staff ID
                    </span>

                    <span class="value">
                        <%= Staff_ID %>
                    </span>

                </div>


                <div class="detail-row">

                    <span class="label">
                        Mobile Number
                    </span>

                    <span class="value">
                        <%= Staff_Mobile %>
                    </span>

                </div>


                <div class="detail-row">

                    <span class="label">
                        Salary
                    </span>

                    <span class="value">

                        ¥ <%= String.format("%,d", Staff_Salary) %>

                    </span>

                </div>


                <div class="detail-row">

                    <span class="label">
                        Status
                    </span>

                    <span class="status">
                        Active
                    </span>

                </div>


            </div>



            <!-- Quick Actions -->

            <div class="panel">

                <h2>
                    Quick Actions
                </h2>


                <div class="quick-action">
                    👤 View Profile
                </div>


                <div class="quick-action">
                    📅 View Attendance
                </div>


                <div class="quick-action">
                    💰 Salary Details
                </div>


                <div class="quick-action">
                    ⚙️ Account Settings
                </div>


            </div>


        </section>


    </main>


</div>


</body>

</html>