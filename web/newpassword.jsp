<!DOCTYPE html>
<html>
<head>
  <title>Reset Password</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <style>
    
  </style>
</head>
<body>
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-4">
        <div class="reset-box">
          <h2><center>Reset Password</center></h2>
          <form method="POST" action="reset_password.jsp?id=<%= request.getParameter("id") %>">
            <div class="mb-3 d-flex justify-content-center">
              <input type="password" class="form-control" placeholder="New Password" name="new_pass">
            </div>
            <div class="mb-3 d-flex justify-content-center">
              <input type="password" class="form-control" placeholder=" comfirm  Password" name="repeat_pass">
            </div>
            <div class="d-grid">
              <button type="submit" class="btn btn-primary">Reset Password</button>
            </div>
          </form>
          <p class="mt-3 text-center">
            Remember your password? <a href="login_form.jsp">Login</a>
          </p>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
