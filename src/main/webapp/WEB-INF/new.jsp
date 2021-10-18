<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

<title>New show</title>
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
			<ul class="navbar-nav ml-auto">
				<li class="nav-item mr-5"><a class="nav-link" href="/shows/new">Add
						a show</a></li>
				<li class="nav-item">
					<form id="logoutForm" method="POST" action="/logout">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" /> <input type="submit" value="Logout"
							class="btn btn-link text-secondary" />
					</form>
				</li>
			</ul>
		</div>
	</nav>
	<div class="container mt-3 text-light">
		<h1>Create a new show</h1>
		<form:errors path="show.*" />
		<form:form method="POST" action="/shows/create"
			modelAttribute="newShow">
			<div class="form-group row pt-2">
				<form:label path="showTitle"
					class="col-sm-2 col-form-label
col-form-label-sm">Show title: </form:label>
				<div class="col-sm-10">
					<form:input type="text" path="showTitle" class="form-control" />
				</div>
			</div>
			<div class="text-center my-2">
				<small><form:errors path="showTitle" /></small>
			</div>
			<div class="form-group row">
				<form:label path="showNetwork"
					class="col-sm-2 col-form-label
col-form-label-sm">Network: </form:label>
				<div class="col-sm-10">
					<form:input type="text" path="showNetwork" class="form-control" />
				</div>
			</div>
			<div class="text-center mt-2">
				<small><form:errors path="showNetwork" /></small>
			</div>
			<div class="text-center pt-4">
				<input type="submit" value="Create" class="btn
btn-lg btn-primary" />
			</div>
		</form:form>
		<div class="mt-5 pb-5">
			<a href="/shows" class="btn btn-warning">Go back</a>
		</div>
	</div>

		
		 <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
		
</body>
</html>