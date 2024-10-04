<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error</title>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<script>
    swal("Error!", "An error occurred while processing your request.", "error").then(() => {
        window.location.href = "AddVolunteer.jsp"; // Redirect to addVolunteer.jsp
    });
</script>
</body>
</html>
