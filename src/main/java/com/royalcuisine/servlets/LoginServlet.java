package com.royalcuisine.servlets;

import com.royalcuisine.utils.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("emailAddress");
        String password = request.getParameter("password");

        // Debugging: Print received values
        System.out.println("Login Attempt: Email=" + email);

        // Validate input (to prevent empty queries)
        if (email == null || password == null || email.isEmpty() || password.isEmpty()) {
            response.sendRedirect("login.jsp?error=Email and password are required.");
            return;
        }

        // Database query
        String sql = "SELECT id, first_name, last_name FROM users WHERE email = ? AND password = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // ✅ Create user session
                HttpSession session = request.getSession();
                session.setAttribute("userId", rs.getInt("id"));
                session.setAttribute("firstName", rs.getString("first_name"));
                session.setAttribute("lastName", rs.getString("last_name"));
                session.setAttribute("email", email);

                System.out.println("✅ Login successful for: " + email);
                response.sendRedirect("home.jsp"); // Redirect to home
            } else {
                System.out.println("❌ Invalid credentials for: " + email);
                response.sendRedirect("login.jsp?error=Invalid email or password.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=Database error. Please try again.");
        }
    }
}
