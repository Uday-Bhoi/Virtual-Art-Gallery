<%-- 
    Document   : authenticate
    Created on : 31 Jan, 2025, 6:40:27 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*;" %>
<%@ page import="java.sql.DriverManager;" %>
<%@ page import="java.security.Key;" %>
<%@ page import="javax.crypto.Cipher;" %>
<%@ page import="javax.crypto.KeyGenerator;" %>
<%@ page import="javax.crypto.SecretKeyFactory;" %>
<%@ page import="javax.crypto.spec.SecretKeySpec;" %>
<%@ page import="p1.EncryptionUtil" %> <!-- Add this import -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Virtual Art Gallery - Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        /* Custom Styles */
        html, body {
            height: 100%;
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        body {
            display: flex;
            flex-direction: column;
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

        /* Login Container Styling */
        .login-container {
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
        .login-container .form-group {
            margin-bottom: 15px;
            text-align: left;
        }

        .login-container label {
            font-weight: bold;
        }

        .login-container input {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        /* Button Styling */
        .login-container .btn {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border-radius: 5px;
        }

        /* Register Link */
        .register-link {
            margin-top: 10px;
            color: white;
        }

        .register-link a {
            color: #00c3ff;
            text-decoration: none;
        }

        .register-link a:hover {
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
        <div class="login-container">
            <h1>User Login</h1>
            <form method="post" action="authenticate.jsp">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" class="form-control" required>
                </div>

                <% 
                    // JDBC Code Starts here
                    if (request.getParameter("username") != null && request.getParameter("password") != null) {
                        // Load the JDBC driver
                        Class.forName("org.apache.derby.jdbc.ClientDriver");

                        // Establish connection to the database
                        Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/logindb", "app", "app");

                        // Retrieve the username and password from the form submission
                        String username = request.getParameter("username");
                        String password = request.getParameter("password");

                        // Encrypt username and password using EncryptionUtil
                        String encryptedUsername = EncryptionUtil.encrypt(username);
                        String encryptedPassword = EncryptionUtil.encrypt(password);

                        // SQL query to insert data into the 'logindata' table
                        PreparedStatement ps = c.prepareStatement("INSERT INTO logindata (username, password) VALUES (?, ?)");

                        // Set the encrypted username and password in the query
                        ps.setString(1, username);
                        ps.setString(2, encryptedPassword); 

                        // Execute the query
                        int i = ps.executeUpdate();

                        // Check if the data was successfully inserted
                        if (i > 0) {
                            out.println("<div class='alert alert-success'>User Logged in Successfully</div>");
                        } else {
                            out.println("<div class='alert alert-danger'>Failed to Log the user</div>");
                        }

                        // Close the database connection
                        c.close();
                    }
                %>

                <% if (request.getAttribute("errorMsg") != null) { %>
                <div class="alert alert-danger"><%= request.getAttribute("errorMsg") %></div>
                <% } %>

                <button type="submit" name="login" class="btn btn-primary"><a href="gallery.jsp" class="btn btn-primary">Login</a></button>
            </form>
            <p class="register-link">Don't have an account? <a href="register.jsp">Register here</a></p>
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