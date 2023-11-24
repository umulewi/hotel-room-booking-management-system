<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@page import="java.io.InputStream"%> 
<%@page import="java.io.FileInputStream"%> 
<%@page import="java.io.File"%> 
<%@page import="java.sql.DriverManager"%> 
<%@page import="java.sql.ResultSet"%> 
<%@page import="java.sql.PreparedStatement"%> 
<%@page import="java.sql.Connection"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert Data</title>
    <!-- Sweet CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.15.5/dist/sweetalert2.min.css">
</head>
<body>
<% 
    if (request.getMethod().equals("POST")) {
        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                ServletFileUpload fileUpload = new ServletFileUpload(new DiskFileItemFactory());
                List<FileItem> items = fileUpload.parseRequest(request);
                
                String productName = "";
                String email= "";
                String productDescription = "";
                InputStream productImage = null;
                
                for (FileItem item : items) {
                    if (!item.isFormField() && item.getFieldName().equals("image")) {
                        productImage = item.getInputStream();
                    } else if (item.getFieldName().equals("names")) {
                        productName = item.getString();
                    } 
                    else if(item.getFieldName().equals("email")) {
                   email = item.getString();
    }
                    else if (item.getFieldName().equals("telephone")) {
                        productDescription = item.getString();
                    }
                }
                
                String url = "jdbc:mysql://localhost:3306/project";
                String dbUsername = "root";
                String dbPassword = "";
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection(url, dbUsername, dbPassword);
                
                PreparedStatement insertProductStmt = conn.prepareStatement("INSERT INTO booked (names,email, telephone, image) VALUES (?, ?, ?, ?)");
                insertProductStmt.setBlob(4, productImage);
                insertProductStmt.setString(1, productName);
                insertProductStmt.setString(2, email);
                insertProductStmt.setString(3, productDescription);
                
                int rowsAffected = insertProductStmt.executeUpdate();
                if (rowsAffected > 0) {
                    out.println("<script>alert('Product inserted successfully!');</script>");
                    response.sendRedirect("welcome.jsp");
                } else {
                    out.println("<script>alert('Failed to insert the product. Please try again.');</script>");
                }
                
                insertProductStmt.close();
                conn.close();
            } catch (Exception e) {
                out.println("<p>An error occurred: " + e.getMessage() + "</p>");
            }
        } else {
            out.println("<script>alert('Invalid form submission.');</script>");
        }
    }
    %>
</body>
</html>

