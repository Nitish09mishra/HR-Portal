<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page isELIgnored="false"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>


<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<C:url value="/resources/CSS/index.css" var="indexcss"></C:url>
<!-- custom CSS -->
<link rel="stylesheet" href="${ indexcss }">

<C:url value="/resources/CSS/index.css" var="indexcss"></C:url>
<!-- custom CSS -->
<link rel="stylesheet" href="${ indexcss }">
    
<title>Home Page</title>
</head>
<body style="margin: 0; padding: 0;">

	<!-- navbar -->
	<div class="container-fluid">
		<nav class="navbar navbar-expand-lg navbar-dark">
			<a class="navbar-brand ml-4" href="#">E Management</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarTogglerDemo02"
				aria-controls="navbarTogglerDemo02" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
				<ul class="navbar-nav ml-auto mt-2 mt-lg-0">
					<li class="nav-item active">
						<form action="processLogout" method="get"
							class="nav-link mr-5 btn bg-danger font-weight-bold">
							<a type="submit" href="signup"
								style="border-radius: 5px; padding: 1%; width: 80px;">Logout</a>
						</form>
					</li>
				</ul>
			</div>
		</nav>
	</div>

	<div class="greeting_box"
		style="text-align: center; padding: 1% 5%; font-weight: bold;">
		<h4>Welcome ${ name } !</h4>
	</div>

	<% if(session.getAttribute("success")!=null) { %>
	<div class="mb-3"
		 id="home_success"
		style="width: 60%; text-align: center; border-radius: 5px; color: rgb(0, 150, 0); border: 2px solid rgb(0, 150, 0); background-color: rgba(0, 200, 0, 0.2); paddin: 0.7%; margin: 0.5% auto;">
		<p style="margin: 2% auto;  display:inline-block;"><%= session.getAttribute("success") %></p>
		<button class="okay" onclick="colse_3()" style="background-color: rgb(0,150,0);">OK</button>
	</div>
	<% session.setAttribute("success", null); %>
	<%  } %>

	<div class="body">
		<div id="function_box">
			<a class="functions" href="create" style="text-decoration:none;">Upload Employee Details</a> 
			<button class="functions" style="text-decoration:none;" onclick="download()">Download Employee Details</button>
		</div>
		<!-- employees details table -->
		<table class="table table-sriped" id="empl_table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Code</th>
					<th scope="col">Employee Name</th>
					<th scope="col">Employee Location</th>
					<th scope="col">Email</th>
					<th scope="col">DOB</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<C:forEach items="${ employees }" var="employee">
					<tr>
						<th scope="row">${ employee.id }</th>
						<td>${ employee.name }</td>
						<td>${ employee.location }</td>
						<td>${ employee.email }</td>
						<td>${ employee.dob }</td>
						<td><a href="update?Id=${ employee.id }">Edit</a></td>
					</tr>
				</C:forEach>
			</tbody>
		</table>
	</div>



	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
		
		<!--  Custom JS -->
  	<C:url value="/resources/Scripts/index.js" var="indexjs"></C:url>
    <!-- custom CSS -->
    <script src="${ indexjs }"></script>
    
    <!-- FOR DOWNLOADING HTML TABLE IN THE FORM OF PDF -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>
    
</body>
</html>