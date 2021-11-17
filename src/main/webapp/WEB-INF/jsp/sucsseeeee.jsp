<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>

<%@ page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="java.util.Iterator"%>
<!--- jstl tab library ---->
	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>

<script>

	$(document).ready(function() {

	});

	function loginAdmin() {
		
			$.ajax({
				type : "GET",
				url : "AdminLogin/loginAdmin",
				data : {
		
					userName : $("#userName").val(),
					password : $("#password").val()
					
				},
				success : function(result) {

				},
				error : function(err) {
					alert("error is" + err)
				}
			}); 
				
	}
	
	</script>
</head>
<body>
<form class="custom-validation">
									
									<div class="mb-3">
										<label class="form-label">Username</label>
										<div>
											<input data-parsley-type="alphanum" type="text" class="form-control" required placeholder="" name="userName" id="userName"/>
										</div>
									</div>

									<div class="mb-3">
										<label class="form-label">Password</label>
										<div>
											<input type="password" id="password" class="form-control" required placeholder="" name="password"/>
										</div>
									</div>  

									<div class="mt-3 text-end">
										<button class="btn btn-primary w-sm waves-effect waves-light" type="submit" onclick="loginAdmin()">Log In</button>
									</div>
									
									<div class="mt-4 text-center">
										<p class="mb-0">Don't have an account ? <a href="./AdminSignUp" class="fw-medium text-primary"> Signup now </a> </p>
									</div>
								</form>
</body>
</html>