<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="beans.User" %>
<header>
<%
User user = (User)session.getAttribute("user");
%>
	<!-- NAVBAR -->
	<nav class="navbar navbar-expand-lg bg-dark shadow-lg">
		<div class="container-fluid">
			
			<a class="navbar-brand text-light px-5" href="/Proviso/ProvisoServlet?action=showWelcome">
				<img src="/Proviso/images/proviso-logo.png" alt="" width="50" height="50"> <!-- LOGO -->
			</a> 
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse d-flex justify-content-end" id="navbarNav">
			
			
				<!-- NAV LINKS IN UL -->
				<ul class="navbar-nav px-5">
				
					<div class="dropdown">
						  <button class="btn btn-outline-dark text-white dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
						    Lookup
						  </button>
						  <ul class="dropdown-menu dropdown-menu-dark bg-dark" aria-labelledby="dropdownMenuButton1">
						    <li><a class="dropdown-item text-white" href="/Proviso/ProvisoServlet?action=reservationLookup">Reservations</a></li>
						    <li><a class="dropdown-item text-white" href="/Proviso/ProvisoServlet?action=loyaltyLookup">Loyalty Points</a></li>
						    
						  </ul>
						</div>
						
					
					<li class="nav-item">
						<a class="nav-link active text-light" aria-current="page" href="/Proviso/ProvisoServlet?action=aboutUs">About Us</a>
					</li>
					<li class="nav-item">
						<a class="nav-link text-light" href="/Proviso/ProvisoServlet?action=contactUs">Contact Us</a>
					</li>
					<%
					if (user != null) {
					%>
					<li class="nav-item">
						<a class="nav-link text-light" href="/Proviso/ProvisoServlet?action=reservation">Reservations</a>
					</li>
					<li>
						<a class="nav-link text-light" href="/Proviso/ProvisoServlet?action=profile"><%= user.getFirstName()%> <%= user.getLastName() %></a>
					</li>
					<li>
						<a class="nav-link" href="/Proviso/ProvisoServlet?action=logout">Logout</a>
					</li>
					<%
					}
					else {
					%>
					<li class="nav-item">
						<a class="nav-link text-warning" href="/Proviso/ProvisoServlet?action=viewLogin">Login</a>
					</li>
					 <%
					}
					 %>
				</ul>
			</div>
		</div>
	</nav>
</header>