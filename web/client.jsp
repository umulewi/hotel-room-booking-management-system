<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Insert Data</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
  <div class="row justify-content-center">
    <div class="col-sm-6">
      <form method="post" action="">
        <div class="form-group">
          <label for="firstname">First Name:</label>
          <input type="text" name="firstname" id="firstname" class="form-control form-control" />
        </div>
        <div class="form-group">
          <label for="lastname">Last Name:</label>
          <input type="text" name="lastname" id="lastname" class="form-control form-control" />
        </div>
        <div class="form-group">
          <label for="email">Email:</label>
          <input type="text" name="email" id="email" class="form-control form-control" />
        </div>
        <div class="form-group">
          <label for="address">Address:</label>
          <input type="text" name="address" id="address" class="form-control form-control" />
        </div>
        <div class="form-group">
          <label for="telephone">Telephone:</label>
          <input type="text" name="telephone" id="telephone" class="form-control form-control" />
        </div>
        <div class="form-group">
          <label for="password">Password:</label>
          <input type="text" name="password" id="password" class="form-control form-control" />
        </div>
        <input type="submit" value="Submit" class="btn btn-primary" />
      </form>
    </div>
  </div>
</div>


    
    <%!
        // This method establishes a database connection
        private Connection getConnection() throws ClassNotFoundException, SQLException {
            // Replace with your database credentials
            String url = "jdbc:mysql://localhost:3306/project";
            String username = "root";
            String password = "";
            
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            
            // Establish the connection
            Connection connection = DriverManager.getConnection(url, username, password);
            
            return connection;
        }
    %>
    
    <%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
    <%
        // Check if the form was submitted
        if (request.getMethod().equalsIgnoreCase("post")) {
            // Retrieve the form data
            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String telephone = request.getParameter("telephone");
            String password = request.getParameter("password");
            
            
            // Insert the data into the database
            try {
                Connection connection = getConnection();
                
                // Create the SQL query
                String query = "INSERT INTO client (firstname, lastname, email, address, telephone, password) VALUES (?, ?, ?, ?, ?, ?)";
                PreparedStatement statement = connection.prepareStatement(query);
                statement.setString(1, firstname);
                statement.setString(2, lastname);
                statement.setString(3, email);
                statement.setString(4, address);
                statement.setString(5, telephone);
                statement.setString(6, password);
                
                // Execute the query
                statement.executeUpdate();
                
                // Close the statement and connection
                statement.close();
                connection.close();
                
                response.sendRedirect("select.jsp");
            } catch (ClassNotFoundException | SQLException e) {
                out.println("Error: " + e.getMessage());
            }
        }
    %>
</body>
</html>
