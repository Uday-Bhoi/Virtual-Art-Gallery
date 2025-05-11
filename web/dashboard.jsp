<%-- 
    Document   : dashboard
    Created on : 17 Sep, 2024, 3:23:55 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*;"%>
<%@page import="java.sql.DriverManager;"%>
<%@page import="java.sql.PreparedStatement;"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard</title>
        <!-- Bootstrap CSS -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
        <style>
            /* Custom Styles */
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
            .admin-section {
                background-color: rgba(0, 0, 0, 0.8); 
                color: white; 
                padding: 20px;
                border-radius: 15px;
                box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.5);
                max-width: 1200px;
                margin: 20px auto;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }
            th, td {
                padding: 10px;
                border: 1px solid white;
                text-align: left;
            }
            th {
                background-color: #333;
            }
            .admin-buttons button {
                margin: 10px;
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
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
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
                    <li class="nav-item">
                        <a class="nav-link" href="admin.jsp">Admin Dashboard</a>
                    </li>
                </ul>
            </div>
        </nav>


        <!-- Main Content Area -->
        <div class="main-content">
            <div class="admin-section" id="adminSection">
                <!-- Table with Dynamic Data -->
                <table>
                    <thead>
                        <tr>
                            <th>Artwork Title</th>
                            <th>Artist Name</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Contact Number</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            try {
                                Class.forName("org.apache.derby.jdbc.ClientDriver");
                                Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/virtualartgallery", "uday", "1234");

                                // Select all records
                                PreparedStatement ps = c.prepareStatement("SELECT * FROM gallery");
                                ResultSet rs = ps.executeQuery();

                                while (rs.next()) {
                        %>
                        <tr>
                            <td><%= rs.getString("atitle")%></td>
                            <td><%= rs.getString("aname")%></td>
                            <td><%= rs.getString("name")%></td>
                            <td><%= rs.getString("email")%></td>
                            <td><%= rs.getInt("cnumber")%></td>
                        </tr>
                        <%
                                }
                            } catch (SQLException e) {
                                out.println("SQL Error: " + e.getMessage());
                            } catch (Exception e) {
                                out.println("Error: " + e.getMessage());
                            }
                        %>
                    </tbody>
                </table>

                <!-- Admin Buttons -->
                <div class="admin-buttons">
                    <form method="post" action="admin.jsp">
                        <input type="hidden" name="select" value="true">
                        <button type="submit" class="btn btn-success">Select</button>
                    </form>
                    <form method="post" action="admin.jsp">
                        <input type="hidden" name="update" value="true">
                        <button type="submit" class="btn btn-warning">Update</button>
                    </form>
                    <form method="post" action="admin.jsp">
                        <input type="hidden" name="delete" value="true">
                        <button type="submit" class="btn btn-danger">Delete</button>
                    </form>
                </div>
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
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>


        <%
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/virtualartgallery", "uday", "1234");

                String atitle = request.getParameter("title");
                String aname = request.getParameter("artist");
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String contactStr = request.getParameter("contact");
                String idStr = request.getParameter("id");

                int cnumber = 0;
                if (contactStr != null && !contactStr.isEmpty()) {
                    cnumber = Integer.parseInt(contactStr);
                }

                if (request.getParameter("update") != null) {
                    PreparedStatement ps = c.prepareStatement("UPDATE gallery SET atitle = ?, aname = ?, name = ?, email = ?, cnumber = ? WHERE name = ?");
                    ps.setString(1, atitle);
                    ps.setString(2, aname);
                    ps.setString(3, name);
                    ps.setString(4, email);
                    ps.setInt(5, cnumber);
                    ps.setString(6, name);

                    int i = ps.executeUpdate();
                    if (i > 0) {
                        out.println("Data Updated Successfully");
                    } else {
                        out.println("Failed to update data");
                    }
                }
                if (request.getParameter("delete") != null) {
                    PreparedStatement ps = c.prepareStatement("DELETE FROM gallery WHERE name = ?");
                    ps.setString(1, name);

                    int i = ps.executeUpdate();
                    if (i > 0) {
                        out.println("Data Deleted Successfully");
                    } else {
                        out.println("Failed to delete data");
                    }
                }
            } catch (NumberFormatException e) {
                out.println("Invalid contact number or ID.");
            } catch (SQLException e) {
                out.println("SQL Error: " + e.getMessage());
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        %>


    </body>
</html>
