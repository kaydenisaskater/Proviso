<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@page import="beans.Reservation"%>    
        
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
<% User user = (User)session.getAttribute("user"); %>
  
  <jsp:useBean id=“reservationDao” scope=“application” class=“model.JdbcReservationDao”/>;
 

<%
	    long userId = user.getUserID();
        
        List<Reservation> reservations = reservationDao.list(userId);
        Iterator<Reservation> i = reservations.iterator();
        
        while (i.hasNext()){
        Reservation reservation = i.next();
        %>

<jsp:include page="Templates/Footer.jsp" flush="true"/>
<jsp:include page="Templates/ScriptFooter.jsp" flush="true"/>
</body>
</html>
