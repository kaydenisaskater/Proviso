<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="beans.Reservation" %>

<jsp:useBean id="reservationDao" scope="application" class="model.JdbcReservationDao" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Loyalty Points Summary</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
<jsp:include page="Templates/Nav.jsp" flush="true"/>
<div>
    <h1 class="text-center">Loyalty Points</h1>
    <div class="mx-auto" style="width: 80%;">
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
                    <tr>
                        <td>order_id</td>
                        <td>check_in_date</td>
                        <td>check_out_date</td>
                        <td>loyalty_points_earned</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<jsp:include page="Templates/Footer.jsp" flush="true"/>
<jsp:include page="Templates/ScriptFooter.jsp" flush="true"/>
</body>
</html>