<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!doctype html>
<html lang="en">

<head>
	<meta charset="utf-8" />
	<title>Henry Bakers</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
	<meta content="Themesbrand" name="author" />
	<!-- App favicon -->
	<!-- <link rel="shortcut icon" href="assets/images/favicon.ico">
	Bootstrap Css
	<link href="./jsp/assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
	Icons Css
	<link href="./jsp/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
	App Css
	<link href="./jsp/assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />  -->
	
	<link rel="shortcut icon" href="<spring:url value="/resources/images/favicon.ico"/>">
	<link rel="stylesheet" id="bootstrap-style" href="<spring:url value="/resources/css/bootstrap.min.css"/> ">
	<link rel="stylesheet" href="<spring:url value="/resources/css/icons.min.css"/> ">
	<link rel="stylesheet" id="app-style" href="<spring:url value="/resources/css/app.min.css"/> ">
	
	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
	<script>

	$(document).ready(function() {

	});

	function loginCustomer() {
		
			$.ajax({
				type : "GET",
				url : "Login/loginCustomer",
				data : {
		
					userName : $("#email").val(),
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

<body class="authentication-bg">
	<div class="account-pages my-5 pt-sm-5">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="text-center">
						<a href="#" class="mb-5 d-block auth-logo"> <img src="<spring:url value="/resources/images/WhatsAppImage2021-08-02at11.04.34.jpeg"/>" alt="" height="150" width="150" class="logo logo-dark"></a>
					</div>
				</div>
			</div>
			<div class="row align-items-center justify-content-center">
				<div class="col-md-8 col-lg-6 col-xl-5">
					<div class="card">
						<div class="card-body p-4">
							<div class="text-center mt-2">
								<h5 class="text-primary">Welcome Back !</h5>
							
							</div>
							<div class="p-2 mt-4">

								<form class="custom-validation" action="loginCustomer" method="get">
									
									<div class="mb-3">
										<label class="form-label">Username</label>
										<div>
											<input type="email" class="form-control" required parsley-type="email" placeholder="Email" name="email" id="email"/>
										</div>
									</div>

									<div class="mb-3">
										<label class="form-label">Password</label>
										<div>
											<input type="password" id="password" class="form-control" required placeholder="" name="password"/>
										</div>
									</div>  

									<div class="mt-3 text-end">
										<button class="btn btn-primary w-sm waves-effect waves-light" type="submit">Log In</button>
									</div>
									
									<div class="mt-4 text-center">
										<p class="mb-0">Don't have an account ? <a href="./SignUp" class="fw-medium text-primary"> Signup now </a> </p>
									</div>
								</form>
							</div>
						</div>
					</div>
				
				</div>
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</div>
	
	<!-- JAVASCRIPT -->
	<script type="text/javascript" src="<spring:url value="/resources/libs/jquery/jquery.min.js"/>"></script>
	<script type="text/javascript" src="<spring:url value="/resources/libs/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
	<script type="text/javascript" src="<spring:url value="/resources/libs/metismenu/metisMenu.min.js"/>"></script>
	<script type="text/javascript" src="<spring:url value="/resources/libs/simplebar/simplebar.min.js"/>"></script>
	<script type="text/javascript" src="<spring:url value="/resources/libs/node-waves/waves.min.js"/>"></script>
	<script type="text/javascript" src="<spring:url value="/resources/libs/waypoints/lib/jquery.waypoints.min.js"/>"></script>
	<script type="text/javascript" src="<spring:url value="/resources/libs/jquery.counterup/jquery.counterup.min.js"/>"></script>
	
	<!-- App js -->
	<script type="text/javascript" src="<spring:url value="/resources/js/app.js"/>"></script>

	<!-- parsleyjs -->
	<script type="text/javascript" src="<spring:url value="/resources/libs/parsleyjs/parsley.min.js"/>"></script>
	<script type="text/javascript" src="<spring:url value="/resources/js/pages/form-validation.init.js"/>"></script>
	
	</body>
</body>

</html>