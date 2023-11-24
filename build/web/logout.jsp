<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Invalidate and destroy the session
 
    if (session != null) {
        session.invalidate();
    }
    // Redirect to login page after logout
    response.sendRedirect("index.jsp");
    
%>
