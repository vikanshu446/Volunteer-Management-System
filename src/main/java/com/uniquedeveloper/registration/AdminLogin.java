package com.uniquedeveloper.registration;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Aemail = request.getParameter("username");
        String Apwd = request.getParameter("password");
        HttpSession session = request.getSession();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            // Establish connection to the database
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/volunteer?useSSL=false", "root", "root");
            System.out.println("Connected to database");
            
            // Prepare SQL statement
            pst = con.prepareStatement("SELECT * FROM Adminregistration WHERE Aemail = ? AND Apwd = ?");
            pst.setString(1, Aemail);
            pst.setString(2, Apwd);
            System.out.println("SQL Query: " + pst.toString());

            // Execute the query
            rs = pst.executeQuery();
            
            if (rs.next()) {
                // If the user exists, set session attribute and redirect to Admin dashboard
                session.setAttribute("name", rs.getString("Aname"));
                response.sendRedirect("AdminDashboard.jsp");
            } else {
                // If login fails, set error attribute and redirect back to Admin.jsp
                System.out.println("Login failed: Incorrect username or password");
                request.setAttribute("status", "failed");
                RequestDispatcher dispatcher = request.getRequestDispatcher("Admin.jsp");
                dispatcher.forward(request, response);
            }
        } catch (ClassNotFoundException | SQLException e) {
            // Handle database errors
            e.printStackTrace();
            request.setAttribute("status", "error");
            RequestDispatcher dispatcher = request.getRequestDispatcher("Admin.jsp");
            dispatcher.forward(request, response);
        } finally {
            // Close resources in finally block
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
