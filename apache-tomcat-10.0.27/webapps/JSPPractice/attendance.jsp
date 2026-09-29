<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<%
    Integer Staff_ID =
        (Integer) session.getAttribute("Staff_ID");

    String Staff_Name =
        (String) session.getAttribute("Staff_Name");

    String Staff_Mobile =
        (String) session.getAttribute("Staff_Mobile");


    // Prevent access without login
    if (Staff_ID == null || Staff_Name == null) {

        response.sendRedirect("Login.html");
        return;
    }


    // Today's date
    LocalDate today = LocalDate.now();

    DateTimeFormatter formatter =
        DateTimeFormatter.ofPattern("dd MMMM yyyy");

    String formattedDate =
        today.format(formatter);


    /*
        These values are temporary.

        Later, when you create your attendance table
        in PostgreSQL, these values can come from
        the database.
    */

    String todayStatus = "Not Registered";

%>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Staff Attendance</title>


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

            align-items: center;

            justify-content: space-between;
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

            margin-bottom: 12px;

            text-transform: uppercase;

            letter-spacing: 0.5px;
        }


        .summary-value {

            font-size: 22px;

            font-weight: 700;
        }


        .status-pending {

            display: inline-block;

            padding:
                7px 13px;

            border-radius: 25px;

            background:
                rgba(245,158,11,0.15);

            color: #fcd34d;

            font-size: 13px;

            font-weight: 600;
        }



        /* ---------------- MAIN GRID ---------------- */


        .main-grid {

            max-width: 1200px;

            margin: auto;

            display: grid;

            grid-template-columns:
                1.3fr 2fr;

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



        /* ---------------- TODAY ATTENDANCE ---------------- */


        .attendance-date {

            padding: 18px;

            background:
                rgba(255,255,255,0.05);

            border:
                1px solid
                rgba(255,255,255,0.07);

            border-radius: 14px;

            margin-bottom: 17px;
        }


        .date-label {

            color: #64748b;

            font-size: 12px;

            text-transform: uppercase;

            margin-bottom: 7px;
        }


        .date-value {

            font-size: 18px;

            font-weight: 600;
        }


        .attendance-status-box {

            padding: 18px;

            background:
                rgba(245,158,11,0.07);

            border:
                1px solid
                rgba(245,158,11,0.15);

            border-radius: 14px;

            margin-bottom: 22px;
        }


        .register-button {

            display: block;

            width: 100%;

            padding: 14px;

            text-align: center;

            border-radius: 11px;

            background:
                linear-gradient(
                    135deg,
                    #6366f1,
                    #4f46e5
                );

            color: white;

            text-decoration: none;

            font-weight: 600;

            transition: 0.25s;

            box-shadow:
                0 10px 25px
                rgba(79,70,229,0.35);
        }


        .register-button:visited {

            color: white;
        }


        .register-button:hover {

            transform:
                translateY(-2px);

            box-shadow:
                0 15px 35px
                rgba(79,70,229,0.45);
        }


        .network-note {

            margin-top: 17px;

            padding: 13px;

            border-radius: 11px;

            background:
                rgba(59,130,246,0.08);

            border:
                1px solid
                rgba(59,130,246,0.13);

            color: #94a3b8;

            font-size: 12px;

            line-height: 1.6;
        }



        /* ---------------- HISTORY TABLE ---------------- */


        .table-wrapper {

            overflow-x: auto;
        }


        table {

            width: 100%;

            border-collapse: collapse;
        }


        th {

            text-align: left;

            padding:
                13px 12px;

            color: #94a3b8;

            font-size: 12px;

            text-transform: uppercase;

            border-bottom:
                1px solid
                rgba(255,255,255,0.10);
        }


        td {

            padding:
                17px 12px;

            border-bottom:
                1px solid
                rgba(255,255,255,0.07);

            font-size: 14px;
        }


        .empty-row {

            color: #64748b;

            text-align: center;

            padding: 35px;
        }


        .present {

            display: inline-block;

            padding:
                6px 12px;

            border-radius: 20px;

            background:
                rgba(34,197,94,0.15);

            color: #86efac;

            font-size: 12px;

            font-weight: 600;
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
                Attendance
            </h1>

            <p>
                View your attendance and register today's attendance.
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



    <!-- SUMMARY -->


    <div class="summary-grid">


        <div class="summary-card">

            <div class="summary-label">
                Today
            </div>

            <div class="summary-value">

                <%= formattedDate %>

            </div>

        </div>



        <div class="summary-card">

            <div class="summary-label">
                Today's Status
            </div>

            <div class="status-pending">

                <%= todayStatus %>

            </div>

        </div>



        <div class="summary-card">

            <div class="summary-label">
                Present Days
            </div>

            <div class="summary-value">

                --

            </div>

        </div>



        <div class="summary-card">

            <div class="summary-label">
                Attendance Rate
            </div>

            <div class="summary-value">

                --

            </div>

        </div>


    </div>



    <!-- MAIN CONTENT -->


    <div class="main-grid">


        <!-- REGISTER ATTENDANCE -->


        <div class="panel">


            <div class="panel-title">

                Today's Attendance

            </div>


            <div class="panel-description">

                Register your attendance for the current working day.

            </div>



            <div class="attendance-date">


                <div class="date-label">

                    Date

                </div>


                <div class="date-value">

                    <%= formattedDate %>

                </div>


            </div>



            <div class="attendance-status-box">


                <div class="date-label">

                    Current Status

                </div>


                <div class="status-pending">

                    <%= todayStatus %>

                </div>


            </div>



            <a href="registerAttendance.jsp"
               class="register-button">

                ✓ Register Attendance

            </a>



            <div class="network-note">

                Attendance registration can later be restricted
                to users connected to your designated workplace
                network or Wi-Fi.

            </div>


        </div>



        <!-- ATTENDANCE HISTORY -->


        <div class="panel">


            <div class="panel-title">

                Attendance History

            </div>


            <div class="panel-description">

                Your recent attendance records will appear here.

            </div>


            <div class="table-wrapper">


                <table>


                    <thead>

                        <tr>

                            <th>
                                Date
                            </th>

                            <th>
                                Check In
                            </th>

                            <th>
                                Status
                            </th>

                        </tr>

                    </thead>


                    <tbody>


                        <!--
                            Later you can replace this row
                            with attendance data from PostgreSQL.
                        -->


                        <tr>

                            <td colspan="3"
                                class="empty-row">

                                No attendance records available yet.

                            </td>

                        </tr>


                    </tbody>


                </table>


            </div>


        </div>


    </div>


</div>


</body>

</html>