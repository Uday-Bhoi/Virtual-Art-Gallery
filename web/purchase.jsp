<%-- 
    Document   : purchase
    Created on : 31 Jan, 2025, 6:52:28 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*;"%>
<%@page import="java.sql.DriverManager;"%>
<%@page import="java.sql.PreparedStatement;"%>
<%@ page import="java.security.*, javax.crypto.*, java.util.Base64, p2.RSA" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Virtual Art Gallery - Purchase</title>
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
            .navbar {
                background-color: rgba(0, 0, 0, 0.8); /* Darker transparent background */
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
            .gallery-title {
                margin-bottom: 30px;
            }
            .gallery-title h1 {
                font-size: 2.5rem;
                color: #ffffff;
            }
            .gallery-preview {
                display: flex;
                justify-content: center;
                flex-wrap: wrap;
            }
            .gallery-item {
                margin: 15px;
                border-radius: 10px;
                overflow: hidden;
                background-color: #333;
                width: 300px; 
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.5);
                display: flex;
                flex-direction: column;
            }
            .gallery-item img {
                width: 100%;
                height: 200px; 
                object-fit: cover; 
                display: block;
            }
            .gallery-item .info {
                padding: 10px;
                color: white;
                text-align: center;
                flex-grow: 1; 
            }
            .gallery-item .info h5 {
                margin: 10px 0;
                font-size: 1.25rem;
            }
            .gallery-item .info p {
                margin: 0;
                font-size: 1rem;
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

            /* Buy Artwork Container Styling */
            .buy-artwork-container {
                background-color: rgba(0, 0, 0, 0.7);
                color: white;
                padding: 40px;
                border-radius: 15px;
                box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.5);
                width: 100%;
                max-width: 500px;
                text-align: center;
            }

            /* Form Input Fields */
            .buy-artwork-container .form-group {
                margin-bottom: 20px;
                text-align: left;
            }

            .buy-artwork-container label {
                font-weight: bold;
            }

            .buy-artwork-container input {
                width: 100%;
                padding: 12px;
                border-radius: 5px;
                border: 1px solid #ccc;
            }

            /* Button Styling */
            .buy-artwork-container .btn {
                width: 100%;
                padding: 12px;
                font-size: 16px;
                border-radius: 5px;
            }

            /* Error Message */
            .buy-artwork-container .alert {
                margin-top: 15px;
                font-size: 14px;
                padding: 10px;
            }

            /* Styling the Buy Artwork Section */
            .buy-artwork-container h1 {
                margin-bottom: 20px;
                font-size: 2.5rem;
            }

            .buy-artwork-container p {
                margin-bottom: 30px;
                font-size: 1.2rem;
                color: #ccc;
            }
            
            .btn-primary {
                background-color: #000000;
                border: none;
                border-radius: 5px;
                padding: 10px 20px;
                font-size: 1.1rem;
                color: white; 
            }
            .btn-primary:hover {
                background-color: #333333; 
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
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="index.html">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="gallery.jsp">Gallery</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="artprofile.jsp">Artist Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="upartwork.jsp">Upload Work</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="purchase.jsp">Purchase Work</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contact.jsp">Contact</a>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- Main Content Area -->
        <div class="main-content">
            <div class="buy-artwork-container">
                <h1>Buy Artwork</h1>
                <p>Purchase this beautiful artwork for only <strong>$150</strong>.</p>

                <form method="post" action="purchase.jsp">
                    <div class="form-group">
                        <label for="name">Full Name</label>
                        <input type="text" id="name" name="name" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email Address</label>
                        <input type="email" id="email" name="email" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="cardNumber">Credit Card Number</label>
                        <input type="text" id="cardNumber" name="cardNumber" class="form-control" maxlength="16">
                    </div>
                    <div class="form-group">
                        <label for="expiryDate">Expiry Date (MM/YY)</label>
                        <input type="text" id="expiryDate" name="expiryDate" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="cvv">CVV</label>
                        <input type="text" id="cvv" name="cvv" class="form-control" maxlength="3">
                    </div>

                    <% 
                    if (request.getMethod().equalsIgnoreCase("POST")) {
                        String name = request.getParameter("name");
                        String email = request.getParameter("email");
                        String cardNumber = request.getParameter("cardNumber");
                        String expiryDate = request.getParameter("expiryDate");
                        String cvv = request.getParameter("cvv");
                        String errorMsg = null;

                        if (name != null && !name.isEmpty() && email != null && !email.isEmpty()) {
                            try {
                                // Initialize RSA encryption
                                RSA rsa = new RSA();
                                String encryptedCardNumber = rsa.encrypt(cardNumber);
                                String encryptedExpiryDate =rsa.encrypt(expiryDate);
                                String encryptedCvv = rsa.encrypt(cvv);
                                
                                // Database connection
                                String jdbcUrl = "jdbc:derby://localhost:1527/purchasedb";
                                String dbUser = "app";
                                String dbPass = "app";
                                Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);

                                // Insert the purchase details into the database
                                String sql = "INSERT INTO purchasedata (name, email, carnumber, expirydate, cvv) VALUES (?, ?, ?, ?, ?)";
                                PreparedStatement pstmt = conn.prepareStatement(sql);
                                pstmt.setString(1, name);
                                pstmt.setString(2, email);
                                pstmt.setString(3, encryptedCardNumber);
                                pstmt.setString(4, encryptedExpiryDate);
                                pstmt.setString(5, encryptedCvv);

                                int result = pstmt.executeUpdate();

                                if (result > 0) {
                                    out.println("<div class='alert alert-success'>Purchase successful!</div>");
                                } else {
                                    errorMsg = "There was an error with the purchase.";
                                }

                                conn.close();
                            } catch (Exception e) {
                                errorMsg = "Encryption or database error: " + e.getMessage();
                            }
                        } else {
                            errorMsg = "All fields are required.";
                        }

                        if (errorMsg != null) {
                            out.println("<div class='alert alert-danger'>" + errorMsg + "</div>");
                        }
                    }
                    %>

                    <button type="submit" class="btn btn-primary btn-block">Complete Purchase</button>
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