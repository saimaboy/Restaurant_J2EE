<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reservation Form - Royal Cuisine</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
  .reservation-summary {
    background-color: #333;
    border-radius: 8px;
    padding: 20px;
    max-width: 400px; /* Increased width to make it more centered */
    color: #fff;
    margin: 40px auto; /* Center the summary block on the page */
    text-align: center; /* Aligns all text inside the reservation-summary */
  }

  .reservation-summary h4 {
    font-size: 1.5rem;
    margin-bottom: 10px;
    color: #ffcc00;
  }

  .reservation-summary ul {
    list-style: none;
    padding: 0;
  }

  .reservation-summary li {
    margin-bottom: 8px;
  }

  .reservation-summary .table-info,
  .reservation-summary .menu-info {
    display: flex;
    flex-direction: column; /* Stack items vertically */
    align-items: center; /* Center-align the content */
    justify-content: center;
  }

  .reservation-summary .menu-info div {
    margin: 10px 0; /* Add space between items */
  }

  .reservation-summary .menu-info img {
    width: 50px;
    height: 50px;
    object-fit: cover;
    border-radius: 5px;
    margin-bottom: 10px; /* Space below the image */
  }
</style>

</head>
<body class="bg-dark text-white">

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
            <a href="offers.jsp" class="text-white text-decoration-none me-4 nav-link">Offers</a>
            <a href="location.jsp" class="text-white text-decoration-none me-4 nav-link">Location</a>
            <a href="blog.jsp" class="text-white text-decoration-none me-4 nav-link">Blog</a>
            <a href="feedback.jsp" class="text-white text-decoration-none me-4 nav-link">Feedback</a>
            <a href="contact.jsp" class="text-white text-decoration-none me-4 nav-link">Contact</a>
            <a href="book.jsp" class="btn btn-gold text-white me-4">Book a Table</a>
            <a href="profile.jsp" class="text-white text-decoration-none">
              <i class="bi bi-person"></i>
            </a>
          </nav>
        </div>
      </div>
    </div>
  </header>

  <!-- Reservation Section -->
  <section class="py-5 text-center">
    <div class="container">
      <h2 class="font-serif fst-italic display-5 text-warning">Complete Your Reservation</h2>

      <!-- Reservation Summary Section -->
      <div class="reservation-summary mx-auto">
        <h4>Table Details</h4>
        <div class="table-info" style="color:white;">
          <span><strong>Table ID:</strong> <%= request.getParameter("table_id") != null ? request.getParameter("table_id") : "Not Selected" %></span>
        </div>

        <h4 class="mt-4">Meals Selected</h4>
        <div class="menu-info ">
          <% 
            String[] selectedMeals = request.getParameterValues("meals");
            String[] mealImages = request.getParameterValues("meal_images");
            if (selectedMeals != null && selectedMeals.length > 0) {
                for (int i = 0; i < selectedMeals.length; i++) {
          %>
            <div class="d-flex">
             
              <span class="ms-3"><%= selectedMeals[i] %></span>
            </div>
          <% 
                }
            } else {
          %>
            <p>No meals selected</p>
          <% 
            }
          %>
        </div>

        <h4 class="mt-4">Beverages Selected</h4>
        <div class="menu-info">
          <% 
            String[] selectedBeverages = request.getParameterValues("beverages");
            String[] beverageImages = request.getParameterValues("beverage_images");
            if (selectedBeverages != null && selectedBeverages.length > 0) {
                for (int i = 0; i < selectedBeverages.length; i++) {
          %>
            <div class="d-flex">
             
              <span class="ms-3"><%= selectedBeverages[i] %></span>
            </div>
          <% 
                }
            } else {
          %>
            <p>No beverages selected</p>
          <% 
            }
          %>
        </div>
      </div>

      <!-- Reservation Form inside Border Box -->
      <form action="BookTableServlet" method="POST" class="border p-4 mx-auto" style="max-width: 600px;">
          <!-- Pass the table ID, meals, and beverages to the booking page -->
          <input type="hidden" name="table_id" value="<%= request.getParameter("table_id") %>">
          <input type="hidden" name="meals" value="<%= selectedMeals != null ? String.join(",", selectedMeals) : "" %>">
          <input type="hidden" name="beverages" value="<%= selectedBeverages != null ? String.join(",", selectedBeverages) : "" %>">
          <input type="hidden" name="meal_images" value="<%= mealImages != null ? String.join(",", mealImages) : "" %>">
          <input type="hidden" name="beverage_images" value="<%= beverageImages != null ? String.join(",", beverageImages) : "" %>">

          <div class="mb-3">
              <label for="name" class="form-label">Full Name</label>
              <input type="text" class="form-control" id="name" name="name" required>
          </div>

          <div class="mb-3">
              <label for="email" class="form-label">Email Address</label>
              <input type="email" class="form-control" id="email" name="email" required>
          </div>

          <div class="mb-3">
              <label for="phone" class="form-label">Phone Number</label>
              <input type="text" class="form-control" id="phone" name="phone" required>
          </div>

          <div class="mb-3">
              <label for="date" class="form-label">Reservation Date</label>
              <input type="date" class="form-control" id="date" name="date" required>
          </div>

          <div class="mb-3">
              <label for="time" class="form-label">Reservation Time</label>
              <input type="time" class="form-control" id="time" name="time" required>
          </div>

          <div class="mb-3">
              <label for="guests" class="form-label">Number of Guests</label>
              <input type="number" class="form-control" id="guests" name="guests" required>
          </div>

          <button type="submit" class="btn btn-warning">Complete Reservation</button>
      </form>
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
