<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.util.*"%>
<%
try {
  String id = request.getParameter("id");
  String newPassword = request.getParameter("new_pass");
  String repeatPassword = request.getParameter("repeat_pass");
  if (newPassword.equals(repeatPassword)) {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
    String query = "UPDATE login SET password = '" + newPassword + "' WHERE id = '" + id + "'";
    Statement stmt = con.createStatement();
    int rowsUpdated = stmt.executeUpdate(query);
    if (rowsUpdated > 0) {
      out.println("Password reset successfully! Please <a href='login_form.jsp'>click here</a> to Login.");
    } else {
      out.println("Failed to reset password. Please try again.");
    }
    stmt.close();
    con.close();
  } else {
    out.println("New password and repeat password do not match. Please try again.");
  }
} catch (ClassNotFoundException e) {
  out.println("Database driver not found.");
} catch (SQLException e) {
  out.println("Database connection error: " + e.getMessage());
} catch (Exception e) {
  out.println("An error occurred: " + e.getMessage());
  e.printStackTrace();
}
%>
