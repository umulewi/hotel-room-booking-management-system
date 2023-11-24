<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.util.Base64" %>
      <jsp:include page="roomnav.jsp"/>
<% 
   String driver = "com.mysql.jdbc.Driver";
   String connectionUrl = "jdbc:mysql://localhost:3306/";
   String database = "project"; // Specify your database name here
   String userid = "root";
   String password = "";

   try {
      Class.forName(driver);
   } catch (ClassNotFoundException e) {
      e.printStackTrace();
   }

   Connection connection = null;
   Statement statement = null;
   ResultSet resultSet = null;
%>

<!DOCTYPE html>
<html>
<head>
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
    color: #333;
    transition: background-color 0.3s ease;
}

.edit-link:hover, .delete-link:hover {
    background-color: #e0e0e0;
}

        </style>
</head>
<body>
    <h1>Retrieve information of booked users</h1>
    <table>
        <tr>
            <th>Id</th>
            <th>Names</th>
           
            <th>Email</th>
            <th>Telephone</th>
             <th>Image</th>
            
        </tr>

        <% 
            try {
                connection = DriverManager.getConnection(connectionUrl + database, userid, password);
                statement = connection.createStatement();
                String sql = "SELECT * FROM booked";
                resultSet = statement.executeQuery(sql);

                while (resultSet.next()) {
                String book_id = resultSet.getString("book_id");
                    String names = resultSet.getString("names");
                    String email = resultSet.getString("email");
                     String telephone = resultSet.getString("telephone");
                    byte[] profileImageData = resultSet.getBytes("image");

                    // Encode the image data to Base64 for displaying
                    String uploadedimage = "";
                    if (profileImageData != null && profileImageData.length > 0) {
                        uploadedimage = Base64.getEncoder().encodeToString(profileImageData);
                    }

        %>

        <tr>
            <td><%= book_id %></td>
            <td><%= names %></td>
             <td><%= telephone %></td>
            <td><%= email %></td>
            
            <td><img src="data:image/jpeg;base64,<%= uploadedimage %>" alt="image" width="100" height="100" /></td>
            
        </tr>

        <%
                }

                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
     <jsp:include page="footer.jsp"/>
</body>
</html>
