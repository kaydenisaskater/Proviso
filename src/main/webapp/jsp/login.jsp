<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Proviso Login</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="assets/fonts/ionicons.min.css" />
<link rel="stylesheet" href="assets/css/Login-Form-Clean.css" />
</head>
<body>
<jsp:include page="Templates/Nav.jsp" flush="true"/>
    <section class="login-clean d-flex align-items-center justify-content-center vh-100 bg-primarybg-gradient" style="padding-top: 6%;">
    <div class="shadow-lg p-3 mb-5 bg-body rounded">
    	<h1 class="text-dark text-center mb-5">Login</h1>
    	<form action="/Proviso/ProvisoServlet" method="post">
    		<input type="hidden" name="action" value="loginUser"/>
            <h2 class="visually-hidden">Login Form</h2>
            <div class="illustration"><i class="icon ion-ios-navigate"></i></div>
            <div class="mb-3"><input id="email" class="form-control" type="email" name="email" placeholder="Email" /></div>
            <div class="mb-3"><input id="password" class="form-control" type="password" name="password" placeholder="Password" /></div>
            <div class="mb-3"><button class="btn btn-primary d-block w-100" type="submit">Log In</button></div>
            <div><a class="forgot" href="#">Forgot your email or password?</a></div>
            <div><a href="/Proviso/jsp/registration.jsp" class="forgot">New User? Register Here</a></div>
        </form>
    </div>
    </section>
    <jsp:include page="Templates/Footer.jsp" flush="true"/>
    <jsp:include page="Templates/ScriptFooter.jsp" flush="true"/>
</body>
</html>