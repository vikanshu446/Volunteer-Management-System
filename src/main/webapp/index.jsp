
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    // Check if the user is logged in, if not, redirect to login page
    if(session.getAttribute("name") == null) {
        response.sendRedirect("login.jsp");
        return; // Stop further execution of the page
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Volunteer Management System</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    
    
    <!-- Add other CSS or JavaScript files if needed -->
    
     <style>
    
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .btn {
            padding: 5px 10px;
            border: none;
            cursor: pointer;
            display: inline-block;
            margin-right: 5px;
        }
        .btn-update {
            background-color: #4CAF50;
            color: white;
        }
        .btn-delete {
            background-color: #f44336;
            color: white;
        }
    </style>
</head>
<body>

    <div class="container">
        <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
            <div class="col-md-3 mb-2 mb-md-0">
                <a href="/" class="d-inline-flex link-body-emphasis text-decoration-none">
                    <svg class="bi" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
                </a>
            </div>

            <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
                <li><a href="index.jsp" class="nav-link px-2 link-secondary">Home</a></li>
                <li><a href="AddVolunteer.jsp" class="nav-link px-2">Add Volunteer</a></li>
                <li><a href="Event.jsp" class="nav-link px-2">Event</a></li>
            
                <li><a href="About.jsp" class="nav-link px-2">About</a></li>
            </ul>

            <div class="col-md-3 text-end">
                
                <button type="button" class="btn btn-primary" onclick="window.location.href='registration.jsp'">LogOut</button>
            </div>
        </header>
        </div>
     
<div class="container">
<h2>List of Volunteers</h2>

<table>
    <tr>
        <th>Name</th>
        <th>Contact Number</th>
        <th>Email</th>
        <th>Age</th>
        <th>Gender</th>
        <th>Date of Birth</th>
        <th>Skills</th>
        <th>Working Days</th>
        <th>Action</th>
    </tr>
    <%
        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/volunteer";
        String username = "root";
        String password = "root";
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            // Establish connection
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, password);
            
            // Create SQL query
            String sql = "SELECT * FROM volunteers";
            
            // Create PreparedStatement
            pstmt = conn.prepareStatement(sql);
            
            // Execute the query
            rs = pstmt.executeQuery();
            
            // Loop through the result set and display data
            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getString("name") + "</td>");
                out.println("<td>" + rs.getString("contact_no") + "</td>");
                out.println("<td>" + rs.getString("email") + "</td>");
                out.println("<td>" + rs.getInt("age") + "</td>");
                out.println("<td>" + rs.getString("gender") + "</td>");
                out.println("<td>" + rs.getString("dob") + "</td>");
                out.println("<td>" + rs.getString("skills") + "</td>");
                out.println("<td>" + rs.getString("working_days") + "</td>");
                out.println("<td>");
                // Action buttons for update and delete
                out.println("<button class='btn btn-update' onclick='UpdateVolunteer(" + rs.getInt("id") + ")'>Update</button>");
                out.println("<button class='btn btn-delete' onclick='DeleteVolunteer(" + rs.getInt("id") + ")'>Delete</button>");
                out.println("</td>");
                out.println("</tr>");
            }
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</table>

<script>
function UpdateVolunteer(id) {
    // Redirect to the update servlet passing the volunteer ID
    window.location.href = 'updateForm.jsp?id=' + id;
}

function DeleteVolunteer(id) {
    // Confirm deletion
    if (confirm('Are you sure you want to delete this volunteer?')) {
        // Send an AJAX request to the delete servlet passing the volunteer ID
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4) {
                if (this.status == 200) {
                    // Reload the page after successful deletion
                    location.reload();
                } else {
                    console.error('Error deleting volunteer:', this.statusText);
                    // Handle error
                }
            }
        };
        xhttp.open("GET", "DeleteVolunteerServlet?id=" + id, true);
        xhttp.send();
    }
}

</script>       
</div>

</body>
</html>
