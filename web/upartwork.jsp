<%-- 
    Document   : upartwork
    Created on : 17 Sep, 2024, 1:34:04 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*;"%>
<%@page import="java.sql.DriverManager;"%>
<%@page import="java.sql.PreparedStatement;"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Virtual Art Gallery - Upload Artwork</title>
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
                flex-grow: 1; 
                display: flex;
                flex-direction: column;
                align-items: center;
                text-align: center;
                background-image: url('images/artwork.jpeg'); 
                background-size: cover;
                background-position: center;
                padding-top: 70px; 
                overflow-y: hidden; 
            }
            .upload-title {
                margin-bottom: 30px;
            }
            .upload-title h1 {
                font-size: 2.5rem;
                color: #ffffff;
            }
            .upload-form {
                background-color: rgba(0, 0, 0, 0.8); 
                color: white; 
                padding: 30px;
                border-radius: 15px;
                box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.3);
                max-width: 100%;
                width: 100%;
                margin: 0;
                display: flex;
                flex-direction: column;
                margin-top: -20px; 
            }
            .form-group {
                margin-bottom: 20px;
                display: flex;
                align-items: center;
                width: 100%; 
            }
            .form-group label {
                font-size: 1.1rem;
                font-weight: bold;
                margin-right: 10px; 
                min-width: 200px; 
                text-align: right;
            }
            .form-group input, .form-group textarea {
                font-size: 1rem;
                flex: 1;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: rgba(255, 255, 255, 0.2); 
                color: white;
            }
            .form-group textarea {
                resize: vertical; 
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
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
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
            <div class="upload-title">
                <h1>Upload Your Artwork</h1>
            </div>

            <!-- Upload Form -->
            <div class="upload-form">
                <form action="upartwork.jsp" method="post">
                    <div class="form-group">
                        <label for="title">Artwork Title:</label>
                        <input type="text" id="title" name="title" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="artist">Artist Name:</label>
                        <input type="text" id="artist" name="artist" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="description">Artwork Description:</label>
                        <textarea id="description" name="description" rows="4" class="form-control"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="image">Upload Image:</label>
                        <input type="file" id="image" name="image" class="form-control-file" accept="image/*">
                    </div>

                    <!-- User Details -->
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" id="name" name="name" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="contact">Contact Number:</label>
                        <input type="text" id="contact" name="contact" class="form-control">
                    </div>

                    <button type="submit" name="b1" class="btn btn-primary">Submit Artwork</button>
                </form>
            </div>
        </div>

        <!-- Footer -->
        <footer class="footer">
            <p>&copy; 2025 Virtual Art Gallery. All rights reserved.</p>
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


        <%--The Main Logic of Database starts from here--%>
        <%
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/virtualartgallery", "uday", "1234");

                String atitle = request.getParameter("title");
                String aname = request.getParameter("artist");
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String contactStr = request.getParameter("contact");

                int cnumber = 0;
                if (contactStr != null && !contactStr.isEmpty()) {
                    cnumber = Integer.parseInt(contactStr);
                }

                if (request.getParameter("b1") != null) {
                    PreparedStatement ps = c.prepareStatement("insert into gallery (atitle, aname, name, email, cnumber) VALUES (?,?,?,?,?)");
                    ps.setString(1, atitle);
                    ps.setString(2, aname);
                    ps.setString(3, name);
                    ps.setString(4, email);
                    ps.setInt(5, cnumber);

                    int i = ps.executeUpdate();
                    if (i > 0) {
                        out.println("Data Saved Successfully");
                    } else {
                        out.println("Failed to save data");
                    }
                }
            } catch (NumberFormatException e) {
                out.println("Invalid contact number.");
            } catch (SQLException e) {
                out.println("SQL Error: " + e.getMessage());
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        %>



    </body>
</html>

