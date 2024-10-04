<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, com.uniquedeveloper.registration.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Volunteer</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            margin-top: 20px;
            margin-bottom: 20px;
        }
        .form-group label {
            font-weight: bold;
        }
        .form-control {
            width: 60%;
        }
        .btn-update {
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            padding: 10px 20px;
            font-size: 16px;
        }
        .btn-update:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Update Volunteer</h1>
        <% 
            // Servlet logic to fetch data from the database
            String id = request.getParameter("id");
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                // Establish connection
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/volunteer", "root", "root");
                
                // Create SQL query
                String sql = "SELECT * FROM volunteers WHERE id=?";
                
                // Create PreparedStatement
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, id);
                
                // Execute the query
                rs = pstmt.executeQuery();
                
                // Forward to update form JSP page with data
                if (rs.next()) {
                    String name = rs.getString("name");
                    String contactNo = rs.getString("contact_no");
                    String email = rs.getString("email");
                    int age = rs.getInt("age");
                    String gender = rs.getString("gender");
                    String dob = rs.getString("dob");
                    String skills = rs.getString("skills");
                    String workingDays = rs.getString("working_days");
        %>
                    <form action="UpdateVolunteerServlet" method="post">
                        <input type="hidden" name="id" value="<%= id %>">
                        <div class="form-group">
                            <label for="name">Name:</label>
                            <input type="text" id="name" name="name" value="<%= name %>" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="contactNo">Contact No:</label>
                            <input type="text" id="contactNo" name="contactNo" value="<%= contactNo %>" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="email" id="email" name="email" value="<%= email %>" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="age">Age:</label>
                            <input type="text" id="age" name="age" value="<%= age %>" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="gender">Gender:</label>
                            <select id="gender" name="gender" class="form-control">
                                <option value="male" <%= gender.equals("male") ? "selected" : "" %>>Male</option>
                                <option value="female" <%= gender.equals("female") ? "selected" : "" %>>Female</option>
                                <option value="other" <%= gender.equals("other") ? "selected" : "" %>>Other</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="dob">Date of Birth:</label>
                            <input type="date" id="dob" name="dob" value="<%= dob %>" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="skills">Skills:</label>
                            <input type="text" id="skills" name="skills" value="<%= skills %>" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="workingDays">Working Days:</label>
                            <input type="text" id="workingDays" name="workingDays" value="<%= workingDays %>" class="form-control" required>
                        </div>
                        <button type="submit" class="btn btn-update">Update Volunteer</button>
                    </form>
        <% 
                } else {
                    // Handle case where no data is found for the given ID
                    out.println("Volunteer not found");
                }
            } catch (Exception e) {
                e.printStackTrace();
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
    </div>
</body>
</html>
