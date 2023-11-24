<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>


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
                
             out.println("<p>well inserted</p>");
            } catch (ClassNotFoundException | SQLException e) {
                out.println("Error: " + e.getMessage());
            }
        }
    %>