<%--
    Document   : register
    Created on : 31 Jan, 2025, 6:25:53 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*;"%>
<%@page import="java.sql.DriverManager;"%>
<%@page import="java.sql.PreparedStatement;"%>
<%@ page import="java.sql.*, java.security.MessageDigest, p4.SHAHasher" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Virtual Art Gallery - Register</title>
        <!-- Bootstrap CSS -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
        <style>
            /* Custom Styles */
            html, body {
                height: 100%;
                margin: 0;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }

            .header {
                width: 100%;
                background-color: rgba(0, 0, 0, 0.7); /* Transparent background */
                color: white;
                text-align: center;
                padding: 15px 0;
                position: fixed;
                top: 0;
                left: 0;
                z-index: 1000;
            }
            .header h1 {
                margin: 0;
                font-size: 2.2rem;
            }
            body {
                display: flex;
                flex-direction: column;
            }

            .main-content {
                flex-grow: 1; 
                display: flex;
                flex-direction: column;
                align-items: center;
                text-align: center;
                background-image: url('images/artwork.jpeg'); 
                background-size: cover;
                background-position: center;
                padding-top: 70px; 
                overflow-y: auto; 
            }

            .footer {
                background-color: #000000;
                color: white;
                text-align: center;
                padding: 15px 0;
            }
            .footer p {
                margin: 0;
            }

            /* Main Content Styling */
            .main-content {
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100vh;
                background-image: url('images/artwork.jpeg');
                background-size: cover;
                background-position: center;
            }

            /* Registration Container Styling */
            .register-container {
                background-color: rgba(0, 0, 0, 0.8);
                color: white;
                padding: 30px;
                border-radius: 15px;
                box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.5);
                width: 100%;
                max-width: 400px;
                text-align: center;
            }

            /* Form Input Fields */
            .register-container .form-group {
                margin-bottom: 15px;
                text-align: left;
            }

            .register-container label {
                font-weight: bold;
            }

            .register-container input {
                width: 100%;
                padding: 10px;
                border-radius: 5px;
                border: 1px solid #ccc;
            }

            /* Button Styling */
            .register-container .btn {
                width: 100%;
                padding: 10px;
                font-size: 16px;
                border-radius: 5px;
            }

            /* Login Link */
            .login-link {
                margin-top: 10px;
                color: white;
            }

            .login-link a {
                color: #00c3ff;
                text-decoration: none;
            }

            .login-link a:hover {
                text-decoration: underline;
            }


        </style>
    </head>
    <body>

        <!-- Header -->
        <header class="header">
            <h1>Virtual Art Gallery</h1>
        </header>

        <!-- Main Content Area -->
        <div class="main-content">
            <div class="register-container">
                <h1>Register</h1>
                <p>Please fill out the form to create an account.</p>

                <form method="post" action="register.jsp">
                    <div class="form-group">
                        <label for="name">Full Name</label>
                        <input type="text" id="name" name="name" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email Address</label>
                        <input type="email" id="email" name="email" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="confirmPassword">Confirm Password</label>
                        <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" required>
                    </div>

                    <%
                        if (request.getMethod().equalsIgnoreCase("POST")) {
                            String name = request.getParameter("name");
                            String email = request.getParameter("email");
                            String password = request.getParameter("password");
                            String confirmPassword = request.getParameter("confirmPassword");
                            String errorMsg = null;

                            if (name != null && !name.isEmpty() && email != null && !email.isEmpty()
                                    && password != null && !password.isEmpty() && confirmPassword != null && !confirmPassword.isEmpty()) {

                                if (!password.equals(confirmPassword)) {
                                    errorMsg = "Passwords do not match.";
                                } else {
                                    try {
                                        // Hash the password using SHA-256
                                        String hashedPassword = SHAHasher.hashPassword(password);
                                        String hashedConfirmPassword = SHAHasher.hashPassword(confirmPassword);

                                        // Database connection
                                        String jdbcUrl = "jdbc:derby://localhost:1527/registerdb";
                                        String dbUser = "app";
                                        String dbPass = "app";
                                        Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);

                                        // Insert the user registration details into the database
                                        String sql = "INSERT INTO registerdata (name, email, password,cpassword) VALUES (? ,?, ?, ?)";
                                        PreparedStatement pstmt = conn.prepareStatement(sql);
                                        pstmt.setString(1, name);
                                        pstmt.setString(2, email);
                                        pstmt.setString(3, hashedPassword);
                                        pstmt.setString(4, hashedConfirmPassword);

                                        int result = pstmt.executeUpdate();

                                        if (result > 0) {
                                            out.println("<div class='alert alert-success'>Registration successful!</div>");
                                        } else {
                                            errorMsg = "There was an error with the registration.";
                                        }

                                        conn.close();
                                    } catch (Exception e) {
                                        errorMsg = "Database error: " + e.getMessage();
                                    }
                                }
                            } else {
                                errorMsg = "All fields are required.";
                            }

                            if (errorMsg != null) {
                                out.println("<div class='alert alert-danger'>" + errorMsg + "</div>");
                            }
                        }
                    %>

                    <button type="submit" class="btn btn-primary btn-block">Register</button>
                </form>
            </div>
        </div>



        <!-- Footer -->
        <footer class="footer">
            <p>&copy; 2025 Virtual Art Gallery. All rights reserved.</p>
            <p>Follow us on: 
                <a href="#" class="text-white">Facebook</a> | 
                <a href="#" class="text-white">Twitter</a> | 
                <a href="#" class="text-white">Instagram</a>
            </p>
        </footer>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>

