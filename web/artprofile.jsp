<%-- 
    Document   : artprofile
    Created on : 17 Sep, 2024, 1:41:38 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Virtual Art Gallery - Artist Profiles</title>
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
            background-image: url('images/artwork.jpeg'); 
            background-size: cover;
            background-position: center;
            padding-top: 70px; 
            overflow-y: auto; 
        }
        .artist-profile {
            background-color: rgba(0, 0, 0, 0.8); 
            color: white; 
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.5);
            max-width: 1200px;
            width: 100%;
            margin: 20px auto;
            overflow: hidden; 
            display: flex; 
            align-items: center; 
        }
        .artist-profile img {
            max-width: 300px; 
            border-radius: 10px;
            margin-right: 20px; 
            flex-shrink: 0; 
        }
        .artist-profile h1 {
            font-size: 2.5rem;
            color: #fff;
            margin-bottom: 20px;
        }
        .artist-profile p {
            font-size: 1.2rem;
            color: #ddd;
            line-height: 1.6;
            margin-bottom: 20px; 
        }
        .gallery {
            display: flex;
            flex-wrap: wrap;
            gap: 20px; 
            margin-top: 20px;
        }
        .gallery img {
            width: 200px;
            height: auto;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.3);
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
            </ul>
        </div>
    </nav>

    <!-- Main Content Area -->
    <div class="main-content">
        <!-- Artist Profile: Frida Kahlo -->
        <div class="artist-profile">
            <img src="images/frida.jpg" alt="Frida Kahlo">
            <div>
                <h1>Frida Kahlo</h1>
                <p>Frida Kahlo (1907-1954) was a Mexican painter known for her unique style that often incorporated vibrant colors and surreal elements. Her works are deeply personal, exploring themes of identity, postcolonialism, gender, class, and race in Mexican society. Kahlo's art has gained widespread acclaim for its uncompromising portrayal of her life experiences and her innovative use of folk art and symbolism.</p>
                <div class="gallery">
                    <img src="images/fridapaint1.jpeg" alt="Frida Painting 1">
                    <img src="images/fridapaint2.jpeg" alt="Frida Painting 2">
                    <img src="images/fridapaint3.jpeg" alt="Frida Painting 3">
                    <!-- Add more artworks as needed -->
                </div>
            </div>
        </div>

        <!-- Artist Profile: Pablo Picasso -->
        <div class="artist-profile">
            <img src="images/pablo.jpg" alt="Pablo Picasso">
            <div>
                <h1>Pablo Picasso</h1>
                <p>Pablo Picasso (1881-1973) was a Spanish painter, sculptor, printmaker, and one of the most influential artists of the 20th century. He is best known for co-founding the Cubist movement and for his extensive body of work that includes paintings, sculptures, and ceramics. Picasso's innovative use of form and perspective changed the course of modern art.</p>
                <div class="gallery">
                    <img src="images/pablopaint1.jpeg" alt="Picasso Painting 1">
                    <img src="images/pablopaint2.jpg" alt="Picasso Painting 2">
                    <img src="images/pablopaint3.jpeg" alt="Picasso Painting 3">
                    <!-- Add more artworks as needed -->
                </div>
            </div>
        </div>

        <!-- Artist Profile: Vincent van Gogh -->
        <div class="artist-profile">
            <img src="images/vincent.jpg" alt="Vincent van Gogh">
            <div>
                <h1>Vincent van Gogh</h1>
                <p>Vincent van Gogh (1853-1890) was a Dutch Post-Impressionist painter whose work had a major impact on 20th-century art. Known for his bold colors and expressive brushwork, Van Gogh's paintings include some of the most recognizable artworks in the world, such as "Starry Night" and "Sunflowers." His work is celebrated for its emotional depth and vibrant use of color.</p>
                <div class="gallery">
                    <img src="images/vincentpaint1.jpg" alt="Van Gogh Painting 1">
                    <img src="images/vincentpaint2.jpg" alt="Van Gogh Painting 2">
                    <img src="images/vincentpaint3.jpg" alt="Van Gogh Painting 3">
                    <!-- Add more artworks as needed -->
                </div>
            </div>
        </div>

        <!-- Artist Profile: Claude Monet -->
        <div class="artist-profile">
            <img src="images/claude.jpg" alt="Claude Monet">
            <div>
                <h1>Claude Monet</h1>
                <p>Claude Monet (1840-1926) was a French painter and a founder of Impressionism. His work is characterized by his use of light and color to capture fleeting moments and the effects of natural light. Monet's most famous works include his series on water lilies and the Rouen Cathedral.</p>
                <div class="gallery">
                    <img src="images/claudepaint1.jpg" alt="Monet Painting 1">
                    <img src="images/claudepaint2.jpg" alt="Monet Painting 2">
                    <img src="images/claudepaint3.jpg" alt="Monet Painting 3">
                    <!-- Add more artworks as needed -->
                </div>
            </div>
        </div>

        <!-- Artist Profile: Georgia O'Keeffe -->
        <div class="artist-profile">
            <img src="images/georgia.jpeg" alt="Georgia O'Keeffe">
            <div>
                <h1>Georgia O'Keeffe</h1>
                <p>Georgia O'Keeffe (1887-1986) was an American artist known for her paintings of enlarged flowers, skyscrapers, and New Mexico landscapes. Her work is noted for its abstracted forms and use of vibrant colors, reflecting her unique perspective and style.</p>
                <div class="gallery">
                    <img src="images/georgiapaint1.jpeg" alt="O'Keeffe Painting 1">
                    <img src="images/georgiapaint2.jpeg" alt="O'Keeffe Painting 2">
                    <img src="images/georgiapaint3.jpeg" alt="O'Keeffe Painting 3">
                    <!-- Add more artworks as needed -->
                </div>
            </div>
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
</body>
</html>
