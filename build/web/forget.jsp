<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, javax.mail.*"%>
<%@ page import="javax.mail.internet.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Forgot Password</title>
</head>
<body>
<%
try {
  Class.forName("com.mysql.jdbc.Driver");
  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
  String email = request.getParameter("email");
  String query = "SELECT password, id FROM login WHERE email=?";
  PreparedStatement pstmt = con.prepareStatement(query);
  pstmt.setString(1, email);
  ResultSet rs = pstmt.executeQuery();
  if (rs.next()) {
    String password = rs.getString("password");
    String id = rs.getString("id");
    String resetLink = "http://localhost:8080/project/newpassword.jsp?id=" + id;
    String host = "smtp.gmail.com";
    String port = "587";
    String username = "ntegerejimanalewis@gmail.com";
    String smtpPassword = "claflzukklxokmvy";
    Properties props = new Properties();
    props.put("mail.smtp.host", host);
    props.put("mail.smtp.port", port);
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");
    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
      protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(username, smtpPassword);
      }
    });
    MimeMessage message = new MimeMessage(mailSession);
    message.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
    message.setSubject("Password Recovery");
    message.setText("Reset your password: " + resetLink);
    Transport.send(message);
    out.println("Password reset link sent to your email successfully check Your Email!");
  } else {
    out.println("Invalid Email ID!");
  }
  rs.close();
  pstmt.close();
  con.close();
} catch (Exception e) {
  e.printStackTrace();
}
%>
</body>
</html>
