<%@ page import="java.sql.*" %>
<jsp:include page="navbar.jsp"/>
<html>
<head>
    <title>Retrieve Data</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }

        .edit-link, .delete-link {
            text-decoration: none;
            padding: 5px 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
            background-color: #f2f2f2;
        }

        .edit-link:hover, .delete-link:hover {
            background-color: #e0e0e0;
        }
    </style>
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
    %>

    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <h2>Clients Data</h2>

    <table>
        <tr>
            <th>Id</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Address</th>
            <th>Telephone</th>
            <th>password</th>
             <th>Action</th>
            
        </tr>

        <%
            try {
                // Retrieve the data from the database
                Connection connection = getConnection();
                Statement statement = connection.createStatement();
                String query = "SELECT * FROM client";
                ResultSet resultSet = statement.executeQuery(query);

                // Output the retrieved data
                while (resultSet.next()) {
                     
                    String firstname = resultSet.getString("firstname");
                    String lastname = resultSet.getString("lastname");
                    String email = resultSet.getString("email");
                    String address = resultSet.getString("address");
                    String telephone = resultSet.getString("telephone");
                    String password = resultSet.getString("password");
                    String id = resultSet.getString("id");

                    %>
                    <tr>
                        <td><%=id %></td>
                        <td><%= firstname %></td>
                        <td><%= lastname %></td>
                        <td><%= email %></td>
                        <td><%= address %></td>
                        <td><%= telephone %></td>
                        <td><%= password %></td>
                        <td>
                            <a href="edit.jsp?id=<%= id %>" class=" btn btn-primary">Edit</a>
                            <a href="delete.jsp?id=<%= id %>" class=" btn btn-primary">Delete</a>
                        </td>
                        
                    </tr>
                    <%
                }

                // Close the result set, statement, and connection
                resultSet.close();
                statement.close();
                connection.close();
            } catch (ClassNotFoundException | SQLException e) {
                out.println("Error: " + e.getMessage());
            }
        %>
    </table>
    <div style="margin-top: 16rem">
        <jsp:include page="footer.jsp"/>
    </div>
</body>
</html>
