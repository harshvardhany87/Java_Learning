<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.LocalTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<%

    Integer Staff_ID =
        (Integer) session.getAttribute("Staff_ID");

    String Staff_Name =
        (String) session.getAttribute("Staff_Name");

    if (Staff_ID == null || Staff_Name == null) {
        response.sendRedirect("Login.html");
        return;
    }

    String message = "";
    boolean alreadyRegistered = false;

    LocalDate today = LocalDate.now();

    DateTimeFormatter dateFormatter =
        DateTimeFormatter.ofPattern("dd MMMM yyyy");

    String formattedDate =
        today.format(dateFormatter);

    Connection con = null;
    PreparedStatement psmt = null;
    ResultSet rs = null;

    String todayStatus = "Not Registered";
    String todayCheckIn = "--";

    try {

        Class.forName("org.postgresql.Driver");

        con = DriverManager.getConnection(
            "jdbc:postgresql://localhost:5432/demoDB",
            "postgres",
            "0617"
        );

        String action =
            request.getParameter("action");

        if ("register".equals(action)) {

            psmt = con.prepareStatement(
                "SELECT * FROM attendance " +
                "WHERE staff_id = ? " +
                "AND attendance_date = ?"
            );

            psmt.setInt(
                1,
                Staff_ID
            );

            psmt.setDate(
                2,
                Date.valueOf(today)
            );

            rs =
                psmt.executeQuery();

            if (rs.next()) {

                message =
                    "Attendance has already been registered for today.";

            } else {

                LocalTime currentTime =
                    LocalTime.now();

                psmt = con.prepareStatement(
                    "INSERT INTO attendance " +
                    "(staff_id, attendance_date, check_in_time, status) " +
                    "VALUES (?, ?, ?, ?)"
                );

                psmt.setInt(
                    1,
                    Staff_ID
                );

                psmt.setDate(
                    2,
                    Date.valueOf(today)
                );

                psmt.setTime(
                    3,
                    Time.valueOf(currentTime)
                );

                psmt.setString(
                    4,
                    "Present"
                );

                int result =
                    psmt.executeUpdate();

                if (result > 0) {

                    message =
                        "Attendance registered successfully.";

                } else {

                    message =
                        "Attendance registration failed.";
                }
            }
        }

        psmt = con.prepareStatement(
            "SELECT * FROM attendance " +
            "WHERE staff_id = ? " +
            "AND attendance_date = ?"
        );

        psmt.setInt(
            1,
            Staff_ID
        );

        psmt.setDate(
            2,
            Date.valueOf(today)
        );

        rs =
            psmt.executeQuery();

        if (rs.next()) {

            alreadyRegistered = true;

            todayStatus =
                rs.getString("status");

            Time checkTime =
                rs.getTime("check_in_time");

            if (checkTime != null) {

                todayCheckIn =
                    checkTime
                    .toLocalTime()
                    .format(
                        DateTimeFormatter.ofPattern("hh:mm a")
                    );
            }
        }

    } catch (Exception e) {

        message =
            "Unable to process attendance. Please try again.";
    }

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
            font-family: Arial, sans-serif;
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

        .top-nav {
            max-width: 1200px;
            margin: 0 auto 32px auto;

            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .brand {
            font-size: 24px;
            font-weight: 700;
        }

        .brand span {
            color: #818cf8;
        }

        .back-button {
            padding: 11px 18px;
            border-radius: 11px;

            background:
                rgba(255,255,255,0.08);

            border:
                1px solid rgba(255,255,255,0.10);

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

            transform: translateY(-2px);
        }

        .header {
            max-width: 1200px;
            margin: 0 auto 30px auto;

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
        }

        .staff-box {
            display: flex;
            align-items: center;
            gap: 12px;

            padding: 10px 16px;

            background:
                rgba(255,255,255,0.08);

            border:
                1px solid rgba(255,255,255,0.10);

            border-radius: 15px;
        }

        .avatar {
            width: 44px;
            height: 44px;
            border-radius: 50%;

            display: flex;
            justify-content: center;
            align-items: center;

            background:
                linear-gradient(
                    135deg,
                    #6366f1,
                    #0ea5e9
                );

            font-weight: bold;
        }

        .staff-small {
            color: #94a3b8;
            font-size: 12px;
        }

        .message {
            max-width: 1200px;
            margin: 0 auto 22px auto;

            padding: 14px 18px;
            border-radius: 12px;

            background:
                rgba(99,102,241,0.12);

            border:
                1px solid rgba(129,140,248,0.18);

            color: #c7d2fe;
        }

        .summary-grid {
            max-width: 1200px;
            margin: 0 auto 28px auto;

            display: grid;
            grid-template-columns: repeat(3,1fr);
            gap: 20px;
        }

        .summary-card {
            padding: 23px;
            border-radius: 18px;

            background:
                rgba(255,255,255,0.08);

            border:
                1px solid rgba(255,255,255,0.10);

            box-shadow:
                0 15px 35px rgba(0,0,0,0.18);
        }

        .summary-label {
            color: #94a3b8;
            font-size: 12px;
            margin-bottom: 12px;
        }

        .summary-value {
            font-size: 22px;
            font-weight: 700;
        }

        .present-status {
            display: inline-block;

            padding: 7px 13px;
            border-radius: 25px;

            background:
                rgba(34,197,94,0.15);

            color: #86efac;
        }

        .pending-status {
            display: inline-block;

            padding: 7px 13px;
            border-radius: 25px;

            background:
                rgba(245,158,11,0.15);

            color: #fcd34d;
        }

        .main-grid {
            max-width: 1200px;
            margin: auto;

            display: grid;
            grid-template-columns: 1fr 1.6fr;
            gap: 25px;
        }

        .panel {
            padding: 28px;
            border-radius: 20px;

            background:
                rgba(255,255,255,0.08);

            border:
                1px solid rgba(255,255,255,0.10);

            box-shadow:
                0 18px 45px rgba(0,0,0,0.20);
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
        }

        .attendance-box {
            padding: 18px;
            margin-bottom: 16px;

            border-radius: 14px;

            background:
                rgba(255,255,255,0.05);

            border:
                1px solid rgba(255,255,255,0.07);
        }

        .box-label {
            color: #64748b;
            font-size: 12px;
            margin-bottom: 8px;
        }

        .box-value {
            font-size: 18px;
            font-weight: 600;
        }

        .register-button {
            width: 100%;
            border: none;
            padding: 14px;

            border-radius: 11px;

            background:
                linear-gradient(
                    135deg,
                    #6366f1,
                    #4f46e5
                );

            color: white;
            font-size: 15px;
            font-weight: 600;

            cursor: pointer;
            transition: 0.25s;
        }

        .register-button:hover {
            transform: translateY(-2px);

            box-shadow:
                0 12px 30px rgba(79,70,229,0.40);
        }

        .register-button:disabled {
            opacity: 0.55;
            cursor: not-allowed;
            transform: none;
            box-shadow: none;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th,
        td {
            padding: 14px 12px;

            border-bottom:
                1px solid rgba(255,255,255,0.08);

            text-align: left;
        }

        th {
            color: #94a3b8;
        }

        .history-status {
            color: #86efac;
            font-weight: 600;
        }

        .empty {
            color: #64748b;
            text-align: center;
        }

        @media(max-width:900px) {

            .summary-grid {
                grid-template-columns: 1fr;
            }

            .main-grid {
                grid-template-columns: 1fr;
            }
        }

        @media(max-width:650px) {

            .page {
                padding: 20px;
            }

            .top-nav,
            .header {
                flex-direction: column;
                align-items: flex-start;
                gap: 18px;
            }
        }

    </style>

</head>

<body>

<div class="page">

    <div class="top-nav">

        <div class="brand">
            Staff<span>Portal</span>
        </div>

        <a href="Sdash.jsp"
           class="back-button">
            ← Back to Dashboard
        </a>

    </div>

    <div class="header">

        <div class="heading">

            <h1>
                Attendance
            </h1>

            <p>
                Register and review your attendance.
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

    <% if (!message.equals("")) { %>

        <div class="message">
            <%= message %>
        </div>

    <% } %>

    <div class="summary-grid">

        <div class="summary-card">

            <div class="summary-label">
                Today's Date
            </div>

            <div class="summary-value">
                <%= formattedDate %>
            </div>

        </div>

        <div class="summary-card">

            <div class="summary-label">
                Attendance Status
            </div>

            <% if(alreadyRegistered) { %>

                <div class="present-status">
                    <%= todayStatus %>
                </div>

            <% } else { %>

                <div class="pending-status">
                    Not Registered
                </div>

            <% } %>

        </div>

        <div class="summary-card">

            <div class="summary-label">
                Check-In Time
            </div>

            <div class="summary-value">
                <%= todayCheckIn %>
            </div>

        </div>

    </div>

    <div class="main-grid">

        <div class="panel">

            <div class="panel-title">
                Today's Attendance
            </div>

            <div class="panel-description">
                Register your attendance for today.
            </div>

            <div class="attendance-box">

                <div class="box-label">
                    Staff
                </div>

                <div class="box-value">
                    <%= Staff_Name %>
                </div>

            </div>

            <div class="attendance-box">

                <div class="box-label">
                    Date
                </div>

                <div class="box-value">
                    <%= formattedDate %>
                </div>

            </div>

            <div class="attendance-box">

                <div class="box-label">
                    Current Status
                </div>

                <div class="box-value">
                    <%= todayStatus %>
                </div>

            </div>

            <form action="attendance.jsp"
                  method="post">

                <input
                    type="hidden"
                    name="action"
                    value="register"
                >

                <button
                    type="submit"
                    class="register-button"

                    <% if(alreadyRegistered) { %>
                        disabled
                    <% } %>
                >

                    <% if(alreadyRegistered) { %>

                        ✓ Attendance Already Registered

                    <% } else { %>

                        ✓ Register Attendance

                    <% } %>

                </button>

            </form>

        </div>

        <div class="panel">

            <div class="panel-title">
                Attendance History
            </div>

            <div class="panel-description">
                Your recent attendance records.
            </div>

            <table>

                <thead>

                    <tr>
                        <th>Date</th>
                        <th>Check In</th>
                        <th>Status</th>
                    </tr>

                </thead>

                <tbody>

                <%

                    try {

                        psmt = con.prepareStatement(

                            "SELECT attendance_date, " +
                            "check_in_time, status " +
                            "FROM attendance " +
                            "WHERE staff_id = ? " +
                            "ORDER BY attendance_date DESC"
                        );

                        psmt.setInt(
                            1,
                            Staff_ID
                        );

                        rs =
                            psmt.executeQuery();

                        boolean recordsFound =
                            false;

                        while(rs.next()) {

                            recordsFound =
                                true;

                            Date attendanceDate =
                                rs.getDate("attendance_date");

                            Time attendanceTime =
                                rs.getTime("check_in_time");

                            String attendanceStatus =
                                rs.getString("status");

                            String displayTime =
                                "--";

                            if(attendanceTime != null) {

                                displayTime =
                                    attendanceTime
                                    .toLocalTime()
                                    .format(
                                        DateTimeFormatter.ofPattern(
                                            "hh:mm a"
                                        )
                                    );
                            }

                %>

                    <tr>

                        <td>
                            <%= attendanceDate %>
                        </td>

                        <td>
                            <%= displayTime %>
                        </td>

                        <td>

                            <span class="history-status">
                                <%= attendanceStatus %>
                            </span>

                        </td>

                    </tr>

                <%

                        }

                        if(!recordsFound) {

                %>

                    <tr>

                        <td colspan="3"
                            class="empty">

                            No attendance records available yet.

                        </td>

                    </tr>

                <%

                        }

                    } catch(Exception e) {

                %>

                    <tr>

                        <td colspan="3"
                            class="empty">

                            Unable to load attendance history.

                        </td>

                    </tr>

                <%

                    }

                %>

                </tbody>

            </table>

        </div>

    </div>

</div>

</body>

</html>