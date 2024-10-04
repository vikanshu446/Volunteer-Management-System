package com.uniquedeveloper.registration;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/register")
public class RegistrationServelet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String uname = request.getParameter("name");
        String uemail = request.getParameter("email");
        String upwd = request.getParameter("pass");
        String umobile = request.getParameter("contact");

        // Initialize connection and dispatcher
        Connection con = null;
        RequestDispatcher dispatcher = null;

        try {
            // Establish database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/volunteer?useSSL=false", "root", "root");

            // Prepare statement to insert data into users table
            PreparedStatement pst = con.prepareStatement("INSERT INTO users(uname, upwd, uemail, umobile) VALUES (?, ?, ?, ?)");
            pst.setString(1, uname);
            pst.setString(2, upwd);
            pst.setString(3, uemail);
            pst.setString(4, umobile);

            // Execute the statement and check if insertion was successful
            int rowcount = pst.executeUpdate();
            dispatcher = request.getRequestDispatcher("registration.jsp");
            if (rowcount > 0) {
                // If successful, set success status attribute
                request.setAttribute("status", "success");
            } else {
                // If unsuccessful, set failed status attribute
                request.setAttribute("status", "failed");
            }
            dispatcher.forward(request, response);
        } catch (ClassNotFoundException | SQLException e) {
            // Handle exceptions
            e.printStackTrace();
            request.setAttribute("status", "failed");
        } finally {
            // Close connection
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            // Forward the request to registration.jsp
        }
    }
}
