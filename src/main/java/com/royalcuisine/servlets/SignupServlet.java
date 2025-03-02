package com.royalcuisine.servlets;

import com.royalcuisine.utils.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("emailAddress");
        String password = request.getParameter("password");
        String contactNumber = request.getParameter("contactNumber");
        String role = request.getParameter("role");

        if (role == null || role.isEmpty()) {
            role = "user"; // Default role
        }

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DBConnection.getConnection();
            if (conn == null) {
                throw new SQLException("Failed to establish database connection.");
            }

            String sql = "INSERT INTO users (first_name, last_name, email, password, contact_number, role) VALUES (?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, email);
            stmt.setString(4, password);
            stmt.setString(5, contactNumber);
            stmt.setString(6, role);

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("User registered successfully!");
                response.sendRedirect("login.jsp?signupSuccess=true");
            } else {
                System.out.println("User registration failed! No rows affected.");
                response.sendRedirect("signup.jsp?error=Signup failed.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("SQL Error: " + e.getMessage());
            response.sendRedirect("signup.jsp?error=Email already registered or invalid data.");
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close(); // Close DB connection
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
