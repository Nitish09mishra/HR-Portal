<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%@ page isELIgnored="false"%>
	<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
	
	
<!doctype html>
<html lang="en">
  <head>
	
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

	<C:url value="/resources/CSS/index.css" var="indexcss"></C:url>
    <!-- custom CSS -->
    <link rel="stylesheet" href="${ indexcss }">

    <title>Update User Page</title>
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
					<form action="processLogout" 
						  method="get" 
						  class="nav-link mr-5 btn bg-danger font-weight-bold">
						<a
						type="submit"
						href="signup"
						style="border-radius: 5px; padding: 1%; width: 80px;">Logout</a>
					</form>
					</li>
				</ul>
			</div>
		</nav>
	</div>

	<div class="update_heading"
		style="text-align: center; padding: 1% 5%; font-weight: bold;">
		<h4>Welcome ${ name } !</h4>
	</div>

    <header>Edit Employee Details</header>
    <div id="signin_form">
    	
        <form method="post" action="processUpdate" id="update_reset">
            <div class="form-group row">
              <label class="col-md-4 col-form-label">Employee Code</label>
              <div class="col-md-8">
                <input type="text" class="form-control" value="${current_employee.id}" name="id" readonly>
              </div>
            </div>
            <div class="form-group row">
              <label class="col-md-4 col-form-label">Employee Name</label>
              <div class="col-md-8">
                <input type="text" class="form-control" value="${current_employee.name}" name="name">
              </div>
            </div>
			<div class="form-group row">
              <label class="col-md-4 col-form-label">Location</label>
              <div class="col-md-8">
               <textarea class="form-control" id="exampleFormControlTextarea1" rows="2" name="location"></textarea>
              </div>
            </div>
            <div class="form-group row">
              <label class="col-md-4 col-form-label">Email</label>
              <div class="col-md-8">
                <input type="email" class="form-control" value="${current_employee.email}" name="email">
              </div>
            </div>
            <div class="form-group row">
              <label class="col-md-4 col-form-label">Date of Birth</label>
              <div class="col-md-8">
                <input type="text" class="form-control" value="${current_employee.dob}" name="dob">
              </div>
            </div>
            

            <div class="form-group row">
              <div class="col-md-4"></div>
              <div class="col-md-8">
                <button type="submit" class="save_btn">Save</button>
              </div>
            </div>
          </form>

		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-8">
				<button onclick="reset_2()" class="cancel_btn">Cancel</button>
			</div>
		</div>

	</div>





    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  	
  	<!--  Custom JS -->
  	<C:url value="/resources/Scripts/index.js" var="indexjs"></C:url>
    <!-- custom CSS -->
    <script src="${ indexjs }"></script>
    
  </body>
</html>