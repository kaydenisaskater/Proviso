<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
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
<title>Reservation Lookup</title>
    <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
    
</head>
<body>
<jsp:include page="Templates/Nav.jsp" flush="true"/>
	<form>
		<p>Place Holder For Form</p>	
	</form>
		<%
		//Can be omitted once we establish how we access data members whether it be through a session variable that stores a long or Reservation
		long reservationID = 1;
		try {
			
			/*
			This line of code will more than likely need to be changed to reference a session variable (lookupReservation or lookupReservationID?).
			This entire display will then be displayed based on whether that session variable is empty or not.
			If exists display reservation info.
			Else display record not found.
			
			As it stands it exists as a data dump to showcase what data is available for display.
			*/
        	Reservation reservation = (Reservation)reservationDao.find(reservationID);
        
        	%>
        	<p><%=reservation.toString() + "<br>" + reservation.getRoomSize().toString() + "<br>" + reservation.getGuestOption().toString() + "<br>"%>
        	<%
        	List<Amenity> amenities = reservation.getAmenities();
        	Iterator<Amenity> amenityIterator = amenities.iterator();
        	while (amenityIterator.hasNext())
        	{	
        		Amenity amenity = (Amenity)amenityIterator.next();
        		{
        			if(amenity.getAmenityID() != 0)
        			{
        			%>
        			<%=amenity.toString()%><br>
        			<%
        			}
        		}
        	}
        	%>
        	</p>
        	<% 
		} catch (Exception e){
			e.printStackTrace();
		}
        %>
<jsp:include page="Templates/Footer.jsp" flush="true"/>
<jsp:include page="Templates/ScriptFooter.jsp" flush="true"/>
</body>
</html>
