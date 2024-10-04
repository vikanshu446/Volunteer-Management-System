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

@WebServlet("/UpdateVolunteerServlet")
public class UpdateVolunteerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String contactNo = request.getParameter("contactNo");
        String email = request.getParameter("email");
        int age = Integer.parseInt(request.getParameter("age"));
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");
        String skills = request.getParameter("skills");
        String workingDays = request.getParameter("workingDays");

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
            String sql = "UPDATE volunteers SET name=?, contact_no=?, email=?, age=?, gender=?, dob=?, skills=?, working_days=? WHERE id=?";

            // Create PreparedStatement
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, contactNo);
            pstmt.setString(3, email);
            pstmt.setInt(4, age);
            pstmt.setString(5, gender);
            pstmt.setString(6, dob);
            pstmt.setString(7, skills);
            pstmt.setString(8, workingDays);
            pstmt.setString(9, id);

            // Execute the update query
            pstmt.executeUpdate();

            // Redirect to index.jsp after successful update
            response.sendRedirect("index.jsp");
        } catch (Exception e) {
            e.printStackTrace();
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
