<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>About Us</title>
<!--  Bootstrap StyleSheet CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

</head>
<body>

<!-- INCLUDES NAVBAR WITH JSP -->
<jsp:include page="Templates/Nav.jsp" flush="true" />

		<section class="p-5 text-left text-primary bg-light vh-100" >
			
				<div class="d-sm-flex ms-5 text-left align-items-center ml-3">
					<div class="text-left">
						<h1 class="fw-light pt-5">Proviso</span></h1>
						<p class="text-muted">Who We Are</p>
						<p class="text-dark">
			        		Proviso is a modern one stop shop for booking travel all throughout the world. 
			        		Utilized by many, Proviso was founded on the idea that travel should be rewarding. 
			        		Not just personally, but with great incentives to come back and use the platform 
			        		again. With one of the best member loyalty points programs in the world, Proviso 
			        		provides customers with an added incentive to travel more without breaking the bank. 
			      		</p>
						
						<a href="ProvisoServlet?action=viewLogin" class="btn btn-primary my-2">Book Now</a>
						
					</div>
						<img alt="" src="/Proviso/images/proviso-about.svg" class="img-fluid w-50 ms-5"/>
					
					
				</div>
			
		</section>



</body>
</html>