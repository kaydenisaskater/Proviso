<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us</title>
<!--  Bootstrap StyleSheet CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
	
<link 
 
    rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" 
    integrity="sha384-EvBWSlnoFgZlXJvpzS+MAUEjvN7+gcCwH+qh7GRFOGgZO0PuwOFro7qPOJnLfe7l" 
    crossorigin="anonymous">
    
<link rel="stylesheet" type="text/css" href="style.css">
    
    
</head>
    
</head>
<body>

<!-- INCLUDES NAVBAR WITH JSP -->
<jsp:include page="Templates/Nav.jsp" flush="true" />

		 <section class="p-5 text-left text-dark bg-light bg-gradient" >
		 	
			<div class="container">
				<div class="d-sm-flex align-items-bottom ">
					
					<div class="shadow-lg mt-5 mb-5 bg-white rounded w-50">
						<h1 class="ms-4 mb-3 fw-light pt-4 text-lg">Contact <span class="text-primary">Us</span></h1>
						<i class="ms-4 bi bi-telephone-forward-fill text-lg text-primary pt-5"></i>
						<p class="ms-4 pt-2">
			        		555-555-5555
			      		</p>
			      		<i class="ms-4 bi bi-envelope-check-fill text-lg pt-5 text-primary"></i>
						<p class="ms-4 pt-2">
			        		support@proviso.com
			      		</p>
						<i class="ms-4 bi bi-house-fill text-lg pt-5 text-primary"></i>
						<p class="ms-4 pt-2">
			        		1234 Comfort Dr. Somewhere, Someplace 90210
			      		</p>
			      			
					</div>
					
						<div class="d-flex align-items-center ms-5">
							<iframe class="shadow-lg rounded" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3004.2648424146137!2d-95.92035204916499!3d41.1505719791849!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8793886a86ca807f%3A0x838e857240d175eb!2sBellevue%20University!5e0!3m2!1sen!2sus!4v1645541788144!5m2!1sen!2sus" 
						width="400" height="300" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
						</div>
							
				</div>
			</div>
			
		</section> 
		
		<section class="contact-form-bg">
			<div class="container py-5 d-flex justify-content-center">
				<div class="form-box w-50 p-5 bg-white shadow-lg rounded">
					  <h1 class="text-center">Send Us A Message</h1>
					  <p class="text-muted text-center">We would love to hear from you</p>
						  <form action="https://formbucket.com/f/buk_tw2ELQd1Ws7Uw9kw2aHHdnc9" method="post">
							    <div class="form-group py-2">
							      <label for="name">Name</label>
							      <input class="form-control" id="name" type="text" name="Name">
							    </div>
							    
							    <div class="form-group py-2">
							      <label for="email">Email</label>
							      <input class="form-control" id="email" type="email" name="Email">
							    </div>
							    
							    <div class="form-group py-2">
							      <label for="message">Message</label>
							      <textarea class="form-control" id="message" name="Message"></textarea>
							    </div>
							    
							    <div class="text-center py-4">
							    	<input class="btn btn-primary" type="submit" value="Submit" />
							    </div>
							    
							    </div>
						  </form>
				</div>
			</div>
		</section>
		


<!-- INCLUDES FOOTER WITH JSP -->

<jsp:include page="Templates/Footer.jsp" flush="true"/>
<jsp:include page="Templates/ScriptFooter.jsp" flush="true"/>
</body>
</html>