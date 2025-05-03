package com.royalcuisine.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class TableReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Table Model Class
    public static class Table {
        private int tableNumber;
        private int capacity;
        private boolean isAvailable;
        private String imageUrl;
        private double price;
        private String description;

        // Getters and Setters

        public int getTableNumber() {
            return tableNumber;
        }

        public void setTableNumber(int tableNumber) {
            this.tableNumber = tableNumber;
        }

        public int getCapacity() {
            return capacity;
        }

        public void setCapacity(int capacity) {
            this.capacity = capacity;
        }

        public boolean isAvailable() {
            return isAvailable;
        }

        public void setAvailable(boolean isAvailable) {
            this.isAvailable = isAvailable;
        }

        public String getImageUrl() {
            return imageUrl;
        }

        public void setImageUrl(String imageUrl) {
            this.imageUrl = imageUrl;
        }

        public double getPrice() {
            return price;
        }

        public void setPrice(double price) {
            this.price = price;
        }

        public String getDescription() {
            return description;
        }

        public void setDescription(String description) {
            this.description = description;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // JDBC connection details
        String jdbcURL = "jdbc:mysql://localhost:3306/royal_cuisine";
        String jdbcUsername = "root";
        String jdbcPassword = "12345678";

        List<Table> tableList = new ArrayList<>();

        try {
            // Step 1: Establishing database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

            // Step 2: Query to fetch table data
            String sql = "SELECT table_number, capacity, is_available, image_url, price, description FROM tables";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();

            // Step 3: Fetching and storing table details
            while (resultSet.next()) {
                Table table = new Table();
                table.setTableNumber(resultSet.getInt("table_number"));
                table.setCapacity(resultSet.getInt("capacity"));
                table.setAvailable(resultSet.getBoolean("is_available"));
                table.setImageUrl(resultSet.getString("image_url"));
                table.setPrice(resultSet.getDouble("price"));
                table.setDescription(resultSet.getString("description"));
                tableList.add(table);
            }

            // Step 4: Close resources
            resultSet.close();
            statement.close();
            connection.close();

        } catch (Exception e) {
            e.printStackTrace();
            // Handle error and send an error message to the JSP page
            request.setAttribute("errorMessage", "Error fetching table data. Please try again later.");
        }

        // Step 5: Send table list to JSP page
        request.setAttribute("tableList", tableList);
        request.getRequestDispatcher("/book.jsp").forward(request, response);
    }
}
