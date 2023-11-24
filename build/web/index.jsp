<%-- 
    Document   : 1
    Created on : Jul 4, 2023, 9:18:40 PM
    Author     : Lewis_lele
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="navbar.jsp"/>
<div class="container-fluid">
		<div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-inner" style="height:31rem">
				<div class="carousel-item active">
					<img src="view1.jpg" class="d-block w-100" style="height: 100%"  alt="...">
				</div>
				<div class="carousel-item">
					<img src="view2.jpg" class="d-block w-100" style="height: 100%"  alt="...">
				</div>
				<div class="carousel-item">
					<img src="view3.jpg" class="d-block w-100" style="height: 100%"  alt="...">
				</div>
				<div class="carousel-item">
					<img src="view3.jpg" class="d-block w-100" style="height: 100%"  alt="...">
				</div>
			</div>
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
</div>
<div class="container" style="margin-top: -50px;">
	<div class="row">
		<div class="col-lg-12 bg-white shadow p-3 rounded">
			<h5 class="mb-4">Checking Room Availability</h5>
			<form method="post" action="rooms.php">
				<div class="row align-items-end">
					<div class="col-lg-4 mb-3">
						<label class="form-label" style="font-weight: 500">check-in </label>
						<input type="date" id="starting" name="checkin" class="form-control shadow-none" required>
					</div>
					<div class="col-lg-4 mb-3">
						<label class="form-label" style="font-weight: 500">check-out </label>
						<input type="date" id="ending" name="check-out" class="form-control shadow-none" required>
					</div>
					<div class="col-lg-3 mb-3">
						<label class="form-label" style="font-weight: 500">Adult </label>
						<select class="form-select shadow-none" required>
							
							<option value="1">One</option>
							<option value="2">Two</option>
							<option value="3">Three</option>
						</select></div>
						<div class="col-lg-1 mb-lg mb-3">
							<button type="submit" name="submit" class="btn" style="background-color:#b0b454"><b>Search</b></button>
						</div>

					
				</div>
			</form>
		</div>
	</div>
</div>
<div class="container">
    <div class="row">
        <div class="col-lg-4 col-md-6 my-3">
  <div class="card border-0 shadow" style="max-width: 350px; margin: auto;">
  <img src="room1.jpg" class="card-img-top" style="height: 15rem">
  <div class="card-body">
    <h5>Simple room name</h5>
    <h6 class="mb-4">300$  per night</h6>
    <div class="feature mb-4">
    	<h6 class="mb-1">features</h6>
    	<span class="badge rounded-pill bg-light text-dark mb-3 text-wrap lh-base">
    		2 rooms
        </span>
        <span class="badge rounded-pill bg-light text-dark mb-3 text-wrap lh-base">
    		2 rooms
        </span>
        <span class="badge rounded-pill bg-light text-dark mb-3 text-wrap lh-base">
    		2 rooms
        </span>
    </div>
    <div class="facilities mb-4">
    	<h6 class="mb-1">facilities</h6>
    	<span class="badge rounded-pill bg-light text-dark mb-3 text-wrap lh-base">
    		2 rooms
        </span>
        <span class="badge rounded-pill bg-light text-dark mb-3 text-wrap lh-base">
    		2 rooms
        </span>
        <span class="badge rounded-pill bg-light text-dark mb-3 text-wrap lh-base">
    		2 rooms
        </span>
        <span class="badge rounded-pill bg-light text-dark mb-3 text-wrap lh-base">
    		2 rooms
        </span>
    	<h6 class="mb-1">Rating</h6>

    	<span class="badge rounded-pill bg-light">
    	<i class="bi-star-fill text-warning"></i>
    	<i class="bi-star-fill text-warning"></i>
    	<i class="bi-star-fill text-warning"></i></span>
    	


    </div>
    
    

<div class="d-flex justify-content-evenly mb-2">

    <a href="#" class="btn btn-primary text-white custom-bg shadow-none">booking</a>
    <a href="#" class="btn btn-sm btn-outline-dark shadow-none">More details</a>
</div>
  </div>
