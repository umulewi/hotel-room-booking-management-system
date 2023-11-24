<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<% 
            if (request.getMethod().equals("POST")) {
                String emailUpdate = request.getParameter("email-update");
                String currentPassword = request.getParameter("current-password");
                String newPassword = request.getParameter("new-password");
                String confirmNewPassword = request.getParameter("confirm-new-password");

                String url = "jdbc:mysql://localhost:3306/project";
                String dbUsername = "root";
                String dbPassword = "";

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection(url, dbUsername, dbPassword);

                    PreparedStatement checkUserStmt = conn.prepareStatement("SELECT username, password FROM login WHERE email=? AND password=?");
                    checkUserStmt.setString(1, emailUpdate);
                    checkUserStmt.setString(2, currentPassword);
                    ResultSet userRs = checkUserStmt.executeQuery();

                    if (userRs.next()) {
                        String names = userRs.getString("username");

                        if (newPassword.equals(confirmNewPassword)) {
                            PreparedStatement updatePasswordStmt = conn.prepareStatement("UPDATE login SET password=? WHERE email=?");
                            updatePasswordStmt.setString(1, newPassword);
                            updatePasswordStmt.setString(2, emailUpdate);
                            int rowsAffectedSignup = updatePasswordStmt.executeUpdate();
                            updatePasswordStmt.close();

                            if (rowsAffectedSignup > 0) {
                                out.println("<script>alert('Your password has been updated successfully!'); window.location.href='index.jsp';</script>");
                            } else {
                                out.println("<script>alert('Failed to update password');</script>");
                            }
                        } else {
                            out.println("<script>alert('New passwords do not match');</script>");
                        }
                    } else {
                        out.println("<script>alert('Invalid email or current password');</script>");
                    }

                    userRs.close();
                    checkUserStmt.close();
                    conn.close();
                } catch (Exception e) {
                    out.println("<p>An error occurred: " + e.getMessage() + "</p>");
                }
            }
            %>