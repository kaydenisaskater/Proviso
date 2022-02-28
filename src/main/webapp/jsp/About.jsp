<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="beans.User" %>
<html>
<head>
<title>About Us</title>
<!--  Bootstrap StyleSheet CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
	
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

</head>
<body>
<% User user = (User)session.getAttribute("user"); %>

<!-- INCLUDES NAVBAR WITH JSP -->
<jsp:include page="Templates/Nav.jsp" flush="true" />

		<section class="p-5 text-left text-primary bg-white shadow-lg vh-75" >
			
				<div class="d-sm-flex ms-5 text-left align-items-center ml-3">
					<div class="text-left">
						<h1 class="fw-light pt-5">Proviso</h1>
						<p class="text-muted">Who We Are</p>
						<p class="text-dark">
			        		Proviso is a modern one stop shop for booking hotels all throughout the world. 
			        		Utilized by many, Proviso was founded on the idea that travel should be rewarding. 
			        		Not just personally, but with great incentives to come back and use the platform 
			        		again. With one of the best member loyalty points programs in the world, Proviso 
			        		provides customers with an added incentive to travel more without breaking the bank. 
			      		</p>
						
						<a href="<% if (user != null) { %>/Proviso/ProvisoServlet?action=reservation <% } else {%> /Proviso/ProvisoServlet?action=viewLogin <%} %>" class="btn btn-primary my-2">Book Now</a>
						
					</div>
						<img alt="" src="/Proviso/images/proviso-about.svg" class="img-fluid w-50 ms-5"/>					
				</div>	
		</section >
			
		<section class="p-4 bg-primary shadow-lg">
			<div class="container">
				<h2 class="text-center fw-light text-light my-4">Meet Our Team</h2>
				<div class="row row-cols-5 g-2">
					<div class="col">
						<div class="card shadow-lg rounded bg-white">
							<div class="card-body text-center">
								<img alt="" src="/Proviso/images/travis.png" class="rounded-circle mb-3">
								<h3 class="card-title mb-3">Travis</h3>
								<h5 class="text-center text-muted">Developer</h5>
								<p class="card-text"> This is just a bunch of nonsense and filler text for now.</p>
								<a href="#" class="bi bi-meta text-dark mx-1"></a>
								<a href="#" class="bi bi-instagram text-warning mx-1"></a>
								<a href="#" class="bi bi-twitter text-primary mx-1"></a>
							</div>
						</div>
					</div>
					
					<div class="col">
						<div class="card bg-white">
							<div class="card-body shadow-lg rounded text-center">
								<img alt="" src="/Proviso/images/kaymon.png" class="rounded-circle mb-3">
								<h3 class="card-title mb-3">Kaymon</h3>
								<h5 class="text-center text-muted">Developer</h5>
								<p class="card-text"> This is just a bunch of nonsense and filler text now.</p>
								<a href="#" class="bi bi-meta text-dark mx-1"></a>
								<a href="#" class="bi bi-instagram text-warning mx-1"></a>
								<a href="#" class="bi bi-twitter text-primary mx-1"></a>
							</div>
						</div>
					</div>
					
					<div class="col">
						<div class="card bg-white">
							<div class="card-body shadow-lg rounded text-center">
								<img alt="" src="/Proviso/images/james.png" class="rounded-circle mb-3">
								<h3 class="card-title mb-3">James</h3>
								<h5 class="text-center text-muted">Developer</h5>
								<p class="card-text"> This is just a bunch of nonsense and filler text for now.</p>
								<a href="#" class="bi bi-meta text-dark mx-1"></a>
								<a href="#" class="bi bi-instagram text-warning mx-1"></a>
								<a href="#" class="bi bi-twitter text-primary mx-1"></a>
							</div>
						</div>
					</div>
					
					<div class="col">
						<div class="card bg-white">
							<div class="card-body shadow-lg rounded text-center">
								<img alt="" src="/Proviso/images/kayden.png" class="rounded-circle mb-3">
								<h3 class="card-title mb-3">Kayden</h3>
								<h5 class="text-center text-muted">Developer</h5>
								<p class="card-text"> This is just a bunch of nonsense and filler text for now.</p>
								<a href="#" class="bi bi-meta text-dark mx-1"></a>
								<a href="#" class="bi bi-instagram text-warning mx-1"></a>
								<a href="#" class="bi bi-twitter text-primary mx-1"></a>
							</div>
						</div>
					</div>
					
					<div class="col">
						<div class="card bg-white">
							<div class="card-body shadow-lg rounded text-center">
								<img alt="" src="/Proviso/images/daniel.png" class="rounded-circle mb-3">
								<h3 class="card-title mb-3">Daniel</h3>
								<h5 class="text-center text-muted">Developer</h5>
								<p class="card-text"> This is just a bunch of nonsense and filler text for now.</p>
								<a href="#" class="bi bi-meta text-dark mx-1"></a>
								<a href="#" class="bi bi-instagram text-warning mx-1"></a>
								<a href="#" class="bi bi-twitter text-primary mx-1"></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		<section class="p-5 text-left text-primary bg-white shadow-lg vh-75" >
			<h2 class="text-center fw-light text-dark mb-5">Frequently Asked Questions</h2>
			<div class="accordion accordion-flush shadow-lg rounded" id="accordionFlushExample">
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="flush-headingOne">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
				        Do You Have A Guarantee?
				      </button>
				    </h2>
				    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
				      <div class="accordion-body text-dark">YES! We offer a 100% satisfaction guarantee with our service or we will refund your stay and you will automatically earn double points on 
				      your next hotel booking no matter how many days.</div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="flush-headingTwo">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
				        How Do I Earn Loyalty Points?
				      </button>
				    </h2>
				    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
				      <div class="accordion-body text-dark">It is super simple! Earn 150 loyalty points/night when you book a stay through Proviso. These points are automatically
				      added to your account once you book but can only be redeemed after you complete a your stay. After you have earned 750 points, you qualify 
				      for a free night stay anywhere! </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="flush-headingThree">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
				        Are Your Hotels Safe?
				      </button>
				    </h2>
				    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
				      <div class="accordion-body text-dark">Here at Proviso, we pride ourselves on only allowing the best hotels on our platform. This means all of our hotels have a rigorous requirement 
				      for standards and approval on the Proviso platform.</div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="flush-headingFour">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
				        Do You Have Hotels Around The World?
				      </button>
				    </h2>
				    <div id="flush-collapseFour" class="accordion-collapse collapse" aria-labelledby="flush-headingFour" data-bs-parent="#accordionFlushExample">
				      <div class="accordion-body text-dark">Yes we do! Proviso requires all hotels to pass rigorous standards so that all users have peace of mind. 
				      Whether you want to travel abroad or stay close for a stay-cation, we have something to offer.</div>
				    </div>
				  </div>
				</div>
		</section>

	<jsp:include page="Templates/Footer.jsp" flush="true"/>
	<jsp:include page="Templates/ScriptFooter.jsp" flush="true"/>
</body>
</html>