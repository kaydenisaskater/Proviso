<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="beans.Reservation" %>
<%@ page import="beans.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>

<jsp:useBean id="reservationDao" scope="application" class="model.JdbcReservationDao" />
<jsp:useBean id="userDao" scope="application" class="model.JdbcUserDao" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Loyalty Points Lookup</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
<jsp:include page="Templates/Nav.jsp" flush="true"/>
<%
User lookupUser = (User)request.getAttribute("lookupUser");
String lookupError = (String)request.getAttribute("lookupUserError");
String lookupUserMsg = (String)request.getAttribute("lookupUserMsg");
%>
<div class="vh-100">
    <h1 class="text-center mt-5">Loyalty Points Lookup</h1>
    <div class="mx-auto" style="width: 80%;">
        <div class="text-center">
        <%
        if (lookupError != null){
        	%>
        	<div class="col-12 alert-danger mt-3 text-center" role="alert"><%=lookupError %></div>
        	<%
        }
        else if (lookupUserMsg != null){
        	%>
        	<div class="col-12 alert-danger mt-3 text-center" role="alert"><%=lookupUserMsg %></div>
        	<%
        }
        %>
        <form>
        	<input type="hidden" name="action" value="lookup"/>
        	<label class="form-label" for="userId">Customer ID<input type="number" id="userId style="width: 20%;margin: 2%;" name="userId" /></label>
        	<button type="submit" class="btn btn-primary">Search</button>
        </form>
        </div>
        <%
        if (lookupUser != null){
        	
            List<Reservation> reservations = reservationDao.list(lookupUser.getUserID());
            Iterator<Reservation> r = reservations.iterator();
        %>
        <div class="text-center">
        	<h5>User ID: <%= lookupUser.getUserID()%> | Name: <%=lookupUser.getFirstName() + " " + lookupUser.getLastName() %></h5>
        </div>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Order Number</th>
                        <th>Check-In Date</th>
                        <th>Check-Out Date</th>
                        <th>Points Earned</th>
                    </tr>
                </thead>
                <tbody>
                <%  
	                int totalLoyalty = 0;
	                
	                while (r.hasNext()) {
	                	Reservation reservation = r.next();
	                	
	                	totalLoyalty += reservation.getLoyaltyPoints();
                	%>
                    <tr>
                        <td><%=reservation.getReservationID() %></td>
                        <td><%=reservation.getCheckIn() %></td>
                        <td><%=reservation.getCheckOut() %></td>
                        <td><%=reservation.getLoyaltyPoints() %></td>
	                <%
	                }
	                %>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="mx-auto">
    		<p class="text-center">Total Loyalty Points: <%=totalLoyalty %></p>
    	</div>
        <%
		 }
        %>
    </div>
</div>


<jsp:include page="Templates/Footer.jsp" flush="true"/>
<jsp:include page="Templates/ScriptFooter.jsp" flush="true"/>

</body>
</html>