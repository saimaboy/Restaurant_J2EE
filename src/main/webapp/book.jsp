<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Book a Table - Royal Cuisine</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Bootstrap Icons -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,700;1,400&display=swap" rel="stylesheet">
  <!-- Custom CSS -->
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
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
            <a href="about.jsp" class="text-white text-decoration-none me-4 nav-link">about</a>
            <a href="menu.jsp" class="text-white text-decoration-none me-4 nav-link">Menu</a>
            <a href="location.jsp" class="text-white text-decoration-none me-4 nav-link">Location</a>
            <a href="blog.jsp" class="text-white text-decoration-none me-4 nav-link">Blog</a>
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

  <!-- Booking Packages Section -->
  <section class="py-5 text-center">
    <div class="container">
      <h2 class="font-serif fst-italic display-5 text-amber">Choose a Package</h2>
      <div class="row mt-4">
        <div class="col-md-4">
          <div class="card bg-dark text-white p-3">
            <img src="assets/standard-package.jpg" class="card-img-top" alt="Standard Package">
            <h3 class="fs-4 mt-3">Standard Package</h3>
            <p>$50 per person - Includes 3-course meal</p>
            <button class="btn btn-gold select-package" data-package="Standard Package" data-details="$50 per person - Includes 3-course meal">Select</button>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card bg-dark text-white p-3">
            <img src="assets/premium-package.jpg" class="card-img-top" alt="Premium Package">
            <h3 class="fs-4 mt-3">Premium Package</h3>
            <p>$80 per person - Includes 5-course meal & wine</p>
            <button class="btn btn-gold select-package" data-package="Premium Package" data-details="$80 per person - Includes 5-course meal & wine">Select</button>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card bg-dark text-white p-3">
            <img src="assets/luxury-package.jpg" class="card-img-top" alt="Luxury Package">
            <h3 class="fs-4 mt-3">Luxury Package</h3>
            <p>$120 per person - Includes VIP dining & champagne</p>
            <button class="btn btn-gold select-package" data-package="Luxury Package" data-details="$120 per person - Includes VIP dining & champagne">Select</button>
          </div>
        </div>
      </div>
    </div>
  </section>


    <!-- Reservation Form Section -->
  <section class="py-5 bg-white text-center text-black">
    <div class="container">
      <h2 class="font-serif fst-italic display-5 text-amber">Make a Reservation</h2>
      <p class="text-black" id="selected-package-details">Please select a package above.</p>
      <form id="reservation-form" class="mt-4 border p-4 rounded bg-light" action="BookTableServlet" method="POST" style="color: black;">
        <input type="hidden" id="selected-package" name="package" value="">
        <div class="mb-3">
          <label for="name" class="form-label" style="color: black;">Full Name</label>
          <input type="text" class="form-control" id="name" name="name" required style="color: black; background-color: white;">
        </div>
        <div class="mb-3">
          <label for="email" class="form-label" style="color: black;">Email Address</label>
          <input type="email" class="form-control" id="email" name="email" required style="color: black; background-color: white;">
        </div>
        <div class="mb-3">
          <label for="phone" class="form-label" style="color: black;">Phone Number</label>
          <input type="text" class="form-control" id="phone" name="phone" required style="color: black; background-color: white;">
        </div>
        <div class="mb-3">
          <label for="date" class="form-label" style="color: black;">Reservation Date</label>
          <input type="date" class="form-control" id="date" name="date" required style="color: black; background-color: white;">
        </div>
        <div class="mb-3">
          <label for="guests" class="form-label" style="color: black;">Number of Guests</label>
          <input type="number" class="form-control" id="guests" name="guests" required style="color: black; background-color: white;">
        </div>
        <button type="submit" class="btn btn-gold">Reserve Now</button>
      </form>
    </div>
  </section>
<footer class="bg-black text-white py-5">
    <div class="container">
      <div class="row">
        <!-- Open Hours -->
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
        
        <!-- Newsletter -->
        <div class="col-md-4 mb-4 mb-md-0">
          <h3 class="fs-4 mb-4">Newsletter</h3>
          <p class="mb-3 text-gray">
            Far far away, behind the word mountains, far from the countries.
          </p>
          <div class="d-flex flex-column gap-2">
            <input type="email" placeholder="Enter E-mail address" class="form-control bg-transparent text-white border-gray">
            <button class="btn btn-gold text-white">Subscribe</button>
          </div>
        </div>
        
        <!-- Instagram -->
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
  <!-- Success Modal -->
  <div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content bg-dark text-white">
        <div class="modal-header">
          <h5 class="modal-title" id="successModalLabel">Reservation Successful</h5>
          <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          Your table has been successfully reserved. We look forward to serving you!
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <script>
  document.querySelectorAll('.select-package').forEach(button => {
      button.addEventListener('click', function() {
        document.getElementById('selected-package').value = this.dataset.package;
        document.getElementById('selected-package-details').innerText = 'Selected Package: ' + this.dataset.details;
      });
    });

    
  </script>
</body>
</html>
