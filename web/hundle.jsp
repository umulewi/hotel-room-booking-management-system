<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // Connect to the MySQL database
    String jdbcUrl = "jdbc:mysql://localhost:3306/your_database_name";
    String dbUsername = "your_mysql_username";
    String dbPassword = "your_mysql_password";

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);
        String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, username);
        statement.setString(2, password);
        ResultSet result = statement.executeQuery();

        if (result.next()) {
            // Login successful, create a session
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            response.sendRedirect("dashboard.jsp");
        } else {
            // Login failed
            response.sendRedirect("login.jsp");
        }

        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
