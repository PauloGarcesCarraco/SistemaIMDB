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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>
$(function() {
	  $('.results-content span.stars').stars();
	});
</script>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<title>Show detail</title>
<style>
body {
	background-color: black;
}

.table {
	background-color: white;
}

.navbar {
	padding-left: 5%;
	background: url(./src/main/resources/series-de-tv_banner.jpg);
}

.results {
	font-size: 0;
}

.results-content {
	font-size: 13px;
	display: inline-block;
	vertical-align: top;
	background: url('https://i.stack.imgur.com/rwkqF.png') 0 0 repeat-x;
	width: 185px;
	height: 35px;
}

.results .results-content span.stars span {
	background: url('https://i.stack.imgur.com/rwkqF.png') 0 -36px repeat-x;
	display: inline-block;
	height: 35px;
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
	</nav>
	<div class="container mt-3 text-light">
		<h1>Title: ${show.showTitle}</h1>
		<h2>Network: ${show.showNetwork}</h2>
		<h2 class="font-weight-bold">Users who rated this show</h2>
		<table class="table" id="res">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Rating</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="row" items="${showRatings}">
					<tr>
						<td scope="row">${row.user.username}</td>
						<td class="countable">${row.rating}</td>
						<td>
							<div class="results">
								<div class="results-content">
									<span class="stars">${row.rating}</span>
								</div>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<!----------------- Table Average with JS code ----------------->
		<h2>
			Average Rating:
			<script>
	    		var cls = document.getElementById("res").getElementsByTagName("td");
	    		var sum = 0;
	    		for (var i = 0; i < cls.length; i++){
	        	if(cls[i].className == "countable"){
	            sum += isNaN(cls[i].innerHTML) ? 0 : parseFloat(cls[i].innerHTML);
	       		 }
	   			}
	    		var promedio=(sum/(cls.length/3))
	   			 document.write(promedio); //divido por 3 porque el arreglo toma las 3 columnas y solo quiero una
					document.getElementById('output').innerHTML=promedio	
	   			 </script>
		</h2>
		<!------------------------------------------------------------------>


		<c:if test="${currentUser.id == creatorShow.id }">
			<a href="/shows/${show.id}/edit" class="btn btn-info">Edit</a>
		</c:if>
		<br /> <br />
		<form:form method="POST" action="/shows/${show.id}/add"
			modelAttribute="addRating">
			<form:hidden path="user" value="${currentUser.id}" />
			<form:hidden path="shows" value="${show.id}" />
			<div class="form-inline">
				<form:label path="rating">Leave a rating: </form:label>
				<div class="mx-3">
					<form:input type="number" min="1" max="5" path="rating"
						class="form-control" />
					<form:errors path="rating" />
				</div>
				<br>
				<div class="">
					<input type="submit" value="Rate!" class="btn btn-primary" />
				</div>
			</div>
		</form:form>
		<div class="mt-5 pb-5">
			<a href="/shows" class="btn btn-warning">Go back</a>
		</div>
	</div>

	<!----------------  Stars rating with JS + JQuery ----------------------->
	<script>
		$.fn.stars = function() { 
			return this.each(function() {
			// Get the value
			var val = parseFloat($(this).html()); 
			// Make sure that the value is in 0 - 5 range, multiply to get width
			var size = Math.max(0, (Math.min(5, val))) * 36.5; 
			// Create stars holder
			var $span = $('<span> </span>').width(size); 
			// Replace the numerical value with stars
			$(this).empty().append($span);
				});
			}
	</script>
	<!------------------------------------------------------------------>


	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous"></script>

</body>
</html>
