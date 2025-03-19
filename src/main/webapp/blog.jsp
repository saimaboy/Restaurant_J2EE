<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Blog - Royal Cuisine</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
  <link rel="stylesheet" href="css/styles.css">
</head>
<body class="bg-black text-white">

  <!-- Header/Navigation -->
  <header class="py-3 bg-black">
    <div class="container">
      <div class="row align-items-center">
        <div class="col-md-3 d-flex align-items-center">
          <img src="assets/image4.png" alt="Royal Cuisine Logo" width="60" height="60" class="me-2">
          <div class="text-gold fw-bold">ROYAL CUISINE</div>
        </div>
        <div class="col-md-9">
          <nav class="d-none d-md-flex justify-content-end align-items-center">
            <a href="home.jsp" class="text-white text-decoration-none me-4 nav-link">Home</a>
            <a href="about.jsp" class="text-white text-decoration-none me-4 nav-link">About</a>
            <a href="menu.jsp" class="text-white text-decoration-none me-4 nav-link">Menu</a>
            <a href="location.jsp" class="text-white text-decoration-none me-4 nav-link">Location</a>
            <a href="blog.jsp" class="text-white text-decoration-none me-4 nav-link active">Blog</a>
            <a href="contact.jsp" class="text-white text-decoration-none me-4 nav-link">Contact</a>
            <a href="book.jsp" class="btn btn-gold text-white me-4">Book a Table</a>
            <a href="#" class="text-white text-decoration-none">
              <i class="bi bi-person"></i>
            </a>
          </nav>
        </div>
      </div>
    </div>
  </header>

  <!-- Blog Section -->
  <section class="py-5 text-center">
    <div class="container">
      <h2 class="font-serif fst-italic display-5 text-warning">Our Latest Blog Posts</h2>
      
      <!-- Blog Post 1 -->
      <div class="row mt-4">
        <div class="col-md-4">
          <div class="card bg-dark text-white">
            <img src="assets/blog1.jpg" class="card-img-top" alt="Blog Post 1">
            <div class="card-body">
              <h5 class="card-title">The Secrets Behind Our Signature Dishes</h5>
              <p class="card-text">Discover the inspiration and ingredients behind some of our most popular dishes at Royal Cuisine. A must-read for food enthusiasts!</p>
              <a href="blog-detail.jsp?id=1" class="btn btn-warning">Read More</a>
            </div>
          </div>
        </div>
        
        <!-- Blog Post 2 -->
        <div class="col-md-4">
          <div class="card bg-dark text-white">
            <img src="assets/blog2.jpg" class="card-img-top" alt="Blog Post 2">
            <div class="card-body">
              <h5 class="card-title">Exploring the Flavors of Our New Beverage Menu</h5>
              <p class="card-text">From exotic cocktails to refreshing mocktails, our new beverage menu is crafted to complement every meal perfectly.</p>
              <a href="blog-detail.jsp?id=2" class="btn btn-warning">Read More</a>
            </div>
          </div>
        </div>

        <!-- Blog Post 3 -->
        <div class="col-md-4">
          <div class="card bg-dark text-white">
            <img src="assets/blog3.jpg" class="card-img-top" alt="Blog Post 3">
            <div class="card-body">
              <h5 class="card-title">Our Commitment to Sustainable Cooking</h5>
              <p class="card-text">Learn about how Royal Cuisine is embracing sustainable practices, from sourcing local ingredients to reducing waste in our kitchen.</p>
              <a href="blog-detail.jsp?id=3" class="btn btn-warning">Read More</a>
            </div>
          </div>
        </div>
      </div>

      <!-- Pagination (optional) -->
      <div class="mt-4">
        <nav aria-label="Page navigation">
          <ul class="pagination justify-content-center">
            <li class="page-item"><a class="page-link" href="#">Previous</a></li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">Next</a></li>
          </ul>
        </nav>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <footer class="bg-black text-white py-5">
    <div class="container">
      <div class="row">
        <div class="col-md-4 mb-4 mb-md-0">
          <h3 class="fs-4 mb-4">Open Hours</h3>
          <div class="row">
            <div class="col-6">Monday</div>
            <div class="col-6">9:00 - 24:00</div>
            <div class="col-6">Tuesday</div>
            <div class="col-6">9:00 - 24:00</div>
            <div class="col-6">Wednesday</div>
            <div class="col-6">9:00 - 24:00</div>
            <div class="col-6">Thursday</div>
            <div class="col-6">9:00 - 24:00</div>
            <div class="col-6">Friday</div>
            <div class="col-6">9:00 - 02:00</div>
            <div class="col-6">Saturday</div>
            <div class="col-6">9:00 - 02:00</div>
            <div class="col-6">Sunday</div>
            <div class="col-6">9:00 - 02:00</div>
          </div>
        </div>
        
        <div class="col-md-4 mb-4 mb-md-0">
          <h3 class="fs-4 mb-4">Newsletter</h3>
          <div class="d-flex flex-column gap-2">
            <input type="email" placeholder="Enter E-mail address" class="form-control bg-transparent text-white border-gray">
            <button class="btn btn-gold text-white">Subscribe</button>
          </div>
        </div>

        <div class="col-md-4 px-4">
          <h3 class="fs-4 mb-4">Instagram</h3>
          <div class="d-flex align-items-center">
            <i class="bi bi-instagram text-amber me-2 fs-5"></i>
            <span class="text-gray">royal_cuisine</span>
          </div>
        </div>
      </div>
    </div>
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
