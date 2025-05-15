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

## 🛠️ How to Set Up and Use This Project in NetBeans

This section provides step-by-step instructions on how to use the contents of this repository to set up a fully functional Java Web Application in NetBeans.

---

### 📦 Project Setup in NetBeans

1. **Open NetBeans IDE.**
2. **Create a new Java Web Application project**  
   *(File → New Project → Java Web → Web Application)*.
3. Inside your newly created project:
   - Navigate to the `Web Pages` directory.
   - Create the necessary `.jsp` files manually.
   - Copy the code from the `Web/` folder in this repository.
     - This includes all `.jsp` files and the `index.html` file.

---

### 🖼️ Setting Up the Images

4. **Create an `images` folder** inside your project's `Web Pages` directory.
   - Copy all image assets from the repository’s `images/` folder into this directory.
   - If you place the images in a different directory, **update the image paths** accordingly in your `.jsp` and `.html` files.

---

### 🔐 Implementing Encryption Techniques (Optional)

5. This project includes the implementation of **four encryption techniques**:
   - SHA-256
   - AES
   - RSA
   - HMAC

6. These are implemented via **four separate Java packages**, each containing the logic for its respective algorithm.

   You will find the Java source files in the following structure:

   src/java/
   ├── P1/ ← SHA-256
   ├── P2/ ← AES
   ├── P3/ ← RSA
   └── P4/ ← HMAC


8. In your NetBeans project:
- Create **four packages** named `P1`, `P2`, `P3`, and `P4` under your `Source Packages`.
- Copy the corresponding Java files from the repository into each package.

8. The `.jsp` pages use `import` statements to utilize these encryption techniques.  
You can identify which technique is used in a page by reviewing its import statements.

---

### ⚠️ Optional: Skipping Encryption Setup

If you do **not** wish to implement encryption:

- **Do not create the `P1` to `P4` packages**.
- In the `.jsp` files, **remove or comment out any import statements** that reference these packages.
- This allows the project to run **without encryption functionality**.

> 🔸 **Note:** This step is optional. Only follow it if you don’t want to include encryption or information security features in your project.

---

### 🗃️ Database Configuration

9. This project requires a backend **database** to function.

- You must **create your own database** and update the connection details in the code.
- Ensure the structure (tables, columns, etc.) matches what is expected in the application logic.

---

## ✅ Final Checklist

- [x] Java Web Application project created in NetBeans  
- [x] JSP and HTML files copied to the `Web Pages` directory  
- [x] `images` folder set up and image paths updated if necessary  
- [x] (Optional) Encryption packages (`P1` to `P4`) created and Java code copied  
- [x] Database created and connection strings updated  

Once all steps are completed, your project should be ready to run with or without encryption features.

---

## 📂 Folder Structure Overview


---

## 📜 License

This project is for educational purposes. You may modify and reuse it in your own work with proper attribution.

---
