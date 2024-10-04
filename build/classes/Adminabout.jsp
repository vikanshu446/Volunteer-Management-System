<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Admin Panel</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }
        .container1 {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #343a40;
        }
        p {
            line-height: 1.6;
            color: #555;
            font-size: 1.1rem;
        }
        .feature-list {
            list-style-type: none;
            padding-left: 20px;
        }
        .feature-list li {
            margin-bottom: 10px;
        }
        .contact-info {
            font-size: 1.1rem;
        }
        @media (max-width: 576px) {
            .container {
                padding: 15px;
            }
            h1 {
                font-size: 28px;
            }
            p {
                font-size: 16px;
            }
            .feature-list {
                padding-left: 15px;
            }
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

<div class="container">
    <h1>About Admin Panel</h1>
    <p>Welcome to the Admin Panel! This panel is designed to provide administrators with tools to manage events, volunteers, and other aspects of the system.</p>
    
    <h2>Features</h2>
    <ul class="feature-list">
        <li>Manage events: Add, edit, and delete events as needed.</li>
        <li>Volunteer management: View volunteer information, assign volunteers to events, and track volunteer participation.</li>
        <li>Reporting and analytics: Generate reports on event attendance, volunteer demographics, and other metrics.</li>
        <li>User management: Manage user accounts, roles, and permissions.</li>
    </ul>

    <h2>How It Works</h2>
    <p>The Admin Panel provides a user-friendly interface for administrators to perform various tasks related to event management and volunteer coordination. It allows for efficient organization and oversight of volunteer activities.</p>
    
    <h2>Contact Us</h2>
    <p class="contact-info">If you have any questions or feedback, please feel free to contact us at <a href="mailto:admin@volunteersystem.com">admin@volunteersystem.com</a>.</p>
</div>
<footer class="py-5 bg-dark" style="margin: 30px 30px; margin-top: 25px; border-radius: 10px;">
    <div class="container">
        <div class="row">
            <div class="col-md-3 mb-4">
                <h5>Section</h5>
                <ul class="nav flex-column">
                    <li class="nav-item mb-2"><a href="AdminDashboard.jsp" class="nav-link p-0 text-muted">Home</a></li>
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

</body>
</html>
