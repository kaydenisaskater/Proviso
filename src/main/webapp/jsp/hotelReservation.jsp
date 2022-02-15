<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

	<div class="container p-5">
		<div class="hotelReservation mx-auto col-lg-8 shadow-lg bg-body ">
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

							<%--Double Full --%>
							<div class="radioButton form-check ms-3">
								<input type="radio" class="form-check-input" id="roomSize1"
									name="roomSize" value="Double Full" /> <label for="roomSize1"
									class="form-check-label">Double Full</label>
							</div>

							<%--Queen --%>
							<div class="radioButton form-check ms-3">
								<input type="radio" class="form-check-input" id="roomSize2"
									name="roomSize" value="Queen" /> <label for="roomSize2"
									class="form-check-label">Queen</label>
							</div>

							<%--Double Queen --%>
							<div class="radioButton form-check ms-3">
								<input type="radio" class="form-check-input" id="roomSize3"
									name="roomSize" value="Queen Double" /> <label for="roomSize3"
									class="form-check-label">Queen Double</label>
							</div>

							<%--King --%>
							<div class="radioButton form-check ms-3">
								<input type="radio" class="form-check-input" id="roomSize4"
									name="roomSize" value="King" /> <label for="roomSize4"
									class="form-check-label">King</label>
							</div>

						</div>
					</div>

					<%--Amenities --------------------------------------------------------------------------------------------------------------------------------------------%>
					<div class="amenities row m-3">

						<%--Amenities Title --%>
						<div class="label">
							<label for="amenities1" class="form-label fs-5">Amenities:</label>
						</div>

						<div class="d-flex">

							<%--Wi-Fi --%>
							<div class="checkbox form-check ms-3">
								<input type="checkbox" class="form-check-input" id="amenities1"
									name="amenities[]" value="Wi-Fi" /> <label
									class="form-check-label" for="amenities1">Wi-Fi
									($12.00)</label>
							</div>

							<%--Breakfast --%>
							<div class="checkbox form-check ms-3">
								<input type="checkbox" class="form-check-input" id="amenities2"
									name="amenities[]" value="Breakfast" /> <label
									class="form-check-label" for="amenities2">Breakfast
									($8.99)</label>
							</div>

							<%--Parking --%>
							<div class="checkbox form-check ms-3">
								<input type="checkbox" class="form-check-input" id="amenities3"
									name="amenities[]" value="Parking" /> <label
									class="form-check-label" for="amenities3">Parking
									($19.99)</label>
							</div>

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
									<option value="1">One ($115.00 per night)</option>
									<option value="2">Two ($115.00 per night)</option>
									<option value="3">Three ($150.00 per night)</option>
									<option value="4">Four ($150.00 per night)</option>
									<option value="5">Five ($150.00 per night)</option>
								</select>
							</div>

						</div>
					</div>

					<%--Check-in and Check-out date --------------------------------------------------------------------------------------------------------------------------------------------%>

					<div class="Check-inCheck-out row m-3">

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

	<%--bootstrap JavaScript --%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>

</body>
</html>