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
	<link rel="shortcut icon" href="<spring:url value="/resources/images/favicon.ico"/>">
	<!-- Sweet Alert-->
	<link rel="stylesheet" id="bootstrap-style" href="<spring:url value="/resources/libs/sweetalert2/sweetalert2.min.css"/> ">
	<!-- Bootstrap Css -->
	<link rel="stylesheet" id="bootstrap-style" href="<spring:url value="/resources/css/bootstrap.min.css"/> ">
	<!-- Icons Css -->
	<link rel="stylesheet" href="<spring:url value="/resources/css/icons.min.css"/> ">
	<!-- App Css-->
	<link rel="stylesheet" id="app-style" href="<spring:url value="/resources/css/app.min.css"/> ">
	
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	
	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
	
	
	<script>

	$(document).ready(function() {

		getActiveDeliveryLocation("Select*","");
	});


	function getActiveDeliveryLocation(name,id) {

		var status = "Active";
		var data = "";
		
				$.ajax({
						type : "GET",
						url : "SignUp/getActiveDeliveryLocation/"+ status,
						success : function(response) {
							 data = response
							 
							 $("#deliveryLocationNameList").append('<option value="'+id+'">'+name+'</option>');
							 
								for (i = 0; i < data.length; i++) {
									$("#deliveryLocationNameList")
											.append(
													' <option value="'+data[i].city+'">'+data[i].city+'</option>');			       
								}

							},
							error : function(err) {
								alert("error is" + err)
							}
						});
	}

	function ValidateEmail(inputText){
		
		var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		if(inputText.value.match(mailformat)){
			return false;
		}
		else{
			return true;
		}
	}

	function phonenumber(inputtxt){
		
		var phoneno = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;
		if(inputtxt.value.match(phoneno)){
		    return false;
		}else{
		    return true;
		}
	}

	function CheckPassword(inputtxt) {
		
		var decimal=  /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/;
		if(inputtxt.value.match(decimal)) {
			return false;
		}else{
			return true;
		}
	}

	function saveCustomer() {

		if($("#firstName").val() == "" || $("#lastName").val() == "" || $("#email").val() == "" || $("#phoneNumber").val() == "" || $("#userName").val() == "" || $("#password").val() == "" || $("#rePassword").val() == "" || $("#houseNoOrLane").val() == "" || $("#streetName").val() == "" || $("#deliveryLocationNameList").val() == ""){
			//alert("faild");
		}else if(ValidateEmail(document.adminform.email)){

		}else if(phonenumber(document.adminform.phoneNumber)){

		}else if(CheckPassword(document.adminform.password)){

		}else if($("#password").val() != $("#rePassword").val()){

		}else{
			
			$.ajax({
				type : "POST",
				url : "SignUp/saveCustomer",
				data : {
		
					firstName : $("#firstName").val(),
					lastName : $("#lastName").val(),
					email : $("#email").val(),
					phoneNumber : $("#phoneNumber").val(),
					password : $("#password").val()
					
				},
				success : function(result) {
					if(result > 0 ){
						saveShippingAddress(result);
					}else{
						alert($("#email").val() + "is already registerd");
						document.location.reload(true);
					}
					
				},
				error : function(err) {

				}
			}); 
			
		}	
	}

	function saveShippingAddress(id){

		alert("Your account has been created successlly");
		
		$.ajax({
			type : "POST",
			url : "SignUp/saveShippingAddress",
			data : {

				fullName : $("#firstName").val()+" "+$("#lastName").val(),
				houseNoOrLane : $("#houseNoOrLane").val(),
				streetName : $("#streetName").val(),
				city : $("#deliveryLocationNameList").val(),
				status : "On",
				customerId : id
				
			},
			success : function(result) {
				
			},
			error : function(err) {

			}
		});
		document.location.reload(true);
	}

		
	</script>
	
	</head>

