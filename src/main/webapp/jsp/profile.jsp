<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Proviso Profile</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<%
User user = (User)session.getAttribute("user");
%>
<jsp:include page="Templates/Nav.jsp" flush="true"/>
<div class="mx-auto shadow-lg p-3 mb-5 bg-body rounded" style="width: 80%;margin: 2%;">
    <h2 class="text-center">Traveler Information</h2>
    <form action="/Proviso/ProvisoServlet" method="post">
    	<input type="hidden" name="action" value="updateUser"/> 
    	<input type="hidden" name="userId" value="<%=user.getUserID() %>" />
    	<%
    	String errorMessage = (String)request.getSession().getAttribute("errorUpdatingUser");
    	String successfulUpdate = (String)request.getSession().getAttribute("successfulUserUpdate");
    	if (errorMessage != null){	
    	%>
    	<div class="col-12 alert-danger mt-3" role="alert"><%=errorMessage %></div>
    	<%
    	} else if(successfulUpdate != null){
    	%>
    	<div class="col-12 alert-success mt-3" role="alert"><%=successfulUpdate %></div>
    	<%
    	}
    	%>
    	<label for="firstName" class="form-label justify-content-md-start">First Name</label>
    	<input id="firstName" name="firstName" class="form-control justify-content-md-start" type="text" value="<%=user.getFirstName() %>" />
    	<label for="lastName" class="form-label justify-content-md-start">Last Name</label>
    	<input id="lastName" name="lastName" class="form-control justify-content-md-start" type="text" value="<%=user.getLastName() %>" />
    	<label for="email" class="form-label justify-content-md-start">Email</label>
    	<input id="email" name="email" class="form-control justify-content-md-start" type="text" value="<%=user.getEmail() %>"/>
    	<label class="form-label justify-content-md-start">Points: <%=user.getAccruedLoyaltyPoints() %></label>
    	<a class="d-block" href="/Proviso/ProvisoServlet?action=loyaltySummary">Loyalty Points</a>
    	<a class="d-block" href="#">Change password</a>
        <div class="text-center"><button id="btnSubmit" type="submit" class="btn btn-primary">Save</button></div>
        
        <!-- <a href="/Proviso/ProvisoServlet?action=updateUser" class="btn btn-primary">Save</a> -->
    </form>
    <br>
    <jsp:include page="reservationSummary.jsp" flush="true"/>
</div>

<jsp:include page="Templates/Footer.jsp" flush="true"/>
<jsp:include page="Templates/ScriptFooter.jsp" flush="true"/>
</body>
</html>