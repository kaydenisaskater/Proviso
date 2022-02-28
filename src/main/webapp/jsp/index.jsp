<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%@ page import="beans.User" %>
<%@ page import="model.JdbcUserDao" %>
<%@ page import="controller.ProvisoServlet" %>

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
	<%
	User user = (User)session.getAttribute("user");
	
	
	String successfulLogin = (String)request.getSession().getAttribute("successfulLogin");
	String successfulLogout = (String)request.getSession().getAttribute("successfulLogout");
	String successfulReservation = (String)request.getSession().getAttribute("successfulReservation");
	if (successfulLogin != null){
	%>
	<div class="col-12 alert-success mt-3 text-center" role="alert"><%=successfulLogin %></div>
	<%
	}else if (successfulLogout != null){
	%>
	<div class="col-12 alert-success mt-3 text-center" role="alert"><%=successfulLogout %></div>
	<%
	} else if(successfulReservation != null){
	%>
	<div class="col-12 alert-success mt-3 text-center" role="alert"><%=successfulReservation %></div>
	<%
	}
	%>
	
		<section class="text-left d-flex align-items-start text-light bg-white  shadow-lg vh-75" >
			<div class="container my-5 mx-0">
				<div class="ms-5 ps-5 d-flex align-items-center">
					<div class="shadow-lg p-3 mb-5 bg-body ms-5 mt-5 rounded vw-75">
						<h1 class="fw-light text-primary">Book Now</h1>
						<p class="text-muted">Travel Better</p>
						<p class="text-dark">With 1000's of hotels to choose from around the world, Proviso 
						gives users lots of options without the headache. We offer a 100% satisfactory guarantee
						that if you are unhappy with our service, we will issue a full refund and double your points 
						on your next stay.
						</p>
						<div class="text-center">
							<a href="<% if (user != null) { %>/Proviso/ProvisoServlet?action=reservation <% } else {%> /Proviso/ProvisoServlet?action=viewLogin <%} %>" class="btn btn-primary my-2">Let's Travel</a>
						</div>	
					</div>
					<img alt="" src="/Proviso/images/proviso-home.svg" class="img-fluid ms-3 w-50 ms-3 ps-5 pt-1"/>
				</div>		
			</div>
		</section>
		
		<section class="text-left d-flex align-items-center text-light bg-light shadow-lg vh-75" >
			<div class="container my-5 mx-0">
				<div class="ms-5 ps-5 d-flex align-items-center">
				<img alt="" src="/Proviso/images/proviso-points.svg" class="img-fluid ms-3 w-50 ps-1 pt-5"/>
					<div class="shadow-lg bg-body p-3 mb-5 ms-5 mt-5 rounded vw-75">
						<h1 class="fw-light text-primary">Earn Points</h1>
						<p class="text-muted">Get Rewarded</p>
						<p class="text-dark">Booking hotels should be rewarded no matter where you stay. With the most generous
						loyalty programs on the planet, when your head hits the pillow at night, you earn points on your
						next stay anywhere.
						</p>
						<div class="text-center">

							<a href="/Proviso/ProvisoServlet?action=aboutUs" class="btn btn-primary my-2">Learn More</a>

						</div>	
					</div>
					
				</div>		
			</div>
		</section>
		
		
		<section class="pt-1 text-left align-items-center bg-white mb-4">
			<div class="container mt-2 mb-5">
				<i class="texr-center bi bi-arrow-bar-down" style="font-size: 5rem; color: cornflowerblue;"></i>
				<h1 class="mb-5 text-left">Popular Places To Stay</h1>
				<h3 class="text-muted mb-3">The US</h3>
				<div class="row">
					<div class="col-4">
						<div class="card h-100 bg-white shadow-lg rounded">
							 
							  <img src="/Proviso/images/proviso-wynn.jpeg" class="card-img-top img-fluid" alt="...">
							  <div class="card-body">
							    <h5 class="card-title">The Wynn: <span class="text-muted">Las Vegas, NV</span> </h5>
							    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
							    <h5 class="text-dark d-flex justify-content-start">From $99/Night</h5>
							    <div class="d-flex justify-content-end">
							    	
							    	<i class="bi bi-star-fill text-warning"></i>
								    <i class="bi bi-star-fill text-warning"></i>
								    <i class="bi bi-star-fill text-warning"></i>
								    <i class="bi bi-star-fill text-warning"></i>
							    	<i class="bi bi-star-half text-warning"></i>
							    </div>
							    <button type="button" class="btn btn-light btn-sm text-left text-dark d-flex justify-content-start" data-bs-toggle="modal" data-bs-target="#exampleModal">
										 Amenities <i class="bi bi-arrow-up-right-circle ms-2"></i>
								</button>
								
								<!-- Modal -->
								<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
								  <div class="modal-dialog modal-dialog-centered">
								    <div class="modal-content">
								      <div class="modal-header bg-primary">
								        <h5 class="modal-title text-white" id="exampleModalLabel">What does this hotel offer?</h5>
								        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								      </div>
								      <div class="modal-body">
								      <div class="d-flex justitify-content-center align-items-center">
										<div class="container">
											<div class="row row-cols-2 g-3">
												<div class="col">
													<div class="card shadow-lg rounded bg-white">
															<div class="card-body text-center">
																<i class="bi bi-egg-fried">  Breakfast</i>
															</div>
													</div>
												</div>
												
												<div class="col">
													<div class="card shadow-lg rounded bg-white">
															<div class="card-body text-center">
																<i class="bi bi-wifi">  Wi-Fi</i>
															</div>
													</div>
												</div>
												
												<div class="col">
													<div class="card shadow-lg rounded bg-white">
															<div class="card-body text-center">
																<i class="bi bi-credit-card">  Valet Parking</i>
															</div>
													</div>
												</div>
												
												<div class="col">
													<div class="card shadow-lg rounded bg-white">
															<div class="card-body text-center">
																<i class="bi bi-life-preserver">  Pool</i>
															</div>
													</div>
												</div>
											</div>
											
										</div>
								      	
								      </div>
								        
								        
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
								        
								      </div>
								    </div>
								  </div>
								</div>
								
							    <div class="text-center mt-4 mb-3">
							    	<a href="/Proviso/ProvisoServlet?action=viewLogin" class="btn btn-primary">Book Now</a>
							    </div>							    
							  </div>
						</div>
					</div>	
					
					<div class="col-4">
						<div class="card h-100 bg-white shadow-lg rounded">
							  <img src="/Proviso/images/proviso-plaza-new-york.jpeg" class="card-img-top img-fluid" alt="...">
							  <div class="card-body">
							    <h5 class="card-title">The Plaza: <span class="text-muted">New York, NY</span></h5>
							    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
							    <h5 class="text-dark d-flex justify-content-start">From $179/Night</h5>
							    <div class="d-flex justify-content-end">
							    	<i class="bi bi-star-fill text-warning"></i>
								    <i class="bi bi-star-fill text-warning"></i>
								    <i class="bi bi-star-fill text-warning"></i>
								    <i class="bi bi-star-fill text-warning"></i>
							    	<i class="bi bi-star-fill text-warning"></i>
							    </div>
							    
							    <button type="button" class="btn btn-light btn-sm text-left text-dark d-flex justify-content-start" data-bs-toggle="modal" data-bs-target="#exampleModal">
										 Amenities <i class="bi bi-arrow-up-right-circle ms-2"></i>
								</button>
								
							    <div class="text-center mt-4 mb-3">
							    	<a href="/Proviso/ProvisoServlet?action=viewLogin" class="btn btn-primary">Book Now</a>
							    </div>
							  </div>
						</div>
					</div>
					
					<div class="col-4">	
						<div class="card h-100 bg-white shadow-lg rounded">
							  <img src="/Proviso/images/proviso-big-sky.jpeg" class="card-img-top img-fluid" alt="...">
							  <div class="card-body">
							    <h5 class="card-title">Big Sky Resort: <span class="text-muted">Big Sky, MT</span></h5>
							    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
							    <h5 class="text-dark d-flex justify-content-start">From $199/Night</h5>
							    <div class="d-flex justify-content-end">
							    	<i class="bi bi-star-fill text-warning"></i>
								    <i class="bi bi-star-fill text-warning"></i>
								    <i class="bi bi-star-fill text-warning"></i>
								    <i class="bi bi-star-fill text-warning"></i>
							    	<i class="bi bi-star-fill text-warning"></i>
							    </div>
							    
							    <button type="button" class="btn btn-light btn-sm text-left text-dark d-flex justify-content-start" data-bs-toggle="modal" data-bs-target="#exampleModal">
										 Amenities <i class="bi bi-arrow-up-right-circle ms-2"></i>
								</button>
								
							    <div class="text-center mt-4 mb-3">
							    	<a href="/Proviso/ProvisoServlet?action=viewLogin" class="btn btn-primary">Book Now</a>
							    </div>
							  </div>
						</div>
					</div>
					
					<h3 class="text-muted mt-5">International</h3>
					<div class="col-4 mt-1">
						<div class="card h-100 bg-white shadow-lg rounded">
							  <img src="/Proviso/images/proviso-dreams.jpeg" class="card-img-top img-fluid" alt="...">
							  <div class="card-body">
							    <h5 class="card-title">Dreams: <span class="text-muted">Cancun, Mexico</span></h5>
							    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
							    <h5 class="text-dark d-flex justify-content-start">From $249/Night</h5>
							    <div class="d-flex justify-content-end">
							    	<i class="bi bi-star-fill text-warning"></i>
								    <i class="bi bi-star-fill text-warning"></i>
								    <i class="bi bi-star-fill text-warning"></i>
								    <i class="bi bi-star-fill text-warning"></i>
							    	<i class="bi bi-star-half text-warning"></i>
							    </div>
							    
							    <button type="button" class="btn btn-light btn-sm text-left text-dark d-flex justify-content-start" data-bs-toggle="modal" data-bs-target="#exampleModal">
										 Amenities <i class="bi bi-arrow-up-right-circle ms-2"></i>
								</button>
								
							    <div class="text-center mt-4 mb-3">
							    	<a href="/Proviso/ProvisoServlet?action=viewLogin" class="btn btn-primary">Book Now</a>
							    </div>
							  </div>
						</div>
					</div>
					
					<div class="col-4 mt-1">	
						<div class="card h-100 bg-white shadow-lg rounded">
							  <img src="/Proviso/images/proviso-bora.jpeg" class="card-img-top img-fluid" alt="...">
							  <div class="card-body">
							    <h5 class="card-title">The Four Seasons: <span class="text-muted">Bora Bora</span></h5>
							    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
							    <h5 class="text-dark d-flex justify-content-start">From $399/Night</h5>
							    <div class="d-flex justify-content-end">
							    	<i class="bi bi-star-fill text-warning"></i>
								    <i class="bi bi-star-fill text-warning"></i>
								    <i class="bi bi-star-fill text-warning"></i>
								    <i class="bi bi-star-fill text-warning"></i>
							    	<i class="bi bi-star-half text-warning"></i>
							    </div>
							    
							    <button type="button" class="btn btn-light btn-sm text-left text-dark d-flex justify-content-start" data-bs-toggle="modal" data-bs-target="#exampleModal">
										 Amenities <i class="bi bi-arrow-up-right-circle ms-2"></i>
								</button>
								
							    <div class="text-center mt-4 mb-3">
							    	<a href="/Proviso/ProvisoServlet?action=viewLogin" class="btn btn-primary">Book Now</a>
							    </div>
							  </div>
						</div>
					</div>
					
					<div class="col-4 mt-1">	
						<div class="card h-100 bg-white shadow-lg rounded">
							  <img src="/Proviso/images/proviso-sydney.jpeg" class="card-img-top img-fluid" alt="...">
							  <div class="card-body">
							    <h5 class="card-title">Shangri-La: <span class="text-muted">Sydney, NSW</span></h5>
							    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
							    <h5 class="text-dark d-flex justify-content-start">From $299/Night</h5>
							    <div class="d-flex justify-content-end">
							    	<i class="bi bi-star-fill text-warning"></i>
								    <i class="bi bi-star-fill text-warning"></i>
								    <i class="bi bi-star-fill text-warning"></i>
								    <i class="bi bi-star-fill text-warning"></i>
							    	<i class="bi bi-star-fill text-warning"></i>
							    </div>
							    
							    <button type="button" class="btn btn-light btn-sm text-left text-dark d-flex justify-content-start" data-bs-toggle="modal" data-bs-target="#exampleModal">
										 Amenities <i class="bi bi-arrow-up-right-circle ms-2"></i>
								</button>
								
							    <div class="text-center mt-4 mb-3">
							    	<a href="/Proviso/ProvisoServlet?action=viewLogin" class="btn btn-primary">Book Now</a>
							    </div>
							  </div>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		
		
		<section class="text-dark bg-light shadow-lg">
			
			<div class="container bg-light d-flex justify-content-center align-items-center">
				
				<div id="carouselExampleIndicators" class="carousel slide shadow-lg rounded vh-50 w-50 my-5" data-bs-ride="carousel">
				  	<div class="carousel-indicators">
					    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
					    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
					    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
				  	</div>
				  	
					<div class="carousel-inner">
						 <div class="carousel-item active">
						      <img src="/Proviso/images/proviso-coffee-shop.jpeg" class="d-block w-100 vh-50" alt="...">
						      	
						      	<div class="carousel-caption d-none d-md-block">
							        <h5>Coffee Shops</h5>
							        <p>Check out local coffee shops.</p>
							    </div>
						      	
						  </div>
						  
						  <div class="carousel-item">
						     	<img src="/Proviso/images/proviso-cherry-blossoms.jpeg" class="d-block w-100 vh-50" alt="...">
						     	 
						     	 <div class="carousel-caption d-none d-md-block">
							        <h5>Landmarks</h5>
							        <p>See some of the worlds most famous landmarks.</p>
							     </div>
						     	 
						    </div>
						    
						    <div class="carousel-item">
						      	<img src="/Proviso/images/proviso-theme-park.jpeg" class="d-block w-100 vh-50" alt="...">
						      	
						      	<div class="carousel-caption d-none d-md-block">
							        <h5>Theme Parks</h5>
							        <p>Add a little extra adventure to your trip.</p>
							     </div>
						      	
						   	</div>
					 </div>
					 
						  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
							    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
							    <span class="visually-hidden">Previous</span>
						  </button>
						  
						  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
							    <span class="carousel-control-next-icon" aria-hidden="true"></span>
							    <span class="visually-hidden">Next</span>
						  </button>
						  
				</div>
			
			</div>
		</section>	
		
	</main>
	<jsp:include page="Templates/Footer.jsp" flush="true"/>
	<jsp:include page="Templates/ScriptFooter.jsp" flush="true"/>
</body>
</html>