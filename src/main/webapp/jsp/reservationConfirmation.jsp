<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="beans.Reservation" %>
<%@page import="" %>

<jsp:useBean id="hotelOptions" scope="application" class="beans.HotelOptions"/>

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
	Reservation reservation = (Reservation)request.getAttribute("pendingReservation");
%>

<div>
	<h1>Confirm Reservation</h1>
	<p>Room Size: <%=reservation.getRoomSizeID() %></p>
	<%
	String[] amenities = (String[])request.getAttribute("amenities[]");
	
	for (int i = 0; i < amenities.length; i++){
		%>
		<p>Amenity: <%=amenities[i].toString() %></p>
		<%
	}
	%>
	<p>Guest Count: <%=reservation.getGuestOptionID() %></p>
	<p>Check In: <%=reservation.getCheckIn() %></p>
	<p>Check Out: <%=reservation.getCheckOut() %></p>
	
	<%
	String[] perPayRate = (String[])request.getAttribute("perPayRate[]");
	
	for (int i = 0; i < perPayRate.length; i++){
		%>
		<p>Amenity: <%=perPayRate[i].toString() %></p>
		<%
	}
	%>
	<%
	String[] flatPayRate = (String[])request.getAttribute("flatPayRate[]");
	
	for (int i = 0; i < flatPayRate.length; i++){
		%>
		<p>Amenity: <%=flatPayRate[i].toString() %></p>
		<%
	}
	%>
	<p>Flat Pay Rate: <%=request.getAttribute("flatPayRate[]") %></p>
</div>
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