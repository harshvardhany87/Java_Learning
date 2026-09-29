<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    Integer Staff_ID = (Integer) session.getAttribute("Staff_ID");
    String Staff_Name = (String) session.getAttribute("Staff_Name");
    String Staff_Mobile = (String) session.getAttribute("Staff_Mobile");
    Integer Staff_Salary = (Integer) session.getAttribute("Staff_Salary");

    // Prevent direct access without login
    if (Staff_ID == null || Staff_Name == null) {
        response.sendRedirect("Login.html");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Staff Profile</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            min-height: 100vh;

            background:
                radial-gradient(
                    circle at top left,
                    rgba(99, 102, 241, 0.28),
                    transparent 32%
                ),
                radial-gradient(
                    circle at bottom right,
                    rgba(14, 165, 233, 0.20),
                    transparent 35%
                ),
                linear-gradient(
                    135deg,
                    #0f172a,
                    #111827,
                    #1e293b
                );

            color: white;
            overflow-x: hidden;
        }

        .page-wrapper {
            min-height: 100vh;
            padding: 40px;
        }

        /* TOP NAV */

        .top-nav {
            display: flex;
            justify-content: space-between;
            align-items: center;

            max-width: 1200px;
            margin: auto;

            margin-bottom: 30px;
        }

        .brand {
            font-size: 24px;
            font-weight: bold;
        }

        .brand span {
            color: #818cf8;
        }

        .back-btn {
            text-decoration: none;
            color: white;

            padding: 11px 18px;

            border-radius: 10px;

            background:
                rgba(255,255,255,0.08);

            border:
                1px solid rgba(255,255,255,0.10);

            transition: 0.25s;
        }

        .back-btn:visited {
            color: white;
        }

        .back-btn:hover {
            background:
                rgba(99,102,241,0.18);

            transform: translateY(-2px);
        }

        /* MAIN PROFILE */

        .profile-container {

            max-width: 1200px;

            margin: auto;

            display: grid;

            grid-template-columns:
                350px 1fr;

            gap: 28px;
        }

        /* LEFT PROFILE CARD */

        .profile-card {

            background:
                rgba(255,255,255,0.08);

            border:
                1px solid rgba(255,255,255,0.10);

            backdrop-filter:
                blur(18px);

            border-radius: 22px;

            padding: 35px;

            box-shadow:
                0 20px 50px rgba(0,0,0,0.25);

            text-align: center;
        }

        .avatar {

            width: 110px;
            height: 110px;

            margin:
                0 auto 20px;

            border-radius: 50%;

            display: flex;
            justify-content: center;
            align-items: center;

            font-size: 42px;
            font-weight: bold;

            background:
                linear-gradient(
                    135deg,
                    #6366f1,
                    #0ea5e9
                );

            box-shadow:
                0 15px 40px
                rgba(99,102,241,0.35);
        }

        .profile-name {

            font-size: 27px;

            font-weight: 700;

            margin-bottom: 6px;
        }

        .profile-role {

            color: #94a3b8;

            font-size: 14px;

            margin-bottom: 18px;
        }

        .status {

            display: inline-block;

            padding:
                7px 15px;

            border-radius: 30px;

            background:
                rgba(34,197,94,0.15);

            color: #86efac;

            font-size: 13px;

            font-weight: 600;

            margin-bottom: 25px;
        }

        .profile-divider {

            height: 1px;

            background:
                rgba(255,255,255,0.08);

            margin: 22px 0;
        }

        .profile-mini-info {

            text-align: left;
        }

        .mini-row {

            margin-bottom: 18px;
        }

        .mini-label {

            color: #64748b;

            font-size: 12px;

            text-transform: uppercase;

            letter-spacing: 0.6px;

            margin-bottom: 5px;
        }

        .mini-value {

            font-size: 15px;

            font-weight: 600;
        }

        /* RIGHT SIDE */

        .profile-details {

            display: flex;

            flex-direction: column;

            gap: 24px;
        }

        .section-card {

            background:
                rgba(255,255,255,0.08);

            border:
                1px solid rgba(255,255,255,0.10);

            backdrop-filter:
                blur(18px);

            border-radius: 22px;

            padding: 30px;

            box-shadow:
                0 20px 50px rgba(0,0,0,0.20);
        }

        .section-header {

            display: flex;

            justify-content: space-between;

            align-items: center;

            margin-bottom: 25px;
        }

        .section-title {

            font-size: 21px;

            font-weight: 700;
        }

        .section-subtitle {

            color: #64748b;

            font-size: 13px;
        }

        .info-grid {

            display: grid;

            grid-template-columns:
                repeat(2, 1fr);

            gap: 18px;
        }

        .info-box {

            padding: 18px;

            border-radius: 14px;

            background:
                rgba(255,255,255,0.05);

            border:
                1px solid rgba(255,255,255,0.07);

            transition: 0.2s;
        }

        .info-box:hover {

            background:
                rgba(99,102,241,0.10);

            transform:
                translateY(-2px);
        }

        .info-label {

            color: #64748b;

            font-size: 12px;

            text-transform: uppercase;

            margin-bottom: 8px;

            letter-spacing: 0.5px;
        }

        .info-value {

            font-size: 17px;

            font-weight: 600;
        }

        /* QUICK ACTIONS */

        .actions-grid {

            display: grid;

            grid-template-columns:
                repeat(3, 1fr);

            gap: 15px;
        }

        .action-link {

            text-decoration: none;

            color: white;

            padding: 17px;

            border-radius: 13px;

            background:
                rgba(255,255,255,0.05);

            border:
                1px solid rgba(255,255,255,0.07);

            transition: 0.25s;

            text-align: center;

            font-weight: 600;
        }

        .action-link:visited {
            color: white;
        }

        .action-link:hover {

            background:
                rgba(99,102,241,0.16);

            transform:
                translateY(-3px);
        }

        /* FOOTER MESSAGE */

        .account-note {

            margin-top: 10px;

            color: #64748b;

            font-size: 12px;

            line-height: 1.6;
        }

        /* RESPONSIVE */

        @media(max-width:900px) {

            .profile-container {

                grid-template-columns:
                    1fr;
            }

            .profile-card {

                max-width: 100%;
            }

        }

        @media(max-width:650px) {

            .page-wrapper {
                padding: 20px;
            }

            .top-nav {

                flex-direction:
                    column;

                align-items:
                    flex-start;

                gap: 18px;
            }

            .info-grid {

                grid-template-columns:
                    1fr;
            }

            .actions-grid {

                grid-template-columns:
                    1fr;
            }

        }

    </style>

