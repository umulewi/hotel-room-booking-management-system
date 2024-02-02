<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    // Check if the user is logged in
  
    String username = (String) session.getAttribute("username");

    if (username == null) {
        // User is not logged in, redirect to login page
        response.sendRedirect("index.jsp");
    }
    else{
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    }
%>


<%-- 
    Document   : rooms
    Created on : Jul 5, 2023, 12:55:53 PM
    Author     : kigali
--%>


<!DOCTYPE html>
<jsp:include page="roomnav.jsp"/>
<div class="my-5 px-4">
    <h2 class="fw-bold h-font text-center">OUR ROOMS</h2>
    <div class="container">
      <div class="row">
<div class="col-lg-3 col-md-12 mb-lg-0 mb-4 px-0">
          <nav class="navbar navbar-expand-lg navbar-light bg-white rounded shadow">
            <div class="container-fluid flex-lg-column align-items-stretch">
              <h4 class="mt-2">FILTERS</h4>
              <button class="navbar-toggler shadow-none" type="button" data-bs-toggle="collapse" data-bs-target="#filterDropdown" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse flex-column align-items-stretch mt-2" id="filterDropdown">
                <form method="post">
                <div class="border bg-light p-3 rounded mb-3">
                  <h5 class="mb-3" style="font-size: 18px;">CHECK AVAILABILITY</h5>
                  <label class="form-label">Check-in</label>
                  <input type="date" id="starting" name="checkin" class="form-control shadow-none mb-3" required>
                  <label class="form-label">Check-Out</label>
                  <input type="date"  id="ending" name="checkout" class="form-control shadow-none" required >
                </div>
                <div class="border bg-light p-3 rounded mb-3">
                  <h5 class="mb-3" style="font-size: 18px;">People</h5>
                   <div class="d-flex">
                    <div class="me-2">
                      <label class="form-label">
                        Adults
                      </label>
                      <input type="number" name="adult" class="form-control shadow-none">
                    </div>
                    <div>
                      <label class="form-label">Children</label>
                      <input type="number" name="childreen" class="form-control shadow-none">
                    </div>
                  </div><br>
                  <input type="submit" name="search" value="SEARCH" class="btn" style="background-color:#b0b435";>
                  
                </div>
              </form>
              </div>
            </div>
          </nav>
        </div>
          <div class="col-lg-9 col-md-12 px-4">
           <div class="row g-0 p-3 align-items-center">
              <div class="col-md-5 mb-lg-0 mb-md-0 mb-3">
                <img src="room1.jpg" class="img-fluid rounded">
              </div>
              <div class="col-md-5 px-lg-3 px-md-3 px-0">
                <h5 class="mb-3">delux</h5>
                <div class="features mb-4">
                  <h6 class="mb-1">Features:</h6>
                  <span class="badge rounded-pill bg-light text-dark text-wrap">
                    bathroom
                  </span>
                  <span class="badge rounded-pill bg-light text-dark text-wrap">
                    TV TV
                  </span>
                  <span class="badge rounded-pill bg-light text-dark text-wrap">
                   WIFI
                  </span>
                </div>
                <div class="guests">
                  <h6 class="mb-1">Guests</h6>
                  <span class="badge rounded-pill bg-light text-dark text-wrap">
                   2 adult
                  </span>
                  <span class="badge rounded-pill bg-light text-dark text-wrap">
                    2 childreen
                  </span>
                </div>
              </div>
              <div class="col-md-2 mt-lg-0 mt-md-0 mt-4 text-center">
                <h6 class="mb-4">26000frw per night </h6>
                <a href="book.php?room_id=<?php echo $row['room_id'] ?>" class="btn btn-sm   shadow-none mb-2" style="background-color: #b0b434;">Book Now</a>
                
                
              </div>
            </div>
              <div class="row g-0 p-3 align-items-center">
              <div class="col-md-5 mb-lg-0 mb-md-0 mb-3">
                <img src="room3.jpg" class="img-fluid rounded">
              </div>
              <div class="col-md-5 px-lg-3 px-md-3 px-0">
                <h5 class="mb-3">suit</h5>
                <div class="features mb-4">
                  <h6 class="mb-1">Features:</h6>
                  <span class="badge rounded-pill bg-light text-dark text-wrap">
                    bathroom
                  </span>
                  <span class="badge rounded-pill bg-light text-dark text-wrap">
                    TV
                  </span>
                  <span class="badge rounded-pill bg-light text-dark text-wrap">
                   WIFI
                  </span>
                </div>
                <div class="guests">
                  <h6 class="mb-1">Guests</h6>
                  <span class="badge rounded-pill bg-light text-dark text-wrap">
                   4 adult
                  </span>
                  <span class="badge rounded-pill bg-light text-dark text-wrap">
                    0 childreen
                  </span>
                </div>
              </div>
              <div class="col-md-2 mt-lg-0 mt-md-0 mt-4 text-center">
                <h6 class="mb-4">170000frw per night </h6>
                <a href="#" class="btn btn-sm   shadow-none mb-2" style="background-color: #b0b434;">Book Now</a>
                
                
              </div>
            </div>
              <div class="row g-0 p-3 align-items-center">
              <div class="col-md-5 mb-lg-0 mb-md-0 mb-3">
                <img src="room3.jpg" class="img-fluid rounded">
              </div>
              <div class="col-md-5 px-lg-3 px-md-3 px-0">
                <h5 class="mb-3">suit</h5>
                <div class="features mb-4">
                  <h6 class="mb-1">Features:</h6>
                  <span class="badge rounded-pill bg-light text-dark text-wrap">
                    bathroom
                  </span>
                  <span class="badge rounded-pill bg-light text-dark text-wrap">
                    TV
                  </span>
                  <span class="badge rounded-pill bg-light text-dark text-wrap">
                   WIFI
                  </span>
                </div>
                <div class="guests">
                  <h6 class="mb-1">Guests</h6>
                  <span class="badge rounded-pill bg-light text-dark text-wrap">
                   4 adult
                  </span>
                  <span class="badge rounded-pill bg-light text-dark text-wrap">
                    0 childreen
                  </span>
                </div>
              </div>
              <div class="col-md-2 mt-lg-0 mt-md-0 mt-4 text-center">
                <h6 class="mb-4">170000frw per night </h6>
                <a href="#" class="btn btn-sm   shadow-none mb-2" style="background-color: #b0b434;">Book Now</a>
                
                
              </div>
            </div>
              
          </div></div>
    </div>
    <jsp:include page="footer.jsp"/>

        
