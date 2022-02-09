<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
	<jsp:include page="Nav.jsp" flush="true" />
	<main>
		<section class="pt-5 text-center text-light bg-light" >
			<div class="container mx-0">
				<div class="ps- d-sm-flex align-items-center">
					<div>
						<h1 class="fw-light text-primary">Proviso</h1>
						<p class="text-muted">Travel Better</p>
						
						<a href="#" class="btn btn-primary my-2">Book A Trip</a>
						
					</div>
					<img alt="" src="/Proviso/images/proviso-home.svg" class="img-fluid ps-5 pt-5"/>
				</div>
				
				
			</div>
		</section>
	</main>
	
	
</body>
</html>