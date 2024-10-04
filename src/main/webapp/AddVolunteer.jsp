
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Check if the user is logged in, if not, redirect to login page
    if(session.getAttribute("name") == null) {
        response.sendRedirect("login.jsp");
        return; // Stop further execution of the page
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Volunteer</title>
  
     <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
}

.container {
    width: 50%;
    margin: 0 auto;
    background-color: #fff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    color: #333;
}

form {
    margin-top: 20px;
}

label {
    display: block;
    margin-bottom: 5px;
}

input[type="text"],
input[type="email"],
input[type="date"],
select {
    width: calc(100% - 20px);
    padding: 8px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type="submit"] {
    width: 100%;
    background-color: #4CAF50;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: #45a049;
}

.btn {
    display: inline-block;
    margin-top: 10px;
}

</style>

   
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
   
    <div class="container">
        <h1>Add Volunteer</h1>
        <form action="AddVolunteerServlet" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required><br>
            <label for="contactNo">Contact No:</label>
            <input type="text" id="contactNo" name="contactNo" required><br>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required><br>
            <label for="age">Age:</label>
            <input type="text" id="age" name="age" required><br>
            <label for="gender">Gender:</label>
            <select id="gender" name="gender">
                <option value="">Select Gender</option>
                <option value="male">Male</option>
                <option value="female">Female</option>
                <option value="other">Other</option>
            </select><br>
            <label for="dob">Date of Birth:</label>
            <input type="date" id="dob" name="dob" required><br>
            <label for="skills">Skills:</label>
            <input type="text" id="skills" name="skills" required><br>
            <label for="workingDays">Working Days:</label>
            <input type="text" id="workingDays" name="workingDays" required><br>
            
            <!-- Add more fields as needed -->
            <input type="submit" value="Add Volunteer" class="btn">
        </form>
    </div>
</body>
</html>
