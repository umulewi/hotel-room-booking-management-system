<%-- 
    Document   : navbar
    Created on : Jul 4, 2023, 8:46:47 PM
    Author     : Lewis_lele
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <title>roombooking</title>
  <!-- Include Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<style>
     .nav-link:{
      margin-right: 5rem;
    }
  </style>
</head>
<body>

  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">
      
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Navbar Items -->
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item active">
          <a class="nav-link" href="index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="rooms.jsp">Rooms</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="aboutus.jsp">About Us</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="contactus.jsp">Contact Us</a>
        </li>
        
        <button type="button" class="btn btn-outline-dark shadow-none me-lg-3 me-2" data-bs-toggle="modal" data-bs-target="#newpassword">change password</button>
        <li class="nav-item">
          <a class="nav-link" href="contactus.jsp"></a>
        </li>
        
        
        <div>
        <li class="nav-item">
          <a class="btn btn-outline-dark shadow-none me-lg-3 me-2" href="logout.jsp">logout</a>
        </li>
        </div>
      </ul>
        
    </div>
  </nav>

  <!-- Login Modal -->
  <div class="modal fade" id="newpassword" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="loginModalLabel">change password</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form action="changepassword.jsp" method="post">
                <div class="form-group">
                    <label for="email-update">Email:</label>
                    <input type="email" class="form-control" id="email-update" name="email-update" required>
                </div>
                <div class="form-group">
                    <label for="current-password">Current Password:</label>
                    <input type="password" class="form-control" id="current-password" name="current-password" required>
                </div>
                <div class="form-group">
                    <label for="new-password">New Password:</label>
                    <input type="password" class="form-control" id="new-password" name="new-password" required>
                </div>
                <div class="form-group">
                    <label for="confirm-new-password">Confirm New Password:</label>
                    <input type="password" class="form-control" id="confirm-new-password" name="confirm-new-password" required>
                </div><br><br><br>
                <center><button type="submit" class="btn btn-primary mb-5">submit</button></center>
            </form>
        </div>
      </div>
    </div>
  </div>

  

  <!-- Include Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


