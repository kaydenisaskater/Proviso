<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
	
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">	
	
<link rel="stylesheet" type="text/css" href="style.css">	


</head>
<body>

	<jsp:include page="Templates/Nav.jsp" flush="true" />
	
	<main>
	
		<section class="pt-5 text-left align-items-center text-light bg-light" >
			<div class="container mx-0 vh-75">
				<div class="ms-5 ps-5 d-flex align-items-center">
					<div class="shadow-lg p-3 mb-5 bg-body mt-5 rounded vw-75">
						<h1 class="fw-light text-primary">BOOK NOW</h1>
						<p class="text-muted">Travel Better</p>
						<p class="text-dark">Booking hotels should be rewarded no matter where you stay. With the most generous
						loyalty programs on the planet, when your head hits the pillow at night, you earn points on your
						next stay anywhere.
						</p>
						<div class="text-center">

							<a href="/Proviso/ProvisoServlet?action=viewLogin" class="btn btn-primary my-2">Book A Trip</a>

						</div>
						
						
					</div>
					<img alt="" src="/Proviso/images/proviso-home.svg" class="img-fluid ms-5 w-50 ps-5 pt-5"/>
				</div>		
			</div>
		</section>
		
		<section>
			<div class="container bg-white mt-5 mb-5">
				<i class="texr-center bi bi-arrow-bar-down" style="font-size: 5rem; color: cornflowerblue;"></i>
				<h1 class="mb-5">Popular Places To Stay</h1>
				<div class="row">
					<div class="col-4">
						<div class="card h-100 bg-white shadow-lg rounded">
							  <img src="/Proviso/images/proviso-wynn.jpeg" class="card-img-top img-fluid" alt="...">
							  <div class="card-body">
							    <h5 class="card-title">The Wynn: Las Vegas, US</h5>
							    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
							    <div class="d-flex justify-content-end">
							    	<i class="bi bi-star-fill"></i>
								    <i class="bi bi-star-fill"></i>
								    <i class="bi bi-star-fill"></i>
								    <i class="bi bi-star-fill"></i>
							    	<i class="bi bi-star-half"></i>
							    </div>
							    <div class="text-center mt-4 mb-3">
							    	<a href="/Proviso/ProvisoServlet?action=viewLogin" class="btn btn-primary">Book</a>
							    </div>							    
							  </div>
						</div>
					</div>	
					
					<div class="col-4">
						<div class="card h-100 bg-white shadow-lg rounded">
							  <img src="/Proviso/images/proviso-dreams.jpeg" class="card-img-top img-fluid" alt="...">
							  <div class="card-body">
							    <h5 class="card-title">Dreams: Cancun, Mexico</h5>
							    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
							    <div class="d-flex justify-content-end">
							    	<i class="bi bi-star-fill"></i>
								    <i class="bi bi-star-fill"></i>
								    <i class="bi bi-star-fill"></i>
								    <i class="bi bi-star-fill"></i>
							    	<i class="bi bi-star-fill"></i>
							    </div>
							    <div class="text-center mt-4 mb-3">
							    	<a href="/Proviso/ProvisoServlet?action=viewLogin" class="btn btn-primary">Book</a>
							    </div>
							  </div>
						</div>
					</div>
					
					<div class="col-4">	
						<div class="card h-100 bg-white shadow-lg rounded">
							  <img src="/Proviso/images/proviso-bora.jpeg" class="card-img-top img-fluid" alt="...">
							  <div class="card-body">
							    <h5 class="card-title">The Four Seasons: Bora Bora</h5>
							    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
							    <div class="d-flex justify-content-end">
							    	<i class="bi bi-star-fill"></i>
								    <i class="bi bi-star-fill"></i>
								    <i class="bi bi-star-fill"></i>
								    <i class="bi bi-star-fill"></i>
							    	<i class="bi bi-star-fill"></i>
							    </div>
							    <div class="text-center mt-4 mb-3">
							    	<a href="/Proviso/ProvisoServlet?action=viewLogin" class="btn btn-primary">Book</a>
							    </div>
							  </div>
						</div>
					</div>
					
					<div class="col-4 mt-5">	
						<div class="card h-100 bg-white shadow-lg rounded">
							  <img src="/Proviso/images/proviso-plaza-new-york.jpeg" class="card-img-top img-fluid" alt="...">
							  <div class="card-body">
							    <h5 class="card-title">The Plaza: New York, US</h5>
							    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
							    <div class="d-flex justify-content-end">
							    	<i class="bi bi-star-fill"></i>
								    <i class="bi bi-star-fill"></i>
								    <i class="bi bi-star-fill"></i>
								    <i class="bi bi-star-fill"></i>
							    	<i class="bi bi-star-half"></i>
							    </div>
							    <div class="text-center mt-4 mb-3">
							    	<a href="/Proviso/ProvisoServlet?action=viewLogin" class="btn btn-primary">Book</a>
							    </div>
							  </div>
						</div>
					</div>
					
					<div class="col-4 mt-5">	
						<div class="card h-100 bg-white shadow-lg rounded">
							  <img src="/Proviso/images/proviso-big-sky.jpeg" class="card-img-top img-fluid" alt="...">
							  <div class="card-body">
							    <h5 class="card-title">Big Sky Resort: Big Sky, US</h5>
							    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
							    <div class="d-flex justify-content-end">
							    	<i class="bi bi-star-fill"></i>
								    <i class="bi bi-star-fill"></i>
								    <i class="bi bi-star-fill"></i>
								    <i class="bi bi-star-fill"></i>
							    	<i class="bi bi-star-half"></i>
							    </div>
							    <div class="text-center mt-4 mb-3">
							    	<a href="/Proviso/ProvisoServlet?action=viewLogin" class="btn btn-primary">Book</a>
							    </div>
							  </div>
						</div>
					</div>
					
					<div class="col-4 mt-5">	
						<div class="card h-100 bg-white shadow-lg rounded">
							  <img src="/Proviso/images/proviso-bora.jpeg" class="card-img-top img-fluid" alt="...">
							  <div class="card-body">
							    <h5 class="card-title">The Four Seasons: Bora Bora</h5>
							    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
							    <div class="d-flex justify-content-end">
							    	<i class="bi bi-star-fill"></i>
								    <i class="bi bi-star-fill"></i>
								    <i class="bi bi-star-fill"></i>
								    <i class="bi bi-star-fill"></i>
							    	<i class="bi bi-star-fill"></i>
							    </div>
							    <div class="text-center mt-4 mb-3">
							    	<a href="/Proviso/ProvisoServlet?action=viewLogin" class="btn btn-primary">Book</a>
							    </div>
							  </div>
						</div>
					</div>
					
						
						
				</div>
			</div>
		</section>
	</main>
	
	
</body>
</html>