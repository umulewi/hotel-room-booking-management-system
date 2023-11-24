<%-- 
    Document   : contactus
    Created on : Jul 5, 2023, 10:56:11 PM
    Author     : Lewis_lele
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="roomnav.jsp"/>
<h2 class="fw-bold h-font text-center" style="color: #b0b453;">
    FIND US
    </h2>
    <div class="container" style="margin-top:12px;">
        <div class="row">
            <div class="col-lg-8 col-md-8 p-4 mb-lg-0 mb-3 bg-light rounded ">
                
                    <iframe class="w-100 rounded" height="340px " src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d63798.177542551086!2d30.042692372502326!3d-2.0007135521899677!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x19dca8a4421b2e29%3A0x1b2bae7af1f7dbd0!2sGatenga%2C%20Kigali!5e0!3m2!1sen!2srw!4v1682931303509!5m2!1sen!2srw"loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
             
            </div>
            <div class="col-lg-4 col-md-4">
                <div class="bg-white p-4 rounded mb-3">
                    <h5 class="fw-bold h-font text-center">Our Contact</h5>
                    <a href="tel:+250787079467" class="d-inline-block mb-2 text-decoration-none text-dark">
                        <i class="bi-telephone-fill"></i>+250787079467
                    </a><br>
                    <a href="tel:+250787079467" class="d-inline-block mb-2 text-decoration-none text-dark">
                        <i class="bi-telephone-fill"></i>+250787079467
                    </a>
                
                
                <form method="post">
                    <h2 class="fw-bold h-font text-center">Send Message</h2>
                <div class="mb-3">
                    <input type="text" name="name"  placeholder="Names" class="form-control shadow" style="height: 3rem;" required>
                </div>
                <div class="mb-3">
                    <input type="email" name="email" placeholder="Email" class="form-control shadow" style="height:3rem" required> 
                </div>
                <div class="form-group shadow-textarea">
                    <textarea name="message" class="form-control z-depth-1 h-font" rows="3" placeholder="Write message here..." required></textarea></div><br>
                    <div><input type="submit" name="send" value="send" class="btn" style="background-color:#b0b453"></div>

                </form>
               

            </div></div>
        </div>
    </div>
<jsp:include page="footer.jsp"/>