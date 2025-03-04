package com.royalcuisine.servlets;

import com.royalcuisine.utils.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class BookTableServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String date = request.getParameter("date");
        String guests = request.getParameter("guests");
        String packageSelected = request.getParameter("package");
        
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            conn = DBConnection.getConnection();
            if (conn == null) {
                throw new SQLException("Failed to establish database connection.");
            }
            
            String sql = "INSERT INTO reservations (name, email, phone, reservation_date, guests, package_selected) VALUES (?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, phone);
            stmt.setString(4, date);
            stmt.setString(5, guests);
            stmt.setString(6, packageSelected);
            
            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                out.println("<script type='text/javascript'>");
                out.println("alert('Reservation Successful!');");
                out.println("window.location='home.jsp';");
                out.println("</script>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<script type='text/javascript'>");
            out.println("alert('Error while processing reservation. Please try again.');");
            out.println("window.location='book-table.jsp';");
            out.println("</script>");
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
