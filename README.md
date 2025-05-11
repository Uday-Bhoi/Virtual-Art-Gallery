# 🎨 Virtual Art Gallery

**Virtual Art Gallery** is a secure, user-friendly online platform that enables users to **explore**, **upload**, and **purchase** digital artworks while ensuring high levels of **data privacy**, **authentication**, and **encryption**. It is built using **JSP**, **HTML**, **CSS**, and **JDBC**, with extensive use of Java's **cryptography libraries** (SHA-256, AES, RSA, HMAC) to safeguard user data and transactional operations.

This project was developed as part of academic coursework and showcases both front-end interface design and robust back-end security practices.

---

## 📌 Features

### 🌐 General Functionality

- 🖼️ **Artwork Display**
  - Users can browse a curated gallery of static and user-submitted artworks.
  - Artworks are displayed with titles, artist names, and descriptions.

- 👩‍🎨 **Artist Profiles**
  - Showcases detailed profiles of well-known artists with images and biographical summaries.
  - Includes individual galleries of their work.

- ⬆️ **Upload Artwork**
  - Registered users can upload their own artworks via `upartwork.jsp`.
  - Inputs include title, description, image, and contact information.

- 📥 **Admin Dashboard**
  - Basic admin interface to manage artwork entries and user submissions.
  - Accessible only to authorized personnel.

- 💬 **Contact Form**
  - Users can send inquiries or feedback through a contact form.
  - Data is stored with message integrity checks.

---

### 🔐 Security Enhancements (Information & Network Security)

Implemented to address data breaches, impersonation, and information tampering:

- 🔒 **Secure Password Storage** – `SHA-256`
  - Passwords are hashed before being stored in the database.
  - Even if the DB is compromised, passwords are irrecoverable.

- 🛡️ **Session Security** – `AES`
  - Session tokens are encrypted after login to prevent session hijacking.
  - Tokens are decrypted on each page load to validate authenticity.

- 🖌️ **Artwork Metadata Protection** – `AES`
  - Title, artist name, and description are encrypted before storing.
  - Ensures that intellectual property is secured.

- 💳 **Purchase Security** – `RSA`
  - Simulates encrypted credit card and billing data during purchases.
  - RSA public-key encryption ensures only the server can decrypt sensitive information.

- 📧 **Contact Form Integrity** – `HMAC`
  - Verifies that contact form data is untampered using hash-based message authentication codes.
  - Ensures message authenticity and integrity.

---

## 🛠️ Tech Stack

| Layer       | Technologies Used                                      |
|-------------|--------------------------------------------------------|
| Frontend    | HTML, CSS, Bootstrap (for responsive design)          |
| Backend     | JSP (JavaServer Pages), Servlet architecture           |
| Database    | Apache Derby (embedded or client-server mode)          |
| Connectivity| JDBC (Java Database Connectivity)                      |
| Encryption  | Java Crypto APIs - SHA-256, AES, RSA, HMAC             |
| Tools       | NetBeans or Eclipse IDE, Apache Tomcat (server)        |

---
