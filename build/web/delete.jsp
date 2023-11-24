<%@ page import="java.sql.*" %>
<%
    // Retrieve the ID from the request parameter
    String id = request.getParameter("id");

    // Check if the ID is present
    if (id != null && !id.isEmpty()) {
        try {
            // Establish the database connection
            String url = "jdbc:mysql://localhost:3306/project";
            String username = "root";
            String password = "";
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, username, password);

            // Prepare the SQL statement
            String query = "DELETE FROM client WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, id);

            // Execute the delete statement
            int rowsDeleted = statement.executeUpdate();

            // Close the statement and connection
            statement.close();
            connection.close();

            // Check the result of the delete operation
            if (rowsDeleted > 0) {
                response.sendRedirect("select.jsp");
            } else {
                out.println("No record found with the specified ID.");
            }
        } catch (ClassNotFoundException | SQLException e) {
            out.println("Error: " + e.getMessage());
        }
    } else {
        out.println("Invalid ID.");
    }
%>
