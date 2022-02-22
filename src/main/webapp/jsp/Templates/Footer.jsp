<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<link 
 
    rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" 
    integrity="sha384-EvBWSlnoFgZlXJvpzS+MAUEjvN7+gcCwH+qh7GRFOGgZO0PuwOFro7qPOJnLfe7l" 
    crossorigin="anonymous">
    
    <link rel="stylesheet" type="text/css" href="style.css">	

<% 
// CREATES A CURRENT YEAR INSTANCE
	int year = Calendar.getInstance().get(Calendar.YEAR);
	
%>
<footer class="text-muted py-3 text-center text-warning bg-dark">
	<div class="container">
		<p class="float-end mb-1">
			<a href="#"> <i class="bi bi-chevron-double-up text-primary" style="font-size: 2rem"></i></a>
		</p>
		
			<!-- SOCIAL ICONS -->
			<p class="px-5 d-inline ">
				<a href="#" ><i class="bi bi-facebook me-3 text-white" style="font-size: 1.5rem"></i></a>
				<a href="#" ><i class="bi bi-instagram me-3 text-warning" style="font-size: 1.5rem"></i></a>
				<a href="#" ><i class="bi bi-twitter me-3 text-primary" style="font-size: 1.5rem"></i></a>
				
			</p>
			<p class="px-3 d-inline">&copy; <%=year%> - Proviso </p>
		
		
		
	</div>
</footer>
