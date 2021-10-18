<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="cl.edutecno.model.Show"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<title>Home Page</title>
<style>
body {
	background-color: black;
}

.table {
	background-color: white;
}

.navbar {
	padding-left: 5%;
	padding-right: 10%;
	background: url(./src/main/resources/series-de-tv_banner.jpg);
}

#myInput {
	background-position: 10px 10px;
	background-repeat: no-repeat;
	width: 20%;
	font-size: 14px;
	border: 1px solid #ddd;
	margin-bottom: 12px;
}
</style>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<img
			src=https://images.vexels.com/media/users/3/246463/isolated/preview/06d9ecec1d2611f9c80cccdedd6a01cb-elementos-de-los-80-flatneon-4.png
			width="75"> <a class="navbar-brand" href="/">weRateShows</a>

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
		<input class="form-control" type="text" id="myInput"
			onkeyup="myFunction()" placeholder="Search for a show"
			title="Type a show">
	</nav>

	<!-- ----------------------------------Fin NavBar-------------------------------------->


	<div class="container text-light">
		<div class="py-3">
			<h1 class="font-weight-bold">
				Welcome,
				<c:out value="${currentUser.username}"></c:out>
			</h1>
		</div>

		<h2>TV shows</h2>
		<table class="table table-dark" id="myTable">
			<thead>
				<tr class="header">
					<th scope="col">Show</th>
					<th scope="col">Network</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${allShows}" var="show">
					<tr>
						<td scope="row"><a href="/shows/${show.id}"
							class="text-info font-weight-bold">${show.showTitle}</a></td>
						<td>${show.showNetwork}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>


	<!-----------------------Filtro tabla JS------------------------------ -->
	<script>
		function myFunction() {
			var input, filter, table, tr, td, i, txtValue;
			input = document.getElementById("myInput");
			filter = input.value.toUpperCase();
			table = document.getElementById("myTable");
			tr = table.getElementsByTagName("tr");
			for (i = 0; i < tr.length; i++) {
				td = tr[i].getElementsByTagName("td")[0];
				if (td) {
					txtValue = td.textContent || td.innerText;
					if (txtValue.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}
			}
		}
	</script>
	<!-- -------------------------------------------------- -->

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous"></script>

</body>
</html>