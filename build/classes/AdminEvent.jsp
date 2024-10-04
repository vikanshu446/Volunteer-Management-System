<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Events</title>
     <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        .event-card {
            border: 1px solid #ccc;
            border-radius: 5px;
            margin: 10px;
            padding: 10px;
            width: 300px;
            display: inline-block;
        }
        .event-card img {
            max-width: 100%;
            height: auto;
            margin-bottom: 10px;
        }
        .participate-btn {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 3px;
            cursor: pointer;
        }
        .nav-link:hover {
       color: black;
       text-decoration: underline;
   }
    .container1 {
       background-color: #333333;
   }
   .col-md-3 {
       padding: 1rem;
   }

   .text-md-start {
       text-align: left;
   }

   .text-md-end {
       text-align: right;
   }

   h5{
   color: magenta;
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
                <li><a href="AdminDashboard.jsp" class="nav-link px-2 link-secondary">Home</a></li>

            </ul>

            <div class="col-md-3 text-end">
                
                <button type="button" class="btn btn-primary" onclick="window.location.href='registration.jsp'">LogOut</button>
            </div>
        </header>


<h2>Events</h2>

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
        String sql = "SELECT * FROM EventData";
        
        // Create PreparedStatement
        pstmt = conn.prepareStatement(sql);
        
        // Execute the query
        rs = pstmt.executeQuery();
        
        // Loop through the result set and display event cards
        while (rs.next()) {
%>
            <div class="event-card">
                <img src="<%= rs.getString("image_url") %>" alt="Event Image">
                <h3><%= rs.getString("event_name") %></h3>
                <p><%= rs.getString("event_description") %></p>
                <button class="participate-btn" onclick="participate(<%= rs.getInt("event_id") %>)">Participate</button>
            </div>
<%
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

<script>
    function participate(eventId) {
        // Implement logic to handle participation
        // Redirect to participation form page with event ID
        window.location.href = "ParticipationForm.jsp?eventId=" + eventId;
    }
</script>
</div>

<footer class="py-5 bg-dark" style="margin: 30px 30px; margin-top: 25px; border-radius: 10px;">
    <div class="container">
        <div class="row">
            <div class="col-md-3 mb-4">
                <h5>Section</h5>
                <ul class="nav flex-column">
                    <li class="nav-item mb-2"><a href="index.jsp" class="nav-link p-0 text-muted">Home</a></li>
                    <li class="nav-item mb-2"><a href="AddVolunteer.jsp" class="nav-link p-0 text-muted">AddVolunteer</a></li>
                    <li class="nav-item mb-2"><a href="Event.jsp" class="nav-link p-0 text-muted">Event</a></li>
                    <li class="nav-item mb-2"><a href="About.jsp" class="nav-link p-0 text-muted">About</a></li>
                    
                </ul>
            </div>
            <div class="col-md-3 mb-4">
                <h5>Follow Us</h5>
                <ul class="nav flex-column">
                    <li class="nav-item mb-2"><a href="https://www.linkedin.com/in/sandeep-kumar-patel-1b216b229/" class="nav-link p-0 text-muted"><i class="bi bi-linkedin"></i> LinkedIn</a></li>
                    <li class="nav-item mb-2"><a href="https://github.com/sandeepgithubindia" class="nav-link p-0 text-muted"><i class="bi bi-github"></i> GitHub</a></li>
                    <li class="nav-item mb-2"><a href="https://www.facebook.com/profile.php?id=100076443597654" class="nav-link p-0 text-muted"><i class="bi bi-facebook"></i> Facebook</a></li>
                </ul>
            </div>
            <div class="col-md-3 mb-4">
                <h5>Developers</h5>
                <ul class="nav flex-column">
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Sandeep Kumar Patel</a></li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Vikash Verma</a></li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Ram Sajan</a></li>
                </ul>
            </div>
            <div class="col-md-3 mb-4">
                <h5>Subscribe to our newsletter</h5>
                <p>Monthly digest of what's new and exciting from us.</p>
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="Email address" aria-label="Email address" aria-describedby="basic-addon2">
                    <button class="btn btn-primary" type="button">Subscribe</button>
                </div>
            </div>
        </div>
        <hr class="my-4 bg-light">
        <div class="row justify-content-between align-items-center">
            <div class="col-md-6 text-md-start text-center">
                <p>© 2024 Company, Inc. All rights reserved.</p>
            </div>
            <div class="col-md-6 text-md-end text-center">
                <ul class="list-unstyled d-flex justify-content-md-end justify-content-center">
                    <li class="me-3"><a class="link-light" href="#"><i class="bi bi-twitter"></i></a></li>
                    <li class="me-3"><a class="link-light" href="#"><i class="bi bi-instagram"></i></a></li>
                    <li class="me-3"><a class="link-light" href="#"><i class="bi bi-facebook"></i></a></li>
                </ul>
            </div>
        </div>
    </div>
</footer>

</html>
