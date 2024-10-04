<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Success</title>
    <!-- Include SweetAlert CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.1.4/sweetalert2.min.css">
</head>
<body>

<%
// Your server-side logic here if needed
%>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    // Display SweetAlert success message
    Swal.fire({
        icon: 'success',
        title: 'Success!',
        text: 'Volunteer added successfully!',
        confirmButtonText: 'OK'
    }).then((result) => {
        // Redirect to event page after clicking OK
        if (result.isConfirmed) {
            window.location.href = 'AddVolunteer.jsp';
        }else if(result.isConfirmed){
        	window.location.herf='error.jsp'
        }
    });
</script>

</body>
</html>