</div>

	
		</div>
        
        <div class="col-lg-4 col-md-6 my-3">
	<div class="card border-0 shadow" style="max-width: 350px; margin: auto;">
  <img src="images/room2.jpg" class="card-img-top" style="height: 15rem">
  <div class="card-body">
    <h5>Simple room name</h5>
    <h6 class="mb-4">300$  per night</h6>
    <div class="feature mb-4">
    	<h6 class="mb-1">features</h6>
    	<span class="badge rounded-pill bg-light text-dark mb-3 text-wrap lh-base">
    		2 rooms
        </span>
        <span class="badge rounded-pill bg-light text-dark mb-3 text-wrap lh-base">
    		2 rooms
        </span>
        <span class="badge rounded-pill bg-light text-dark mb-3 text-wrap lh-base">
    		2 rooms
        </span>
    </div>
    <div class="facilities mb-4">
    	<h6 class="mb-1">facilities</h6>
    	<span class="badge rounded-pill bg-light text-dark mb-3 text-wrap lh-base">
    		2 rooms
        </span>
        <span class="badge rounded-pill bg-light text-dark mb-3 text-wrap lh-base">
    		2 rooms
        </span>
        <span class="badge rounded-pill bg-light text-dark mb-3 text-wrap lh-base">
    		2 rooms
        </span>
        <span class="badge rounded-pill bg-light text-dark mb-3 text-wrap lh-base">
    		2 rooms
        </span>
    	<h6 class="mb-1">Rating</h6>

    	<span class="badge rounded-pill bg-light">
    	<i class="bi-star-fill text-warning"></i>
    	<i class="bi-star-fill text-warning"></i>
    	<i class="bi-star-fill text-warning"></i></span>
    	


    </div>

<div class="d-flex justify-content-evenly mb-2">

    <a href="#" class="btn btn-primary text-white custom-bg shadow-none">booking</a>
    <a href="#" class="btn btn-sm btn-outline-dark shadow-none">More details</a>
</div>
  </div>
</div>

	
		</div>
        
        <div class="col-lg-4 col-md-6 my-3">
	<div class="card border-0 shadow" style="max-width: 350px; margin: auto;">
  <img src="images/room2.jpg" class="card-img-top" style="height: 15rem">
  <div class="card-body">
    <h5>Simple room name</h5>
    <h6 class="mb-4">300$  per night</h6>
    <div class="feature mb-4">
    	<h6 class="mb-1">features</h6>
    	<span class="badge rounded-pill bg-light text-dark mb-3 text-wrap lh-base">
    		2 rooms
        </span>
        <span class="badge rounded-pill bg-light text-dark mb-3 text-wrap lh-base">
    		2 rooms
        </span>
        <span class="badge rounded-pill bg-light text-dark mb-3 text-wrap lh-base">
    		2 rooms
        </span>
    </div>
    <div class="facilities mb-4">
    	<h6 class="mb-1">facilities</h6>
    	<span class="badge rounded-pill bg-light text-dark mb-3 text-wrap lh-base">
    		2 rooms
        </span>
        <span class="badge rounded-pill bg-light text-dark mb-3 text-wrap lh-base">
    		2 rooms
        </span>
        <span class="badge rounded-pill bg-light text-dark mb-3 text-wrap lh-base">
    		2 rooms
        </span>
        <span class="badge rounded-pill bg-light text-dark mb-3 text-wrap lh-base">
    		2 rooms
        </span>
    	<h6 class="mb-1">Rating</h6>

    	<span class="badge rounded-pill bg-light">
    	<i class="bi-star-fill text-warning"></i>
    	<i class="bi-star-fill text-warning"></i>
    	<i class="bi-star-fill text-warning"></i></span>
    	


    </div>

<div class="d-flex justify-content-evenly mb-2">

    <a href="#" class="btn btn-primary text-white custom-bg shadow-none">booking</a>
    <a href="#" class="btn btn-sm btn-outline-dark shadow-none">More details</a>
</div>
  </div>
</div>

	
		</div>
    </div>
</div>
<jsp:include page="footer.jsp"/>

