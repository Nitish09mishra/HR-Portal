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

    <title>Login Page</title>
  </head>
  <body style="margin: 0; padding: 0;">
      
    <!-- navbar -->
    <div class="container-fluid">
        <nav class="navbar navbar-expand-lg navbar-dark">
            <a class="navbar-brand ml-4" href="#">E Management</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
          
            <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
              <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
                <li class="nav-item active">
                  <a class="nav-link mr-5" href="signup">Signup</a>
                </li>
              </ul>
            </div>
          </nav>
    </div>


    <header>Login</header>
    <div id="signin_form">
    	<% if(session.getAttribute("error")!=null) { %>
	    	<div id="index_error" class="mb-3" style="text-align: center; border-radius:5px; color: rgb(150,0,0); border:2px solid rgb(150, 0, 0); background-color: rgba(200, 0, 0, 0.2); paddin: 2%; margin: 0.5% auto;">
	    		<p style="margin: 2% auto; display:inline-block;"><%= session.getAttribute("error") %></p>
	    		<button class="okay" onclick="colse_2()" style="background-color: rgb(150,0,0);">OK</button>
	    	</div>
    		<% session.setAttribute("error", null); %>
    	<%  } %>
    	
    	<% if(session.getAttribute("success")!=null) { %>
	    	<div id="index_success" class="mb-3" style="text-align: center; border-radius:5px; color: rgb(0,150,0); border:2px solid rgb(0, 150, 0); background-color: rgba(0, 200, 0, 0.2); paddin: 2%; margin: 0.5% auto;">
	    		<p style="margin: 2% auto; display:inline-block;"><%= session.getAttribute("success") %></p>
	    		<button class="okay" onclick="colse_1()" style="background-color: rgb(0,150,0);">OK</button>
	    	</div>
    		<% session.setAttribute("success", null); %>
    	<%  } %>
    	
        <form method="post" action="processSignin">
            <div class="form-group row">
              <label for="inputEmail3" class="col-md-3 col-form-label">User Id</label>
              <div class="col-md-9">
                <input type="text" class="form-control" placeholder="User Id" name="userid">
              </div>
            </div>
            <div class="form-group row">
              <label for="inputPassword3" class="col-md-3 col-form-label">Password</label>
              <div class="col-md-9">
                <input type="password" class="form-control" placeholder="Password" name="password">
              </div>
            </div>

            <div class="form-group row">
                <div class="col-md-3"></div>
                <div class="col-md-9">
                  <a href="signup">Signup as a new user ?</a>
                </div>
              </div>

            <div class="form-group row">
              <div class="col-md-3"></div>
              <div class="col-md-9">
                <button type="submit" class="login_btn">Login</button>
              </div>
            </div>
          </form>
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