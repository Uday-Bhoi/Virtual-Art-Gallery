<%-- 
    Document   : newjsp
    Created on : 17 Sep, 2024, 3:02:01 AM
    Author     : acer
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Virtual Art Gallery - Admin Login</title>
        <!-- Bootstrap CSS -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
        <style>
            /* Custom Styles */
            html, body {
                margin: 0;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                overflow: hidden; 
            }
            body {
                display: flex;
                flex-direction: column;
                min-height: 100vh; 
                background-image: url('images/artwork.jpeg'); 
                background-size: cover;
                background-position: center;
            }
            .navbar {
                background-color: rgba(0, 0, 0, 0.8); 
            }
            .navbar-brand {
                font-size: 1.75rem;
                font-weight: bold;
            }
            .navbar-nav {
                flex-direction: row;
                justify-content: center;
                width: 100%;
            }
            .navbar-nav .nav-item {
                margin-left: 15px;
                margin-right: 15px;
            }
            .navbar-nav .nav-link {
                color: white !important;
                font-size: 1.1rem;
            }
            .navbar-nav .nav-link:hover {
                color: #ddd !important;
            }
            .main-content {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                flex: 1; 
                padding: 20px;
            }
            .login-form {
                background-color: rgba(0, 0, 0, 0.8); 
                color: white; 
                padding: 30px;
                border-radius: 15px;
                box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.5);
                max-width: 400px;
                width: 100%;
            }
            .login-form h2 {
                margin-bottom: 20px;
            }
            .login-form .form-group {
                margin-bottom: 15px;
            }
            .login-form .btn {
                margin-top: 10px;
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
            .footer a {
                color: white;
            }
        </style>
    </head>
    <body>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
            <a class="navbar-brand" href="#">Virtual Art Gallery</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="gallery.jsp">Gallery</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="upartwork.jsp">Upload Artwork</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="artprofile.jsp">Artist Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="admin.jsp">Admin Dashboard</a>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- Main Content Area -->
        <div class="main-content">
            <!-- Login Form -->
            <div class="login-form">
                <h2>Admin Login</h2>
                <form id="loginForm" method="post" action="admin_login.jsp">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" id="username" name="username" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" class="form-control" required>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">Login</button>
                </form>
            </div>
        </div>

        <!-- Footer -->
        <footer class="footer">
            <p>&copy; 2024 Virtual Art Gallery. All rights reserved.</p>
            <p>Follow us on: 
                <a href="#">Facebook</a> | 
                <a href="#">Twitter</a> | 
                <a href="#">Instagram</a>
            </p>
        </footer>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>


        <%@ page import="java.io.IOException" %>
        <%@ page import="javax.servlet.RequestDispatcher" %>
        <%@ page import="javax.servlet.ServletException" %>
        <%@ page import="javax.servlet.http.HttpServletRequest" %>
        <%@ page import="javax.servlet.http.HttpServletResponse" %>
        <%@ page import="javax.servlet.http.HttpSession" %>

        <%
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String validUsername = "admin";
            String validPassword = "admin";

            if (username != null && password != null && username.equals(validUsername) && password.equals(validPassword)) {
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard.jsp");
                dispatcher.forward(request, response);
            } else {
                request.setAttribute("loginError", "Invalid username or password.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("admin.jsp"); // Redirect to login page
                dispatcher.forward(request, response);
            }
        %>


    </body>
</html>


