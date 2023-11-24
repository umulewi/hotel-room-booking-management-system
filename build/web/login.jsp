<jsp:include page="navbar.jsp"/>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.*" %>
<%
    // Retrieve the username and password entered in the form
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    // Database connection details
    String url = "jdbc:mysql://localhost:3306/project";
    String dbUsername = "root";
    String dbPassword = "";
    // JDBC code to connect to the database and perform authentication
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, dbUsername, dbPassword);
        // Query to check the username and password
        String query = "SELECT * FROM login WHERE username = ? AND password = ?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, username);
        pstmt.setString(2, password);
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            // Successful login, redirect to a different page
            session.setAttribute("username", username);
            response.sendRedirect("rooms.jsp");
        } else {
            // Invalid login, display an error message
            out.println("<p>Invalid username or password</p>");
           
            
        }
        
        // Close the database connections
        rs.close();
        pstmt.close();
        conn.close();
    } catch (Exception e) {
        out.println("Exception: " + e.getMessage());
    }
%>

  <button type="button" class="btn btn-outline-dark shadow-none me-lg-3 me-2" data-bs-toggle="modal" data-bs-target="#loginModalX">FORGOT PASSWORD</button>
 
<!-- Login Modal -->
  <div class="modal fade" id="loginModalX" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="loginModalLabel">FORGET</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
           <form action="forget.jsp" method="post">
               <div class="mb-3">
              <label for="username" class="form-label">email</label>
              <input type="email" class="form-control" id="username" name="email" required>
            </div>
            
            
            <button type="submit" class="btn btn-primary">Submit</button>
          </form>
        </div>
      </div>
    </div>
  </div>