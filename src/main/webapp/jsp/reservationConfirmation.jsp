<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator" %>
<%@page import="beans.Reservation" %>
<%@page import="beans.Amenity" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirm Reservation</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
<jsp:include page="Templates/Nav.jsp" flush="true"/>

<%
try {
	Reservation reservation = (Reservation)session.getAttribute("pendingReservation");
%>

<section>
	
	<div class="container d-flex justify-content-center text-center vh-75 py-5">
		<div class="shadow-lg rounded">
		<h1 class="p-3">Confirm Reservation</h1>
		<p>Room Size: <%= reservation.getRoomSize().getRoomSizeDescription() %></p>
		
		<p>Guest Count: <%= reservation.getGuestOption().getGuestCount() %></p>
		<p>Check In: <%=reservation.getCheckIn() %></p>
		<p>Check Out: <%=reservation.getCheckOut() %></p>
		<h2>Amenities:</h2>
		<%
		ArrayList<Amenity> amenities = reservation.getAmenities();
		Iterator<Amenity> amenityIterator = amenities.iterator();
		while(amenityIterator.hasNext())
		{
			Amenity amenity = (Amenity)amenityIterator.next();
			%>
			<p>ID: <%=amenity.getAmenityID() %>
			<br>Description: <%=amenity.getAmenityDescription() %>
			<br>Price: $<%=amenity.getPrice() %>
			</p>
			<%
		}
		%>
		<h2 class="mb-5">Total Price: $<%=reservation.getTotalPrice() %></h2>
		
		<div class="row mx-3 my-5">
			<a href="/Proviso/ProvisoServlet?action=placeReservation" class="btn btn-primary">Confirm</a>
			<a href="/Proviso/ProvisoServlet?action=editReservation" class="btn btn-danger mt-3">Cancel</a>
		</div>
		</div>
		
		

	</div>

</section>


<%
}
catch (Exception e){
	e.printStackTrace();
}

%>

<jsp:include page="Templates/Footer.jsp" flush="true"/>
<jsp:include page="Templates/ScriptFooter.jsp" flush="true"/>
</body>
</html>