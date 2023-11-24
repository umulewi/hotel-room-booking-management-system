<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
    
</head>
<body>
        <jsp:include page="roomnav.jsp"/>
        
<div style="display: flex; justify-content: center;">
  
  <form name="form1" method="post" action="book.jsp" enctype="multipart/form-data">   <div><h2>fill booking form</h2></div>
    <div class="mb-3">
      <input type="names" name="names" placeholder="Names" class="form-control shadow-none" wi required>
    </div>
    <div class="mb-4">
      <input type="email" name="email" placeholder="Email" class="form-control shadow-none" required>
    </div>
    <div class="mb-4">
      <input type="text" name="telephone" placeholder="Telephone" class="form-control shadow-none" required>
    </div>
    <label>Upload Your Image:</label>
    <div class="mb-4" style="display:flex;"> 
      <input type="file" name="image" class="form-control shadow-none" required> 
    </div>
    <button type="submit" name="submit" class="btn" style="background-color:#b0b435;">Book Now</button>
  </form>
</div>

</body>
</html>
<jsp:include page="footer.jsp"/>

 

