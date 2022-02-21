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

		<!-- <section class="p-5 text-left text-dark bg-white" >
			<div class="container">
				<div class="d-sm-flex align-items-bottom ">
					
					CONTACT CARD
					<div class="shadow-lg mt-5 mb-5 bg-white rounded w-75">
						<h1 class="ms-3 mb-5 fw-light pt-4 text-lg">Contact <span class="text-primary">Us</span></h1>
						<i class="ms-3 bi bi-telephone-forward-fill text-lg text-primary pt-5"> Phone</i>
						<p class="ms-3 pt-3">
			        		555-555-5555
			      		</p>
			      		<i class="ms-3 bi bi-envelope-check-fill text-lg pt-5 text-primary"> E-mail</i>
						<p class="ms-3 pt-3">
			        		support@proviso.com
			      		</p>
						<i class="ms-3 bi bi-house-fill text-lg pt-5 text-primary"> Address</i>
						<p class="ms-3 pt-3">
			        		1234 Comfort Dr. Somewhere, Someplace 90210
			      		</p>
			      		
						
						
					</div>
						SVG IMG
						<img alt="" src="/Proviso/images/proviso-contact.svg" class="img-fluid w-50 ms-5 pt-5"/>
					
					
				</div>
			</div>
		</section> -->
		
		<section class="contact-form-bg">
			<div class="container py-5 d-flex justify-content-center">
				<div class="form-box w-50 p-5 bg-white shadow-lg rounded">
					  <h1 class="text-center">Reach Out To Us</h1>
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

<jsp:include page="/jsp/Templates/Footer.jsp" flush="true" />


</body>
</html>