</head>

<body>

<div class="page-wrapper">

    <!-- TOP BAR -->

    <div class="top-nav">

        <div class="brand">
            Staff<span>Portal</span>
        </div>

        <a href="Sdash.jsp"
           class="back-btn">
            ← Back to Dashboard
        </a>

    </div>

    <!-- PROFILE LAYOUT -->

    <div class="profile-container">

        <!-- LEFT PROFILE -->

        <div class="profile-card">

            <div class="avatar">

                <%= Staff_Name.substring(0,1).toUpperCase() %>

            </div>

            <div class="profile-name">

                <%= Staff_Name %>

            </div>

            <div class="profile-role">

                Staff Member

            </div>

            <div class="status">

                ● Active

            </div>

            <div class="profile-divider"></div>

            <div class="profile-mini-info">

                <div class="mini-row">

                    <div class="mini-label">
                        Staff ID
                    </div>

                    <div class="mini-value">
                        #<%= Staff_ID %>
                    </div>

                </div>

                <div class="mini-row">

                    <div class="mini-label">
                        Mobile Number
                    </div>

                    <div class="mini-value">
                        <%= Staff_Mobile %>
                    </div>

                </div>

                <div class="mini-row">

                    <div class="mini-label">
                        Monthly Salary
                    </div>

                    <div class="mini-value">

                        ¥ <%= String.format("%,d", Staff_Salary) %>

                    </div>

                </div>

            </div>

        </div>

        <!-- RIGHT DETAILS -->

        <div class="profile-details">

            <!-- PERSONAL INFORMATION -->

            <div class="section-card">

                <div class="section-header">

                    <div>

                        <div class="section-title">
                            Personal Information
                        </div>

                        <div class="section-subtitle">
                            Basic information associated with your account
                        </div>

                    </div>

                </div>

                <div class="info-grid">

                    <div class="info-box">

                        <div class="info-label">
                            Full Name
                        </div>

                        <div class="info-value">
                            <%= Staff_Name %>
                        </div>

                    </div>

                    <div class="info-box">

                        <div class="info-label">
                            Staff ID
                        </div>

                        <div class="info-value">
                            <%= Staff_ID %>
                        </div>

                    </div>

                    <div class="info-box">

                        <div class="info-label">
                            Mobile Number
                        </div>

                        <div class="info-value">
                            <%= Staff_Mobile %>
                        </div>

                    </div>

                    <div class="info-box">

                        <div class="info-label">
                            Account Status
                        </div>

                        <div class="info-value">
                            Active
                        </div>

                    </div>

                </div>

            </div>

            <!-- EMPLOYMENT INFORMATION -->

            <div class="section-card">

                <div class="section-header">

                    <div>

                        <div class="section-title">
                            Employment Information
                        </div>

                        <div class="section-subtitle">
                            Information related to your staff account
                        </div>

                    </div>

                </div>

                <div class="info-grid">

                    <div class="info-box">

                        <div class="info-label">
                            Monthly Salary
                        </div>

                        <div class="info-value">

                            ¥ <%= String.format("%,d", Staff_Salary) %>

                        </div>

                    </div>

                    <div class="info-box">

                        <div class="info-label">
                            Employment Type
                        </div>

                        <div class="info-value">
                            Full Time
                        </div>

                    </div>

                    <div class="info-box">

                        <div class="info-label">
                            Role
                        </div>

                        <div class="info-value">
                            Staff Member
                        </div>

                    </div>

                    <div class="info-box">

                        <div class="info-label">
                            Account Access
                        </div>

                        <div class="info-value">
                            Enabled
                        </div>

                    </div>

                </div>

            </div>

            <!-- QUICK ACTIONS -->

            <div class="section-card">

                <div class="section-header">

                    <div>

                        <div class="section-title">
                            Profile Actions
                        </div>

                        <div class="section-subtitle">
                            Manage your profile and account
                        </div>

                    </div>

                </div>

                <div class="actions-grid">

                    <a href="update.html"
                       class="action-link">

                        ⚙️ Update Information

                    </a>

                    <a href="Sdash.jsp"
                       class="action-link">

                        🏠 Dashboard

                    </a>

                    <a href="Login.html"
                       class="action-link">

                        🚪 Logout

                    </a>

                </div>

                <div class="account-note">

                    Your Staff ID is your permanent account identifier and
                    cannot be changed from the profile update page.

                </div>

            </div>

        </div>

    </div>

</div>

</body>

</html>