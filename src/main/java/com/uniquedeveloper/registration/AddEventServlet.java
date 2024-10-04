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



@WebServlet("/AddEventServlet")
public class AddEventServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String eventName = request.getParameter("event_name");
        String eventDescription = request.getParameter("event_description");
        String imageUrl = request.getParameter("image_url");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Database connection parameters
            String url = "jdbc:mysql://localhost:3306/volunteer";
            String username = "root";
            String password = "root";

            // Establish connection
            conn = DriverManager.getConnection(url, username, password);

            // SQL query to insert event data into the database
            String sql = "INSERT INTO EventData (event_name, event_description, image_url) VALUES (?, ?, ?)";

            // Create PreparedStatement
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, eventName);
            pstmt.setString(2, eventDescription);
            pstmt.setString(3, imageUrl);

            // Execute the query
            pstmt.executeUpdate();

            // Redirect back to the add event page with a success message
            response.sendRedirect("AddEvent.jsp?success=true");
        } catch (SQLException e) {
            // Handle database errors
            e.printStackTrace();
            // Redirect back to the add event page with an error message
            response.sendRedirect("AddEvent.jsp?error=true");
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
