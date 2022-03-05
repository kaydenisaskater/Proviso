<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="model.JdbcManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Look Up</title>

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
	<jsp:useBean id="jdbcManager" scope="application"
		class="model.JdbcManager" />

	<div class=" container p-5 vh-100">
		<div class="col-lg-4 col-sm-6 mx-auto">

			<form action="/Proviso/jsp/lookupThought.jsp" method="get">

				<div class="label">
					<label for="order_id" class="form-label fs-5">Reservation
						Lookup</label>
				</div>
				<input type="number" class="form-control" id="order_id"
					name="order_id" min="1" max ="1000" placeholder="Order ID" />

				<div class="row p-0 m-0 my-3">
					<button id="btnSubmit" type="submit" class="btn btn-primary">Submit</button>
				</div>
			</form>

		</div>
		<div class="col-lg-8 col-sm-12 mx-auto">
			<%
			String r = request.getParameter("order_id");
			Integer reservation_id = 0;
			if (r != null && r!="") {
				reservation_id = Integer.parseInt(r);
			}
			if (reservation_id != 0) {

				Connection conn = jdbcManager.getConn();
				Statement stmt = conn.createStatement();
				ResultSet rs = null;

				String sql = String.format(
				"SELECT r.`reservation_id`,r.`check_in_date`, r.`check_out_date`,r.`total_price`,s.`room_size_description`,g.`guest_count`,a.`amenity_description`"
						+ " FROM  reservations AS r LEFT JOIN room_sizes AS s ON s.room_size_id = r.room_size_id"
						+ " LEFT JOIN guest_options AS g ON g.guest_option_id = r.guest_option_id"
						+ " LEFT JOIN include AS i ON i.reservation_id = r.reservation_id"
						+ " LEFT JOIN amenities AS a ON a.amenity_id = i.amenity_id WHERE r.reservation_id = %d;",
				reservation_id);
				System.out.println(sql);
				try {
					rs = stmt.executeQuery(sql);
					System.out.println(reservation_id);

					if (rs.next()) {
			%>
			<table class="table">
				<thead>
					<th>Order ID</th>
					<th>Room Size</th>
					<th>Guests</th>
					<th>Check-in</th>
					<th>Check-out</th>
					<th>Amenities</th>
				</thead>

				<tr>
					<td><%=rs.getLong("reservation_id")%></td>
					<td><%=rs.getString("room_size_description")%></td>
					<td><%=rs.getInt("guest_count")%></td>
					<td><%=rs.getDate("check_in_date")%></td>
					<td><%=rs.getDate("check_out_date")%></td>
					<td><%=rs.getString("amenity_description")%><br> <%
 					while (rs.next()) {
 					%> 
 					<%=rs.getString("amenity_description")%><br> 
 					<%
 					}
 					%></td>
				</tr>
			</table>

			<%
			} else {
			%>
			<div class="alert alert-danger mt-5 alertMessage text-center"
				role="alert">
				Did Not Find Reservation on id=<%=reservation_id%></div>
			<%
			}

			} catch (SQLException ex) {
			System.out.println("Did not find id");

			} finally {
			rs.close();
			stmt.close();
			conn.close();
			}

			}else if(r==""){
				%>
				<div class="alert alert-danger mt-5 alertMessage text-center"
				role="alert">Please enter a reservation id</div>
				<%
			}
			%>
		</div>
	</div>






	<jsp:include page="Templates/Footer.jsp" flush="true" />
	<jsp:include page="Templates/ScriptFooter.jsp" flush="true" />
</body>
</html>