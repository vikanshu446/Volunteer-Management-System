<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Participation Form</title>
     <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            font-weight: bold;
        }
        input[type="text"],
        input[type="email"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>


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
    <h2>Volunteer Participation Form</h2>
    <form action="ParticipationServlet" method="post">
        <div class="form-group">
            <label for="EventName">Event Name:</label>
            <input type="text" id="EventName" name="EventName" required>
        </div>
        <div class="form-group">
            <label for="vName">Name:</label>
            <input type="text" id="vName" name="vName" required>
        </div>
        <div class="form-group">
            <label for="vEmail">Email:</label>
            <input type="email" id="vEmail" name="vEmail" required>
        </div>
        <div class="form-group">
            <label for="vContactNo">Contact Number:</label>
            <input type="text" id="vContactNo" name="vContactNo" required>
        </div>
        <div class="form-group">
            <label for="Experience">Experience:</label>
            <input type="text" id="Experience" name="Experience">
        </div>
        <div class="form-group">
            <label for="Skills">Skills:</label>
            <input type="text" id="Skills" name="Skills">
        </div>
        <input type="submit" value="Submit">
    </form>
</div>

</body>
</html>
