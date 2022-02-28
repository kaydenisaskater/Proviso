<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hotel Reservation</title>

<%--Bootstrap CSS --%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

</head>
<body>

	<%--Top Nav --%>
	<jsp:include page="Templates/Nav.jsp" flush="true" />

	<%--HotelOptions Bean --%>
	<jsp:useBean id="hotelOptions" scope="application"
		class="beans.HotelOptions" />

	<div class="container p-5">
		<div class="hotelReservation mx-auto col-lg-6 shadow-lg bg-body ">
			<h1 class="text-center text-dark p-3">Hotel Reservation</h1>

			<form action="/Proviso/ProvisoServlet" method="post">
				<input type="hidden" name="action" value="createHotelReservation" />

				<%--Main grid for the form --%>
				<div class="form-container d-flex flex-column">

					<%--Room Size --------------------------------------------------------------------------------------------------------------------------------------------%>
					<div class="roomSize row m-3">

						<%--Room Size Title --%>
						<div class="label">
							<label for="roomSize" class="form-label fs-5">Room Size:</label>
						</div>

						<div class="d-flex">
							<%
							int countRoomSize = 0;
							for (String roomSize : hotelOptions.getRoomSizes()) {
								countRoomSize++;
							%>
							<%--Double Full --%>
							<div class="radioButton form-check ms-3">
								<input type="radio" class="form-check-input"
									id="roomSize<%=countRoomSize%>" name="roomSize"
									value="<%=roomSize%>" /> <label
									for="roomSize<%=countRoomSize%>" class="form-check-label"><%=roomSize%></label>
							</div>
							<%
							} //closing room size loop
							%>
						</div>
					</div>

					<%--Amenities --------------------------------------------------------------------------------------------------------------------------------------------%>
					<div class="amenities row m-3">

						<%--Amenities Title --%>
						<div class="label">
							<label for="amenities1" class="form-label fs-5">Amenities:</label>
						</div>

						<div class="d-flex">
							<%
							int countAmenitie = 0;
							for (Map.Entry<String, Double> amenitie : hotelOptions.getAmenities().entrySet()) {
								countAmenitie++;
							%>
							<%--Wi-Fi --%>
							<div class="checkbox form-check ms-3">
								<input type="checkbox" class="form-check-input"
									id="amenities<%=countAmenitie%>" name="amenities[]"
									value="Wi-Fi" /> <label class="form-check-label"
									for="amenities<%=countAmenitie%>"><%=amenitie.getKey()%>
									($<%=amenitie.getValue()%>)</label>
							</div>

							<%
							} //close amenites for loop
							%>

						</div>
					</div>
					<%--Guests --------------------------------------------------------------------------------------------------------------------------------------------%>

					<div class="guest row m-3">
						<div class="d-flex">

							<%--Guest Title --%>
							<div class="label">
								<label for="guest" class="form-label fs-5">Guest:</label>
							</div>

							<%--Guest Select --%>
							<div class="guestSelect ms-3">
								<select class="form-select" id="guest" name="guest">
									<option selected value="0">Select Number of Guest</option>
									<%
									for (Map.Entry<Integer, Double> guest : hotelOptions.getGuests().entrySet()) {
									%>
									<option value="<%=guest.getKey()%>"><%=guest.getKey()%>
										Guest ($<%=guest.getValue()%> per night)
									</option>
									<%
									} //close guest for loop
									%>
								</select>
							</div>

						</div>
					</div>

					<%--Check-in and Check-out date --------------------------------------------------------------------------------------------------------------------------------------------%>

					<div class="Check-inCheck-out row m-3">
						<div class="mb-3">
							<h2 class="fs-5 text-success ">Earn <%=hotelOptions.getLoyaltyPoints() %> loyalty points per night</h2>
						</div>

						<%--Check-in Title --%>
						<div class="d-flex">
							<div class="label">
								<label for="check-in" class="form-label fs-5">Check-in:</label>
							</div>

							<div class="date ms-3">
								<input type="date" class="form-control" id="chek-in"
									name="check-in" />
							</div>
						</div>


						<%--Check-out Title --%>
						<div class="d-flex mt-3">
							<div class="label">
								<label for="check-out" class="form-label fs-5">Check-out:</label>
							</div>

							<div class="date ms-3">
								<input type="date" class="form-control" id="chek-out"
									name="check-out" />
							</div>
						</div>

					</div>
				

					<%--Submit --%>
					<div class="row m-3 p-3">
						<button id="btnSubmit" type="submit" class="btn btn-primary">Submit</button>
					</div>

				</div>
			</form>
		</div>
	</div>

<jsp:include page="Templates/Footer.jsp" flush="true"/>
<jsp:include page="Templates/ScriptFooter.jsp" flush="true"/>
	
</body>

</body>
</html>