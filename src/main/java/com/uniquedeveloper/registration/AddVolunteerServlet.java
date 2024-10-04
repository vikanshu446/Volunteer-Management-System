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

@WebServlet("/AddVolunteerServlet")
public class AddVolunteerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Database connection parameters
    private final String url = "jdbc:mysql://localhost:3306/volunteer";
    private final String username = "root";
    private final String password = "root";
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String name = request.getParameter("name");
        String contactNo = request.getParameter("contactNo");
        String email = request.getParameter("email");
        int age = Integer.parseInt(request.getParameter("age"));
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");
        String skills = request.getParameter("skills");
        String workingDays = request.getParameter("workingDays");
        
        // JDBC variables
        try (Connection conn = DriverManager.getConnection(url, username, password)) {
            // Create SQL query
            String sql = "INSERT INTO volunteers (name, contact_no, email, age, gender, dob, skills, working_days) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            
            // Create PreparedStatement
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, name);
                pstmt.setString(2, contactNo);
                pstmt.setString(3, email);
                pstmt.setInt(4, age);
                pstmt.setString(5, gender);
                pstmt.setString(6, dob);
                pstmt.setString(7, skills);
                pstmt.setString(8, workingDays);
                
                // Execute the query
                pstmt.executeUpdate();
            }
            
            // Redirect to a success page
            response.sendRedirect("success.jsp");
        } catch (SQLException e) {
            // Handle errors
            e.printStackTrace();
            // Redirect to an error page
            response.sendRedirect("error.jsp");
        }
    }
}
