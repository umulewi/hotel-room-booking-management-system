<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Edit Data</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <jsp:include page="navbar.jsp"/>
</head>
<body>
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
        
        // Method to update client data
        private boolean updateClient(String id, String firstname, String lastname, String email, String address, String telephone, String password) throws ClassNotFoundException, SQLException {
            Connection connection = getConnection();
            String query = "UPDATE client SET firstname = ?, lastname = ?, email = ?, address = ?, telephone = ?, password = ? WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, firstname);
            statement.setString(2, lastname);
            statement.setString(3, email);
            statement.setString(4, address);
            statement.setString(5, telephone);
            statement.setString(6, password);
            statement.setString(7, id);
            int rowsUpdated = statement.executeUpdate();
            statement.close();
            connection.close();
            return rowsUpdated > 0;
        }
    %>

    <%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>

    

    <%!
        // Method to retrieve client data by ID
        private ResultSet getClientById(String id) throws ClassNotFoundException, SQLException {
            Connection connection = getConnection();
            String query = "SELECT * FROM client WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, id);
            ResultSet resultSet = statement.executeQuery();
            return resultSet;
        }
    %>

    <%
        // Check if the client ID is present in the request parameter
        String id = request.getParameter("id");
        if (id != null && !id.isEmpty()) {
            try {
                // Check if the form was submitted
                if (request.getMethod().equalsIgnoreCase("post")) {
                    // Retrieve the updated form data
                    String firstname = request.getParameter("firstname");
                    String lastname = request.getParameter("lastname");
                    String email = request.getParameter("email");
                    String address = request.getParameter("address");
                    String telephone = request.getParameter("telephone");
                    String password = request.getParameter("password");

                    // Update the client data
                    boolean updateSuccessful = updateClient(id, firstname, lastname, email, address, telephone, password);

                    // Display the update result message
                    if (updateSuccessful) {
                        response.sendRedirect("select.jsp");
                    } else {
                        out.println("Failed to update data.");
                    }
                }

                // Retrieve the existing client data
                ResultSet resultSet = getClientById(id);

                if (resultSet.next()) {
                    String firstname = resultSet.getString("firstname");
                    String lastname = resultSet.getString("lastname");
                    String email = resultSet.getString("email");
                    String address = resultSet.getString("address");
                    String telephone = resultSet.getString("telephone");
                    String password = resultSet.getString("password");

                    %>
                    <form method="post" action="" class="mt-5 mx-auto col-10 col-md-8 col-lg-6">
                      
                        <input type="hidden" name="id" value="<%= id %>" />
                        <label for="firstname">First Name:</label>
                        <input type="text" name="firstname" id="firstname" value="<%= firstname %>" class="form-control"><br/>
                        <label for="lastname">Last Name:</label>
                        <input type="text" name="lastname" id="lastname" value="<%= lastname %>"  class="form-control"><br/>
                        <label for="email">Email:</label>
                        <input type="text" name="email" id="email" value="<%= email %>"  class="form-control"><br/>
                        <label for="address">Address:</label>
                        <input type="text" name="address" id="address" value="<%= address %>"  class="form-control"><br/>
                        <label for="telephone">Telephone:</label>
                        <input type="text" name="telephone" id="telephone" value="<%= telephone %>"  class="form-control"><br/>
                        <label for="password">Password:</label>
                        <input type="text" name="password" id="password" value="<%= password %>"  class="form-control"><br/>
                        <input type="submit" class="btn btn-primary" value="Update">
                    </form>
                    <%
                } else {
                    out.println("No record found with the specified ID.");
                }

                // Close the result set and connection
                resultSet.close();
            } catch (ClassNotFoundException | SQLException e) {
                out.println("Error: " + e.getMessage());
            }
        } else {
            out.println("Invalid client ID.");
        }
    %>
      <jsp:include page="footer.jsp"/>
</body>
</html>
