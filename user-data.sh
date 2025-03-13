#!/bin/bash
# -----------------------------------------------------------
# Minimalistic Single-Page Portfolio for Mitchell Timmins
# Deploys via User Data on Amazon Linux 2
# -----------------------------------------------------------

# 1. Update packages and install Apache
yum update -y
yum install -y httpd

# 2. Start and enable Apache
systemctl start httpd
systemctl enable httpd

# 3. Create index.html with minimalistic design
cat << 'EOF' > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Mitchell Timmins - Minimalistic Portfolio</title>

  <!-- Google Font: Poppins for a modern, professional look -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link 
    href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;600&display=swap" 
    rel="stylesheet"
  >

  <!-- Bootstrap 5 CSS -->
  <link 
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" 
    rel="stylesheet"
  />

  <style>
    /* Global Reset & Font */
    body {
      margin: 0;
      padding: 0;
      font-family: 'Poppins', sans-serif;
      background-color: #fff;
      color: #000;
    }

    /* Navbar */
    .navbar {
      background-color: #fff;
      border-bottom: 1px solid #eee;
    }
    .navbar-brand {
      font-weight: 600;
      color: #000;
      font-size: 1.2rem;
    }
    .navbar-nav .nav-link {
      color: #000;
    }
    .navbar-nav .nav-link:hover {
      color: #555;
    }

    /* Hero Section */
    .hero {
      min-height: 80vh;
      display: flex;
      align-items: center;
      justify-content: center;
      text-align: center;
      position: relative;
      padding: 60px 20px;
      background-color: #f9f9f9;
    }
    .hero .container {
      max-width: 900px;
      position: relative;
      z-index: 2;
    }
    .hero h1 {
      font-size: 2.5rem;
      font-weight: 600;
      margin-bottom: 1rem;
    }
    .hero p {
      font-weight: 300;
      color: #333;
      margin-bottom: 2rem;
    }
    .btn-row {
      display: flex;
      gap: 1rem;
      justify-content: center;
    }
    .btn-custom {
      border: 1px solid #000;
      color: #000;
      background-color: transparent;
      font-weight: 300;
      padding: 0.7rem 1.2rem;
      text-transform: uppercase;
      transition: all 0.2s ease-in-out;
      border-radius: 0;
    }
    .btn-custom:hover {
      background-color: #000;
      color: #fff;
    }
    /* Cool bust image in the hero (lightly faded in the background) */
    .hero-image {
      position: absolute;
      bottom: 0;
      right: 5%;
      max-width: 300px;
      opacity: 0.05;
    }

    /* About Section */
    #about {
      padding: 60px 20px;
    }
    #about .container {
      max-width: 800px;
      margin: 0 auto;
      text-align: center;
    }
    #about h2 {
      font-size: 1.8rem;
      font-weight: 600;
      margin-bottom: 1rem;
    }
    #about p {
      font-weight: 300;
      color: #333;
      margin-bottom: 2rem;
    }

    /* Certificates Section */
    #certificates {
      padding: 60px 20px;
      background-color: #fafafa;
    }
    #certificates .container {
      max-width: 800px;
      margin: 0 auto;
      text-align: center;
    }
    #certificates h2 {
      font-size: 1.8rem;
      font-weight: 600;
      margin-bottom: 1rem;
    }
    .certificate-card {
      border: none;
      background-color: #fff;
      display: inline-block;
      margin: 20px auto;
      box-shadow: 0 2px 5px rgba(0,0,0,0.05);
      padding: 20px;
    }
    .certificate-card img {
      width: 100px;
      margin-bottom: 1rem;
    }
    .certificate-card h5 {
      font-size: 1rem;
      font-weight: 600;
      margin-bottom: 0.5rem;
    }
    .certificate-card p {
      font-weight: 300;
      color: #333;
      margin-bottom: 0;
    }

    /* Footer */
    footer {
      padding: 40px 20px;
      text-align: center;
      background-color: #fff;
      border-top: 1px solid #eee;
    }
    footer p {
      font-weight: 300;
      color: #777;
      margin: 0;
    }
  </style>
</head>
<body>
  <!-- Minimal Navbar -->
  <nav class="navbar navbar-expand-lg">
    <div class="container">
      <a class="navbar-brand" href="#home">Mitchell Timmins</a>
      <button 
        class="navbar-toggler" 
        type="button" 
        data-bs-toggle="collapse" 
        data-bs-target="#navbarNav" 
        aria-controls="navbarNav" 
        aria-expanded="false" 
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item">
            <a class="nav-link" href="#about">About</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#certificates">Certificates</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Hero Section -->
  <section id="home" class="hero">
    <div class="container">
      <h1>Cloud Engineer & Developer</h1>
      <p>
        Hello! I'm Mitchell Timmins, focused on building scalable, automated cloud solutions.<br>
        Let’s connect and push cloud infrastructure to new heights.
      </p>
      <div class="btn-row">
        <a 
          class="btn btn-custom" 
          href="https://github.com/MitchCC-design" 
          target="_blank"
        >
          GitHub
        </a>
        <a 
          class="btn btn-custom" 
          href="https://www.linkedin.com/in/mitchell-timmins-973904343" 
          target="_blank"
        >
          LinkedIn
        </a>
      </div>
    </div>
    <!-- Bust Image (placeholder) -->
    <img 
      class="hero-image" 
      src="https://via.placeholder.com/400x600?text=Cool+Bust" 
      alt="Bust Image"
    >
  </section>

  <!-- About Section -->
  <section id="about">
    <div class="container">
      <h2>About Me</h2>
      <p>
        I'm a Cloud Engineer with a passion for AWS, infrastructure automation, and CI/CD pipelines. 
        My goal is to dive deeper into advanced cloud architectures, ensuring efficiency, security, 
        and scalability across projects of all sizes.
      </p>
    </div>
  </section>

  <!-- Certificates Section -->
  <section id="certificates">
    <div class="container">
      <h2>Certificates</h2>
      <div class="certificate-card">
        <img 
          src="https://d1.awsstatic.com/training-and-certification/Certification%20Badges/AWS-Certified-Cloud-Practitioner_badge_150x150.17da917fbddc5383838d9f8209d2030c8d99f31e.png" 
          alt="AWS Cloud Practitioner Badge"
        >
        <h5>AWS Cloud Practitioner</h5>
        <p>AWS Certified Cloud Practitioner (Foundational)</p>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <footer>
    <p>&copy; 2025 Mitchell Timmins. All rights reserved.</p>
  </footer>

  <!-- Bootstrap 5 JS Bundle -->
  <script 
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
  ></script>
</body>
</html>
EOF
