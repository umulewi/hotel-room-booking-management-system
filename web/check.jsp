<form method="post" action="" enctype="multipart/form-data" class="mt-5 mx-auto col-10 col-md-8 col-lg-6">
            <div class="mb-3">
              
              <input type="names" name="names" placeholder="Names" class="form-control shadow-none" required>
            </div>
            <div class="mb-4">
              <input type="email" name="email" placeholder="Email" class="form-control shadow-none" required>
              
            </div>
            <div class="mb-4">
              <input type="text" name="telephone"  placeholder="Telephone" class="form-control shadow-none" required>
              
            </div>
            <label>Upload Your Image:</label>

            <div class="mb-4" style="display:flex;">
              
              <input type="file" name="image" class="form-control shadow-none" required>
              
            </div>
            
            <div class="mb-4">

              <input type="text" name="address" placeholder="Address" class="form-control shadow-none">
              
            </div>
            <div class="mb-4">
             <textarea name="comment" class="form-control z-depth-1 h-font" rows="3" placeholder="write your comment..." name="comment" maxlength="150"></textarea>
            </div>
            <label>Choose Your Starting Date</label>
            <div class="mb-4">

              <input type="date" id="starting-date" name="starting_date" placeholder="Starting Date" class="form-control shadow-none">
              
            </div>
            <label>Choose Your Ending Date</label>
            <div class="mb-4">

              <input type="date" id="ending-date" name="ending_date" placeholder="Ending Date" class="form-control shadow-none">
              
            </div>

            <button type="submit" name="submit" class="btn" style="background-color:#b0b435";>Book Now</button>
        </form>


<%@page import="java.io.FileOutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@page import="java.io.InputStream"%> 
<%@page import="java.io.FileInputStream"%> 
<%@page import="java.io.File"%> 
<%@page import="java.sql.DriverManager"%> 
<%@page import="java.sql.ResultSet"%> 
<%@page import="java.sql.PreparedStatement"%> 
<%@page import="java.sql.Connection"%>

<%
if (request.getParameter("submit") != null) {
    String room_id = request.getParameter("room_id");
    String names = request.getParameter("names");
    String email = request.getParameter("email");
    String telephone = request.getParameter("telephone");
    String address = request.getParameter("address");
    String comment = request.getParameter("comment");
    String starting_date = request.getParameter("starting_date");
    String ending_date = request.getParameter("ending_date");

    String target_dir = "booked/"; // specify the directory to which the image should be uploaded
    String target_file = target_dir + new File(request.getPart("image").getSubmittedFileName()).getName();
    Part imagePart = request.getPart("image");
    String imageFileType = target_file.substring(target_file.lastIndexOf(".") + 1).toLowerCase();

    if (imagePart.getSize() > 0) {
        InputStream imageInputStream = imagePart.getInputStream();
        FileOutputStream imageOutputStream = new FileOutputStream(target_file);
        byte[] buffer = new byte[1024];
        int bytesRead;
        while ((bytesRead = imageInputStream.read(buffer)) != -1) {
            imageOutputStream.write(buffer, 0, bytesRead);
        }
        imageOutputStream.close();
        imageInputStream.close();

        PreparedStatement insertStatement = null;
        PreparedStatement updateStatement = null;
        try {
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/roombooking", "root", "");
            
            // Insert into booked table
            String insertQuery = "INSERT INTO booked VALUES(null, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            insertStatement = connection.prepareStatement(insertQuery);
            insertStatement.setString(1, room_id);
            insertStatement.setString(2, names);
            insertStatement.setString(3, email);
            insertStatement.setString(4, telephone);
            insertStatement.setString(5, target_file);
            insertStatement.setString(6, address);
            insertStatement.setString(7, comment);
            insertStatement.setString(8, starting_date);
            insertStatement.setString(9, ending_date);
            insertStatement.executeUpdate();
            
            // Update rooms table
            String updateQuery = "UPDATE rooms SET status='booked' WHERE room_id=?";
            updateStatement = connection.prepareStatement(updateQuery);
            updateStatement.setString(1, room_id);
            updateStatement.executeUpdate();

            out.println("<b>Your booking process has been successful!</b>");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("Booking not successful: " + e.getMessage());
        } finally {
            try {
                if (insertStatement != null) {
                    insertStatement.close();
                }
                if (updateStatement != null) {
                    updateStatement.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
%>
