
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <style>
        h2 {
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            border-spacing: 0;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
            color: #333;
            font-weight: bold;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
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
        header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px;
            border-bottom: 1px solid #ddd;
            background-color: #fff;
        }
        header .nav {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }
        header .nav li {
            display: inline;
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <header>
        <div>
            <a href="/" class="d-inline-flex link-body-emphasis text-decoration-none">
                <svg class="bi" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
            </a>
        </div>
        <nav>
            <ul class="nav">
                <li><a href="AdminDashboard.jsp" class="nav-link px-2 link-secondary">Home</a></li>
                <li><a href="AddEvent.jsp" class="nav-link px-2">Add Event</a></li>
                <li><a href="AdminEvent.jsp" class="nav-link px-2">Event</a></li>
                <li><a href="Adminabout.jsp" class="nav-link px-2">About</a></li>
            </ul>
        </nav>
        <div>
            <button type="button" class="btn btn-primary" onclick="window.location.href='registration.jsp'">LogOut</button>
        </div>
    </header>
    <div class="container">
        <h2>List of Volunteers</h2>
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Contact Number</th>
                    <th>Email</th>
                    <th>Age</th>
                    <th>Gender</th>
                    <th>Date of Birth</th>
                    <th>Skills</th>
                    <th>Working Days</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    Connection conn = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;

                    try {
                        // Database connection parameters
                        String url = "jdbc:mysql://localhost:3306/volunteer";
                        String username = "root";
                        String password = "root";

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
                %>
                    <tr>
                        <td><%= rs.getString("name") %></td>
                        <td><%= rs.getString("contact_no") %></td>
                        <td><%= rs.getString("email") %></td>
                        <td><%= rs.getInt("age") %></td>
                        <td><%= rs.getString("gender") %></td>
                        <td><%= rs.getString("dob") %></td>
                        <td><%= rs.getString("skills") %></td>
                        <td><%= rs.getString("working_days") %></td>
                    </tr>
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
            </tbody>
        </table>
    </div>
    <div class="container">
        <h2>List of Participants Volunteer Data</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Event Name</th>
                    <th>Volunteer Name</th>
                    <th>Email</th>
                    <th>Contact Number</th>
                    <th>Experience</th>
                    <th>Skills</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    // Resetting variables for the next block
                    conn = null;
                    pstmt = null;
                    rs = null;

                    try {
                        // Database connection parameters (repeating for demonstration purposes, consider moving to a separate class)
                        String url = "jdbc:mysql://localhost:3306/volunteer";
                        String username = "root";
                        String password = "root";

                        // Establish connection
                        Class.forName("com.mysql.jdbc.Driver");
                        conn = DriverManager.getConnection(url, username, password);

                        // Create SQL query
                        String sql = "SELECT * FROM VolunteerData";

                        // Create PreparedStatement
                        pstmt = conn.prepareStatement(sql);

                        // Execute the query
                        rs = pstmt.executeQuery();

                        // Loop through the result set and display data
                        while (rs.next()) {
                %>
                    <tr>
                        <td><%= rs.getInt("id") %></td>
                        <td><%= rs.getString("EventName") %></td>
                        <td><%= rs.getString("vName") %></td>
                        <td><%= rs.getString("vEmail") %></td>
                        <td><%= rs.getString("vContactNo") %></td>
                        <td><%= rs.getString("experience") %></td>
                        <td><%= rs.getString("skills") %></td>
                    </tr>
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
            </tbody>
        </table>
    </div>
</body>
</html>
