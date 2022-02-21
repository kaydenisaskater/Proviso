<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List" %>
<%@page import="java.util.Iterator" %>
<%@page import="beans.User"%>
<%@page import="beans.Reservation"%>
<%@page import="beans.Amenity"%>

<jsp:useBean id="reservationDao" scope="application" class="model.JdbcReservationDao" />

        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reservation Summary</title>
    <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
    
</head>
<body>
<jsp:include page="Templates/Nav.jsp" flush="true"/>
<% //User user = (User)session.getAttribute("user"); %>
  
  
 

		<%
	    long userId = 1;
        
        ArrayList<Reservation> reservations = new ArrayList<Reservation>(reservationDao.listAggregatedReservation(userId));
        
        Iterator<Reservation> reservationIterator = reservations.iterator();
        
        while (reservationIterator.hasNext())
        {
        	Reservation reservation = (Reservation)reservationIterator.next();
        	reservation.toString();
        	reservation.getGuestOption().toString();
        	reservation.getRoomSize().toString();
        	List<Amenity> amenities = reservation.getAmenities();
        	Iterator<Amenity> amenityIterator = amenities.iterator();
        	while (amenityIterator.hasNext())
        	{
        		Amenity amenity = (Amenity)amenityIterator.next();
        		amenity.toString();
        	}
        }
        %>

<jsp:include page="Templates/Footer.jsp" flush="true"/>
<jsp:include page="Templates/ScriptFooter.jsp" flush="true"/>
</body>
</html>
