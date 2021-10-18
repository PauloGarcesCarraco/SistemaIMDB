<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<style>
body{
background-color: black;
}
.table{
background-color: white;}
.navbar {
	padding-left: 5%;
	background: url(./src/main/resources/series-de-tv_banner.jpg);
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<img src=https://images.vexels.com/media/users/3/246463/isolated/preview/06d9ecec1d2611f9c80cccdedd6a01cb-elementos-de-los-80-flatneon-4.png width="75">
		<a class="navbar-brand" href="/">weRateShows</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="/login">Login
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="/registration">Registration</a>
				</li>
			</ul>
		</div>
	</nav>
	<div class="container text-light">
		<div class="mt-3 text-center">
			<c:if test="${logoutMessage != null}">
				<c:out value="${logoutMessage}"></c:out>
			</c:if>
			<c:if test="${errorMessage != null}">
				<c:out value="${errorMessage}"></c:out>
			</c:if>
		</div>
		<h1>Login</h1>
		<form method="POST" action="/login">
			<div class="form-group">
				<label for="exampleInputEmail1">Email address</label> <input
					type="email" class="form-control" id="username"
					aria-describedby="emailHelp" name="username">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Password</label> <input
					type="password" class="form-control" id="password" name="password">
			</div>
			<br>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" /> <input type="submit"
				class="btn btn-warning" value="Login!" />
		</form>
	</div>
		
		  <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
		
</body>
</html>