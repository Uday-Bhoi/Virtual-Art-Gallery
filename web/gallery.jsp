<%-- 
    Document   : newjsp
    Created on : 17 Sep, 2024, 1:24:02 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Virtual Art Gallery - Gallery</title>
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
            <!-- Gallery Title -->
            <div class="gallery-title">
                <h1>Artworks</h1>
            </div>
            <!-- Gallery Preview -->
            <div class="gallery-preview">
                <!-- Gallery Item 1 -->
                <div class="gallery-item">
                    <img src="images/strarrynight.jpeg" alt="Starry Night">
                    <div class="info">
                        <h5>Starry Night</h5>
                        <p>Vincent van Gogh</p>
                        <p>A mesmerizing portrayal of a swirling night sky over a quiet town, reflecting van Gogh's intense emotion and vivid imagination.</p>
                    </div>
                </div>
                <!-- Gallery Item 2 -->
                <div class="gallery-item">
                    <img src="images/the-persistence-of-memory-1931.jpg" alt="The Persistence of Memory">
                    <div class="info">
                        <h5>The Persistence of Memory</h5>
                        <p>Salvador Dalí</p>
                        <p>A surrealistic piece famous for its melting clocks, representing the fluidity and distortion of time in dreams.</p>
                    </div>
                </div>
                <!-- Gallery Item 3 -->
                <div class="gallery-item">
                    <img src="images/thescream.jpg" alt="The Scream">
                    <div class="info">
                        <h5>The Scream</h5>
                        <p>Edvard Munch</p>
                        <p>This iconic expressionist painting depicts a figure in despair against a turbulent sky, symbolizing existential angst.</p>
                    </div>
                </div>
                <!-- Gallery Item 4 -->
                <div class="gallery-item">
                    <img src="images/thegirlwithpearlearring.jpeg" alt="Girl with a Pearl Earring">
                    <div class="info">
                        <h5>Girl with a Pearl Earring</h5>
                        <p>Johannes Vermeer</p>
                        <p>A captivating portrayal of a young woman with a mysterious expression, often called the 'Mona Lisa of the North.'</p>
                    </div>
                </div>
                <!-- Gallery Item 5 -->
                <div class="gallery-item">
                    <img src="images/monalisa.jpeg" alt="Mona Lisa">
                    <div class="info">
                        <h5>Mona Lisa</h5>
                        <p>Leonardo da Vinci</p>
                        <p>The world's most famous portrait, known for its subject's enigmatic smile and da Vinci's masterful technique.</p>
                    </div>
                </div>
                <!-- Gallery Item 6 -->
                <div class="gallery-item">
                    <img src="images/creationofadam.jpg" alt="The Creation of Adam">
                    <div class="info">
                        <h5>The Creation of Adam</h5>
                        <p>Michelangelo</p>
                        <p>A monumental fresco from the Sistine Chapel, depicting God giving life to the first man, Adam.</p>
                    </div>
                </div>
                <!-- Gallery Item 7 -->
                <div class="gallery-item">
                    <img src="images/waterlilies.jpg" alt="Water Lilies">
                    <div class="info">
                        <h5>Water Lilies</h5>
                        <p>Claude Monet</p>
                        <p>Monet's famous series of paintings capturing the tranquil beauty of his water garden at Giverny, filled with reflections and light.</p>
                    </div>
                </div>
                <!-- Gallery Item 8 -->
                <div class="gallery-item">
                    <img src="images/thebirthofvenus.jpeg" alt="The Birth of Venus">
                    <div class="info">
                        <h5>The Birth of Venus</h5>
                        <p>Sandro Botticelli</p>
                        <p>A timeless depiction of Venus emerging from the sea, symbolizing beauty and love in classical mythology.</p>
                    </div>
                </div>
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

