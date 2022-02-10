<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<header>
	<!-- NAVBAR -->
	<nav class="navbar navbar-expand-lg bg-dark">
		<div class="container-fluid">
			
			<a class="navbar-brand text-light px-5" href="ProvisoServlet?action=showWelcome">Proviso</a> <!-- LOGO -->
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse d-flex justify-content-end" id="navbarNav">
				<!-- NAV LINKS IN UL -->
				<ul class="navbar-nav px-5">
					<li class="nav-item"><a class="nav-link active text-light"
						aria-current="page" href="/Proviso/ProvisoServlet?action=viewLogin">Login</a></li>
					<li class="nav-item"><a class="nav-link" href="/Proviso/ProvisoServlet?action=aboutUs">About Us</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="/Proviso/ProvisoServlet?action=contactUs">Contact Us</a></li>
				</ul>
			</div>
		</div>
	</nav>
</header>