package com.royalcuisine.servlets;

import com.royalcuisine.utils.DBConnection;
import com.royalcuisine.utils.EmailSender;
import org.mindrot.jbcrypt.BCrypt;  // Import BCrypt for password hashing
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("emailAddress");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String contactNumber = request.getParameter("contactNumber");
        String role = request.getParameter("role");

        // Validate if password and confirm password match
        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("signup.jsp");
            dispatcher.forward(request, response);
            return;
        }

        if (role == null || role.isEmpty()) {
            role = "user"; // Default role if not provided
        }

        // Hash the password using BCrypt
        String hashedPassword = hashPassword(password);

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            if (conn == null) {
                throw new SQLException("Failed to establish database connection.");
            }

            // Check if contact number already exists
            String checkPhoneQuery = "SELECT COUNT(*) FROM users WHERE contact_number = ?";
            stmt = conn.prepareStatement(checkPhoneQuery);
            stmt.setString(1, contactNumber);
            rs = stmt.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                request.setAttribute("error", "Contact number already registered.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("signup.jsp");
                dispatcher.forward(request, response);
                return;
            }

            // Check if email already exists
            String checkEmailQuery = "SELECT COUNT(*) FROM users WHERE email = ?";
            stmt = conn.prepareStatement(checkEmailQuery);
            stmt.setString(1, email);
            rs = stmt.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                request.setAttribute("error", "Email address already registered.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("signup.jsp");
                dispatcher.forward(request, response);
                return;
            }

            // SQL query to insert the user
            String sql = "INSERT INTO users (first_name, last_name, email, password, contact_number, role) VALUES (?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, email);
            stmt.setString(4, hashedPassword); // Store the hashed password
            stmt.setString(5, contactNumber);
            stmt.setString(6, role);

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("User registered successfully!");
                sendWelcomeEmail(email, firstName);
                response.sendRedirect("login.jsp"); // Redirect to your login page
            } else {
                System.out.println("User registration failed! No rows affected.");
                request.setAttribute("error", "Signup failed.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("signup.jsp");
                dispatcher.forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("SQL Error during signup: " + e.getMessage());
            request.setAttribute("error", "Database error during signup.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("signup.jsp");
            dispatcher.forward(request, response);
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
                System.err.println("Error closing database resources: " + ex.getMessage());
            }
        }
    }

    private void sendWelcomeEmail(String toEmail, String firstName) {
        String subject = "Welcome to Royal Cuisine!";
        String body = "Hi " + firstName + ",\n\nWelcome to Royal Cuisine! We are excited to have you as a part of our community.\n\nBest regards,\nRoyal Cuisine Team";
        EmailSender.sendEmail(toEmail, subject, body);
    }

    // Method to hash the password using BCrypt
    private String hashPassword(String password) {
        // Generate a salt and hash the password
        String salt = BCrypt.gensalt(12);  // 12 is the strength factor
        return BCrypt.hashpw(password, salt); // Hash the password with the salt
    }
}