<body class="authentication-bg" bgcolor="red" background="<spring:url value="/resources/siteImage/pasta15_b291.jpg"/>">
	<div class="account-pages my-5 pt-sm-5">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="text-center">
						<a href="#" class="mb-5 d-block auth-logo"> <img src="<spring:url value="/resources/images/WhatsAppImage2021-08-02at11.04.34.jpeg"/>" alt="" height="150" width="150" class="logo logo-dark"> <img src="assets/images/logo-light.png" alt="" height="22" class="logo logo-light"> </a>
					</div>
				</div>
			</div>
			<div class="row align-items-center justify-content-center">
				<div class="col-md-8 col-lg-6 col-xl-5">
					<div class="card">
						<div class="card-body p-4">
							<div class="text-center mt-2">
								<h5 class="text-primary">Register Account</h5>
							
							</div>
							<div class="p-2 mt-4">
								<form class="custom-validation" id="adminForm" name="adminform">


										<div class="row">
			
														<div class="row">
														  
															<div class="col">
																<div class="mb-3">
																	<label class="form-label">First Name</label>
																	<input type="text" class="form-control" required placeholder="First Name" name="firstName" id="firstName">
																</div>
															</div>
															<div class="col">
																<div class="mb-3">
																	<label class="form-label">Last Name</label>
																	<input type="text" class="form-control" required placeholder="Last Name" name="lastName" id="lastName"/>
																</div>
															</div>	
														</div>
														
														<div class="row">
														  
															<div class="col">
																<div class="mb-3">
																	<label class="form-label">House No or Lane*</label>
																	<input type="text" class="form-control" required placeholder="House No or Lane*" name="houseNoOrLane" id="houseNoOrLane">
																</div>
															</div>
															<div class="col">
																<div class="mb-3">
																	<label class="form-label">Street Name*</label>
																	<input type="text" class="form-control" required placeholder="Street Name*" name="streetName" id="streetName"/>
																</div>
															</div>	
														</div>
														
														<div class="row" id="deliveryLocationField">
															<div class="col">
																<div class="mb-3">
																	<label for="cars" class="form-label" for="validationCustom01">City*</label>
																		 	<select class="form-control" id="deliveryLocationNameList" required>
																		 	
																			 </select>
																<div class="invalid-feedback">
																	Please provide a valid city.
																</div>
																</div>
															</div>
															<div class="col"></div>
														</div>
									
														<div class="row">
														  
															<div class="col">
																<div class="mb-3">
																	<label class="form-label">Email</label>
																	<div>
																		<input type="email" class="form-control" required parsley-type="email" placeholder="Email" name="email" id="email"/>
																	</div>
																</div>
															</div>
															
														</div>
									
														<div class="row">
															<div class="col">
																<div class="mb-3">
																	<label class="form-label">Phone Number</label>
																	<div>
																		<input type="tel" class="form-control" required placeholder="Phone Number" name="phoneNumber" id="phoneNumber" pattern="/^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/"/>
																	</div>
																</div>
															</div>
														</div>
														
														<div class="row">
															<div class="col">
																<div class="mb-3">
																	<label class="form-label">Password</label>
																		<input type="password" class="form-control" required placeholder="Password" name="password" id="password" pattern="/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/"/>
																</div>
														   </div>
														   <div class="col">
																<div class="mb-3">
																	<label class="form-label">Confirm Password</label>
																			<input type="password" class="form-control" required data-parsley-equalto="#password" placeholder="Confirm Password" id="rePassword"/>
																</div>
														  </div>
														</div>
														<p class="text-muted mb-0">Your password must contain a minimum of 8 characters with 1 Uppercase , Numeric & Special character</p>
														
													<div class="row">
														    <div class="col"></div>
															<div class="col"></div>
															<div class="col">
																<div class="mt-3 text-end">
																		<button class="btn btn-primary w-sm waves-effect waves-light" type="submit" onclick="saveCustomer()">Register</button>
																</div>
															</div>
													</div>
														
											</div>
									

									
									
									<div class="mt-4 text-center">
										<p class="text-muted mb-0">Already have an account ? <a href="./Login" class="fw-medium text-primary"> Login</a></p>
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

 	<!-- Sweet Alerts js -->
    <script type="text/javascript" src="<spring:url value="/resources/libs/sweetalert2/sweetalert2.min.js"/>"></script>

    <!-- Sweet alert init js-->
    <script type="text/javascript" src="<spring:url value="/resources/js/pages/sweet-alerts.init.js"/>"></script>

	<!-- parsleyjs -->
	<script type="text/javascript" src="<spring:url value="/resources/libs/parsleyjs/parsley.min.js"/>"></script>
	<script type="text/javascript" src="<spring:url value="/resources/js/pages/form-validation.init.js"/>"></script>
	
	
</body>

</html>