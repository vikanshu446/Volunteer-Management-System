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

@WebServlet("/ParticipationServlet")
public class ParticipationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection parameters
    private final String url = "jdbc:mysql://localhost:3306/volunteer";
    private final String username = "root";
    private final String password = "root";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
        String eventName = request.getParameter("EventName");
        String volunteerName = request.getParameter("vName");
        String volunteerEmail = request.getParameter("vEmail");
        String volunteerContact = request.getParameter("vContactNo");
        String experience = request.getParameter("Experience");
        String skills = request.getParameter("Skills");

        // JDBC variables
        try (Connection conn = DriverManager.getConnection(url, username, password)) {
            // Create SQL query
            String sql = "INSERT INTO VolunteerData (EventName, vName, vEmail, vContactNo, experience, skills) VALUES (?, ?, ?, ?, ?, ?)";

            // Create PreparedStatement
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, eventName);
                pstmt.setString(2, volunteerName);
                pstmt.setString(3, volunteerEmail);
                pstmt.setString(4, volunteerContact);
                pstmt.setString(5, experience);
                pstmt.setString(6, skills);

                // Execute the query
                pstmt.executeUpdate();
            }

            // Redirect to a success page
            response.sendRedirect("ParticipentSuccess.jsp");
        } catch (SQLException e) {
            // Handle errors
            e.printStackTrace();
            // Redirect to an error page
            response.sendRedirect("error.jsp");
        }
    }
}
