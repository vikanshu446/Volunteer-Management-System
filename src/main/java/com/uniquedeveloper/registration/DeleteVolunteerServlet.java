package com.uniquedeveloper.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteVolunteerServlet")
public class DeleteVolunteerServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the volunteer ID parameter from the request
        String id = request.getParameter("id");
        
        // Check if the ID is provided
        if (id == null || id.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Volunteer ID is required");
            return;
        }
        
        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/volunteer";
        String username = "root";
        String password = "root";
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            // Establish connection
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, password);
            
            // Create SQL query
            String sql = "DELETE FROM volunteers WHERE id=?";
            
            // Create PreparedStatement
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            
            // Execute the query
            int rowsAffected = pstmt.executeUpdate();
            
            if (rowsAffected > 0) {
                // Redirect back to volunteer list page if deletion is successful
                response.sendRedirect("index.jsp");
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Volunteer with ID " + id + " not found");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while deleting the volunteer");
        } finally {
            // Close resources
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
