<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>


<head>
<meta charset="ISO-8859-1">
<title>Registration</title>

<%--Bootstrap CSS --%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>

<%--Top Nav --%>
<jsp:include page="Templates/Nav.jsp" flush="true"/>



<div class=" container p-5 ">

	<div class="col-lg-4 mx-auto">
		<div class="shadow-lg p-3 mb-5 bg-body rounded">
		<h1 class="text-center text-dark mb-4">Register</h1>
			<form action="/Proviso/ProvisoServlet" method="post">
				<input type="hidden" name="action" value="createUser" />
				
				<%--First Name --%>
				<div class="row flex-row mb-3 mx-3">
				<div class="col-12 m-0 p-0">
				<label for="firstName" class="form-label fs-5">First Name:</label>
				</div>
				
				<div class="col-12 m-0 p-0">
				<input type="text" class="form-control" id="firstName" name="firstName"/>
				</div>
				</div>
				
				<%--Last Name --%>
				<div class="row flex-row mb-3 mx-3">
				<div class="col-12 p-0">
				<label for="lastName" class="form-label fs-5">Last Name:</label>
				</div>
				
				<div class="col-12 p-0">
				<input type="text" class="form-control" id="lastName" name="lastName"/>
				</div>
				</div>
				
				<%--Email --%>
				<div class="row flex-row mb-3 mx-3">
				<div class="col-12 p-0">
				<label for="email" class="form-label fs-5">Email:</label>
				</div>
				
				<div class="col-12 p-0">
				<input type="text" class="form-control" id="email" name="email"/>
				</div>
				
				<!-- Checks if email is valid -->
				<%String errorMessageEmail = (String) request.getSession().getAttribute("errorMessageEmail");
				if(errorMessageEmail != null){%>

				<div class="col-12 alert alert-danger mt-3" role="alert"><%=errorMessageEmail%></div>
				<%} %>
				</div>
				
				<%--Password --%>
				<div class="row flex-row mb-5 mx-3">
				<div class="col-12 m-0 p-0">
				<label for="password" class="form-label fs-5">Password:</label>
				</div>
				
				<div class="col-12 p-0">
				<input type="password" class="form-control" id="password" name="password"/>
				</div>
				
				<!-- Checks if password is valid -->
				<%String errorMessagePassword = (String) request.getSession().getAttribute("errorMessagePassword");
				if(errorMessagePassword != null){%>

				<div class="col-12 alert alert-danger mt-3" role="alert"><%=errorMessagePassword%></div>
				<%} %>
				</div>
				
				<%--Submit --%>
				<div class="row mx-3 mb-4">
				<button id="btnSubmit" type="submit" class="btn btn-primary">Submit</button>
				</div>
				
				<div><a href="/Proviso/ProvisoServlet?action=viewLogin" class="link mt-3 mx-3">Have An Account? Login Here</a></div>
			
			
			</form>
		
		</div>
		
	</div>


</div>

<jsp:include page="Templates/Footer.jsp" flush="true"/>
<jsp:include page="Templates/ScriptFooter.jsp" flush="true"/>
</body>
</body>
</html>