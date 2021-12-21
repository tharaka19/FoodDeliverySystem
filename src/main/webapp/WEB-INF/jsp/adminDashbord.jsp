<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import= "com.Entity.Admin"%>
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
	<!-- Bootstrap Css -->
    <link rel="stylesheet" id="bootstrap-style" href="<spring:url value="/resources/css/bootstrap.min.css"/> ">
	<!-- Icons Css -->
	<link rel="stylesheet" href="<spring:url value="/resources/css/icons.min.css"/> ">
	<!-- App Css-->
	<link rel="stylesheet" id="app-style" href="<spring:url value="/resources/css/app.min.css"/> ">
	<script src="https://code.iconify.design/1/1.0.7/iconify.min.js"></script>
	
	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
	
	<script>
	$(document).ready(function() {
		getPromoNumber();
		getFoodItemNumber();
		getTodayOrders();
		getAllCustomer();
		getTopSellingPromo();
		getTopSellingFoodItems();
		getMessage();
	});

	function getPromoNumber(){

		var data = "";
		$.ajax({
				type : "GET",
				url : "Promo/getAllPrmo",
				
				success : function(response) {
					 data = response
					 
					$("#promos").text(data.length)
					},
					error : function(err) {
					}
				});
	}

	function getFoodItemNumber(){

		var data = "";
		$.ajax({
				type : "GET",
				url : "FoodItem/getAllFoodItem",
				
				success : function(response) {
					 data = response
					 
					$("#foodItem").text(data.length)
					},
					error : function(err) {
					}
				});
	}
	
	function getTodayOrders(){

		var data = "";
		$.ajax({
				type : "POST",
				url : "Home/getTodayOrderDetails",
				
				success : function(response) {
					 data = response
					 
					 $("#orders").text(data.length)

					},
					error : function(err) {
					}
				});

	}

	function getAllCustomer(){

		var data = "";
		$.ajax({
				type : "POST",
				url : "Home/getAllCustomer",
				success : function(response) {
					 data = response
					 
					 $("#customer").text(data.length)

					},
					error : function(err) {
					}
				});

	}

	function getTopSellingPromo(){

		var data = "";
		$.ajax({
				type : "POST",
				url : "Home/getTopSellingPromo",
				data : {
					
	                status : "Confirm"
	                
				},
				
				success : function(response) {
					 data = response

					 for (i = 0; i < data.length; i++) {

								if(data[i].quantity >= 0 && data[i].quantity < 10){

									$("#promoRow").append(
											'<div class="row align-items-center g-0 mt-3">'
											+ '<div class="col-sm-3">'
											+ '<p class="text-truncate mt-1 mb-0"><i class="mdi mdi-circle-medium text-warning me-2"></i>' + data[i].promo.name + '</p>'
											+ '</div>'
											+ '<div class="col-sm-9">'
											+ '<div class="progress mt-1" style="height: 6px;">'
											+ '<div class="progress-bar progress-bar bg-warning" role="progressbar" style="width: ' + data[i].quantity + '%" aria-valuenow="52" aria-valuemin="0" aria-valuemax="52">  </div>'
											+ '</div></div></div>');
									
								}else if(data[i].quantity >= 10 && data[i].quantity < 20){

									$("#promoRow").append(
											'<div class="row align-items-center g-0 mt-3">'
											+ '<div class="col-sm-3">'
											+ '<p class="text-truncate mt-1 mb-0"><i class="mdi mdi-circle-medium text-info me-2"></i>' + data[i].promo.name + '</p>'
											+ '</div>'
											+ '<div class="col-sm-9">'
											+ '<div class="progress mt-1" style="height: 6px;">'
											+ '<div class="progress-bar progress-bar bg-info" role="progressbar" style="width: ' + data[i].quantity + '%" aria-valuenow="52" aria-valuemin="0" aria-valuemax="52"> </div>'
											+ '</div></div></div>');

								}else if(data[i].quantity >= 20 && data[i].quantity < 30){

									$("#promoRow").append(
											'<div class="row align-items-center g-0 mt-3">'
											+ '<div class="col-sm-3">'
											+ '<p class="text-truncate mt-1 mb-0"><i class="mdi mdi-circle-medium text-primary me-2"></i>' + data[i].promo.name + '</p>'
											+ '</div>'
											+ '<div class="col-sm-9">'
											+ '<div class="progress mt-1" style="height: 6px;">'
											+ '<div class="progress-bar progress-bar bg-primary" role="progressbar" style="width: ' + data[i].quantity + '%" aria-valuenow="52" aria-valuemin="0" aria-valuemax="52"> </div>'
											+ '</div></div></div>');

								}else if(data[i].quantity >= 30 && data[i].quantity < 50){

									$("#promoRow").append(
											'<div class="row align-items-center g-0 mt-3">'
											+ '<div class="col-sm-3">'
											+ '<p class="text-truncate mt-1 mb-0"><i class="mdi mdi-circle-medium text-purple me-2"></i>' + data[i].promo.name + '</p>'
											+ '</div>'
											+ '<div class="col-sm-9">'
											+ '<div class="progress mt-1" style="height: 6px;">'
											+ '<div class="progress-bar progress-bar bg-purple" role="progressbar" style="width: ' + data[i].quantity + '%" aria-valuenow="52" aria-valuemin="0" aria-valuemax="52"> </div>'
											+ '</div></div></div>');
									
								}else{

									$("#promoRow").append(
											'<div class="row align-items-center g-0 mt-3">'
											+ '<div class="col-sm-3">'
											+ '<p class="text-truncate mt-1 mb-0"><i class="mdi mdi-circle-medium text-success me-2"></i>' + data[i].promo.name + '</p>'
											+ '</div>'
											+ '<div class="col-sm-9">'
											+ '<div class="progress mt-1" style="height: 6px;">'
											+ '<div class="progress-bar progress-bar bg-success" role="progressbar" style="width: ' + data[i].quantity + '%" aria-valuenow="52" aria-valuemin="0" aria-valuemax="52"> </div>'
											+ '</div></div></div>');
								}
									
						 }	

					},	
					error : function(err) {
					}
				});
		
	}


	function getActiveCategory(name,id) {

		var status = "Active";
		var data = "";
		
				$.ajax({
						type : "GET",
						url : "AdminDashbord/Category/getActiveCategory/"+ status,
						success : function(response) {
							 data = response
							 
							 $("#categoryNameList").append('<option value="'+id+'">'+name+'</option>');
							 
								for (i = 0; i < data.length; i++) {
									$("#categoryNameList")
											.append(
													' <option value="'+data[i].id+'">'+data[i].name+'</option>');			       
								}

							},
							error : function(err) {
							}
						});
	}

	function getTopSellingFoodItems(){

		if($("#categoryNameList").val() == ""){

		}else{


			var data = "";
			$.ajax({
					type : "POST",
					url : "Home/getTopSellingFoodItems",
					data : {
						
		                status : "Confirm",
		                categoryId : $("#categoryNameList").val()
					},
					
					success : function(response) {
						 data = response
						 
							 for (i = 0; i < data.length; i++) {

									if(data[i].quantity >= 0 && data[i].quantity < 10){

										$("#foodItemRow").append(
												'<div class="row align-items-center g-0 mt-3">'
												+ '<div class="col-sm-3">'
												+ '<p class="text-truncate mt-1 mb-0"><i class="mdi mdi-circle-medium text-warning me-2"></i>' + data[i].foodItem.name + '</p>'
												+ '</div>'
												+ '<div class="col-sm-9">'
												+ '<div class="progress mt-1" style="height: 6px;">'
												+ '<div class="progress-bar progress-bar bg-warning" role="progressbar" style="width: ' + data[i].quantity + '%" aria-valuenow="52" aria-valuemin="0" aria-valuemax="52"> </div>'
												+ '</div></div></div>');
										
									}else if(data[i].quantity >= 10 && data[i].quantity < 20){

										$("#foodItemRow").append(
												'<div class="row align-items-center g-0 mt-3">'
												+ '<div class="col-sm-3">'
												+ '<p class="text-truncate mt-1 mb-0"><i class="mdi mdi-circle-medium text-info me-2"></i>' + data[i].foodItem.name + '</p>'
												+ '</div>'
												+ '<div class="col-sm-9">'
												+ '<div class="progress mt-1" style="height: 6px;">'
												+ '<div class="progress-bar progress-bar bg-info" role="progressbar" style="width: ' + data[i].quantity + '%" aria-valuenow="52" aria-valuemin="0" aria-valuemax="52"> </div>'
												+ '</div></div></div>');

									}else if(data[i].quantity >= 20 && data[i].quantity < 30){

										$("#foodItemRow").append(
												'<div class="row align-items-center g-0 mt-3">'
												+ '<div class="col-sm-3">'
												+ '<p class="text-truncate mt-1 mb-0"><i class="mdi mdi-circle-medium text-primary me-2"></i>' + data[i].foodItem.name + '</p>'
												+ '</div>'
												+ '<div class="col-sm-9">'
												+ '<div class="progress mt-1" style="height: 6px;">'
												+ '<div class="progress-bar progress-bar bg-primary" role="progressbar" style="width: ' + data[i].quantity + '%" aria-valuenow="52" aria-valuemin="0" aria-valuemax="52"> </div>'
												+ '</div></div></div>');

									}else if(data[i].quantity >= 30 && data[i].quantity < 50){

										$("#foodItemRow").append(
												'<div class="row align-items-center g-0 mt-3">'
												+ '<div class="col-sm-3">'
												+ '<p class="text-truncate mt-1 mb-0"><i class="mdi mdi-circle-medium text-purple me-2"></i>' + data[i].foodItem.name + '</p>'
												+ '</div>'
												+ '<div class="col-sm-9">'
												+ '<div class="progress mt-1" style="height: 6px;">'
												+ '<div class="progress-bar progress-bar bg-purple" role="progressbar" style="width: ' + data[i].quantity + '%" aria-valuenow="52" aria-valuemin="0" aria-valuemax="52"> </div>'
												+ '</div></div></div>');
										
									}else{

										$("#foodItemRow").append(
												'<div class="row align-items-center g-0 mt-3">'
												+ '<div class="col-sm-3">'
												+ '<p class="text-truncate mt-1 mb-0"><i class="mdi mdi-circle-medium text-success me-2"></i>' + data[i].foodItem.name + '</p>'
												+ '</div>'
												+ '<div class="col-sm-9">'
												+ '<div class="progress mt-1" style="height: 6px;">'
												+ '<div class="progress-bar progress-bar bg-success" role="progressbar" style="width: ' + data[i].quantity + '%" aria-valuenow="52" aria-valuemin="0" aria-valuemax="52"> </div>'
												+ '</div></div></div>');
									}
										
							 }	

						},	
						error : function(err) {
						}
					});
			
		}
	
	}

	function getMessage(){

		var data = "";
		$.ajax({
			type : "GET",
			url : "Message/getAllMessage",
			success : function(response) {
					data = response

					$('.tr').remove();
					for (i = 0; i < data.length; i++) {
						

							$("#messageRow")
								.append(
										'<li class="feed-item" >'
										+ '<p class="text-muted mb-1 font-size-13">' + data[i].date + '</p>'
										+ '<p class="mb-0">' + data[i].message + ' <span class="text-primary">' + data[i].customer.firstName + '</span></p>'
										+ '</li>');
				
				}
							
				},
			error : function(err) {
				   alert("error is" + err)
			}
			});
	}
	</script>
</head>

<body>
	<!-- <body data-layout="horizontal" data-topbar="colored"> -->
	<!-- Begin page -->
	
		<%
		String name = "";
		if(session.getAttribute("admin") == null) {

     	}else{
     		Admin admin = (Admin) session.getAttribute("admin");
     		name = admin.getFirstName() + " " + admin.getLastName() ;
     	}
		
		%>
	
	<div id="layout-wrapper">
		<header id="page-topbar">
			<div class="navbar-header">
				<div class="d-flex">
					<!-- LOGO -->
					<div class="navbar-brand-box">
						<a href="index.html" class="logo logo-dark">
                        <span class="logo-sm">
                            <img src="assets/images/logo-sm.png" alt="" height="22">
                        </span>
                        <span class="logo-lg">
                            <img src="assets/images/logo-dark.png" alt="" height="20">
                        </span> </a>
						<a href="index.html" class="logo logo-light"> <span class="logo-sm">
                        <img src="assets/images/logo-sm.png" alt="" height="22">
                        </span> <span class="logo-lg">
                            <img src="assets/images/logo-light.png" alt="" height="20">
                        </span> </a>
					</div>
		
				</div>
				
				<div class="d-flex">
					
					
					<div class="dropdown d-inline-block">
						<a href="./Profile"><button type="button" class="btn header-item waves-effect" id="page-header-user-dropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <img class="rounded-circle header-profile-user" src="<spring:url value="/resources/images/xxxmin.jpg"/>" alt="Header Avatar"> <span class="d-none d-xl-inline-block ms-1 fw-medium font-size-15"><% out.print(name);%></span> <i class="uil-angle-down d-none d-xl-inline-block font-size-15"></i> </button></a>
						<div class="dropdown-menu dropdown-menu-end">
							<!-- item--><a class="dropdown-item" href="#"><i class="uil uil-user-circle font-size-18 align-middle text-muted me-1"></i> <span class="align-middle">View Profile</span></a> <a class="dropdown-item" href="#"><i class="uil uil-wallet font-size-18 align-middle me-1 text-muted"></i> <span class="align-middle">My Wallet</span></a> <a class="dropdown-item d-block" href="#"><i class="uil uil-cog font-size-18 align-middle me-1 text-muted"></i> <span class="align-middle">Settings</span> <span class="badge bg-soft-success rounded-pill mt-1 ms-2">03</span></a> <a class="dropdown-item" href="#"><i class="uil uil-lock-alt font-size-18 align-middle me-1 text-muted"></i> <span class="align-middle">Lock screen</span></a> <a class="dropdown-item" href="#"><i class="uil uil-sign-out-alt font-size-18 align-middle me-1 text-muted"></i> <span class="align-middle">Sign out</span></a> </div>
					</div>
					<div class="dropdown d-inline-block">
						<button type="button" class="btn header-item noti-icon right-bar-toggle waves-effect"> <i class="uil-cog"></i> </button>
					</div>
				</div>
				
			</div>
		</header>
		
	
		<!-- ========== Left Sidebar Start ========== -->
		<div class="vertical-menu">
			<!-- LOGO -->

			<button type="button" class="btn btn-sm px-3 font-size-16 header-item waves-effect vertical-menu-btn"> <i class="fa fa-fw fa-bars"></i> </button>
			<div data-simplebar class="sidebar-menu-scroll">
				<!--- Sidemenu -->
				<div id="sidebar-menu">
					<!-- Left Menu Start -->
					<ul class="metismenu list-unstyled" id="side-menu">
						<li class="menu-title">Menu</li>
						<li>
							<a href="./Home"> <i class="uil-home-alt"></i><span class="badge rounded-pill bg-primary float-end">01</span> <span>Dashboard</span> </a>
						</li>
						
						<li class="menu-title">Apps</li>
						<li>
							<a href="./Customer" class="waves-effect"> <i class="uil-calender"></i> <span>Customers</span> </a>
						</li>
						<li>
							<a href="./Order" class="waves-effect"> <i class="uil-calender"></i> <span>Orders</span> </a>
						</li>
						<li>
							<a href="./Payment" class="waves-effect"> <i class="uil-calender"></i> <span>Payment</span> </a>
						</li>
						<li>
							<a href="./Income" class="waves-effect"> <i class="uil-calender"></i> <span>Income</span> </a>
						</li>
						<li>
							<a href="./Email" class="waves-effect"> <i class="uil-calender"></i> <span>Email</span> </a>
						</li>
						<li>
							<a href="javascript: void(0);" class="has-arrow waves-effect"> <i class="uil-store"></i> <span>Ecommerce</span> </a>
							<ul class="sub-menu" aria-expanded="false">			
								<li><a href="./Category">Category</a></li>
								<li><a href="./FoodItem">Food Items</a></li>
								<li><a href="./Promo">Promo</a></li>
								<li><a href="./PromoFood">Promo Food</a></li>
								<li><a href="./DeliveryLocation">Delivery Location</a></li>
							</ul>
						</li>
						
						
					</ul>
				</div>
				<!-- Sidebar -->
			</div>
		</div>
		<!-- Left Sidebar End -->
		<!-- ============================================================== -->
		<!-- Start right Content here -->
		<!-- ============================================================== -->
		<div class="main-content">
			<div class="page-content">
				<div class="container-fluid">
					<!-- start page title -->
					<div class="row">
						<div class="col-12">
							<div class="page-title-box d-flex align-items-center justify-content-between">
								<h4 class="mb-0">Dashboard</h4>
								<div class="page-title-right">
									<ol class="breadcrumb m-0">
										<li class="breadcrumb-item"><a href="javascript: void(0);">Minible</a></li>
										<li class="breadcrumb-item active">Dashboard</li>
									</ol>
								</div>
							</div>
						</div>
					</div>
		
		<!-- end page title -->
					<div class="row">
						<div class="col-md-6 col-xl-3">
							<div class="card">
								<div class="card-body">
									<div class="float-end mt-2">
										<div id="total-revenue-chart"></div>
									</div>
									<div>
										<h4 class="mb-1 mt-1"><span data-plugin="counterup" id="promos"></span></h4>
										<p class="text-muted mb-0">Promos</p>
									</div>
								</div>
							</div>
						</div>
						<!-- end col-->
						<div class="col-md-6 col-xl-3">
							<div class="card">
								<div class="card-body">
									<div class="float-end mt-2">
										<div id="orders-chart"> </div>
									</div>
									<div>
										<h4 class="mb-1 mt-1"><span data-plugin="counterup" id="orders"></span></h4>
										<p class="text-muted mb-0">Orders <script>
																	document.write(new Date().getFullYear()+'-'+new Date().getMonth()+'-'+new Date().getDate())
																	</script></p>
									</div>
								</div>
							</div>
						</div>
						<!-- end col-->
						<div class="col-md-6 col-xl-3">
							<div class="card">
								<div class="card-body">
									<div class="float-end mt-2">
										<div id="customers-chart"> </div>
									</div>
									<div>
										<h4 class="mb-1 mt-1"><span data-plugin="counterup" id="customer"></span></h4>
										<p class="text-muted mb-0">Customers</p>
									</div>
								</div>
							</div>
						</div>
						<!-- end col-->
						<div class="col-md-6 col-xl-3">
							<div class="card">
								<div class="card-body">
									<div class="float-end mt-2">
										<div id="growth-chart"></div>
									</div>
									<div>
										<h4 class="mb-1 mt-1"><span data-plugin="counterup" id="foodItem"></span></h4>
										<p class="text-muted mb-0">Food Item</p>
									</div>
								</div>
							</div>
						</div>
						<!-- end col-->
					</div>
					
					<div class="card">
								<div class="card-body" id="promoRow">
									
									<h4 class="card-title mb-4">Top Selling Promos</h4>
									
									
									
									
									<!-- end row-->
								</div>
								<!-- end card-body-->
					</div>
					
					<div class="card">
								<div class="card-body" id="foodItemRow">
								
								<div class="row" id="categoryField">
														    <div class="col">
														    <h4 class="card-title mb-4">Top Selling Food Items</h4>
														    </div>
														    <div class="col"></div>
														    <div class="col"></div>
														    <div class="col"></div>
														    <div class="col"></div>
															<div class="col">
																<div class="mb-3">
																		 	<select class="form-control" id="categoryNameList" required onclick="getTopSellingFoodItems()">
																		 	
																			 </select>
																<div class="invalid-feedback">
																	Please provide a valid category.
																</div>
																</div>
															</div>
														</div>
									
									
									
									
									
									
									<!-- end row-->
								</div>
								<!-- end card-body-->
					</div>
					
					
					<!-- end col -->
						<div class="col-xl-4">
							<div class="card">
								<div class="card-body">
									<div class="float-end">
										<div class="dropdown">
											<div class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton3"> <a class="dropdown-item" href="#">Recent</a> <a class="dropdown-item" href="#">By Users</a> </div>
										</div>
									</div>
									<h4 class="card-title mb-4">Customer Messages</h4>
									<ol class="activity-feed mb-0 ps-2" data-simplebar style="max-height: 336px;" id="messageRow">
										
									
									</ol>
								</div>
							</div>
						</div>
		
		</div></div></div></div>
				<!-- container-fluid -->
			
			<!-- End Page-content -->
			<footer class="footer">
				<div class="container-fluid">
					<div class="row">
						<div class="col-sm-6">
							<script>
							document.write(new Date().getFullYear())
							</script> © Henry Bakers. </div>
						
					</div>
				</div>
			</footer>
		
		<!-- end main content-->
	
	<!-- END layout-wrapper -->
	<!-- Right Sidebar -->
	
		<!-- end slimscroll-menu-->
	
	<!-- /Right-bar -->
	<!-- Right bar overlay-->
	<div class="rightbar-overlay"></div>
	
	<!-- JAVASCRIPT -->
	<script src="https://code.iconify.design/1/1.0.7/iconify.min.js"></script>
	<script type="text/javascript" src="<spring:url value="/resources/libs/jquery/jquery.min.js"/>"></script>
	<script type="text/javascript" src="<spring:url value="/resources/libs/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
	<script type="text/javascript" src="<spring:url value="/resources/libs/metismenu/metisMenu.min.js"/>"></script>
	<script type="text/javascript" src="<spring:url value="/resources/libs/simplebar/simplebar.min.js"/>"></script>
	<script type="text/javascript" src="<spring:url value="/resources/libs/node-waves/waves.min.js"/>"></script>
	<script type="text/javascript" src="<spring:url value="/resources/libs/waypoints/lib/jquery.waypoints.min.js"/>"></script>
	<script type="text/javascript" src="<spring:url value="/resources/libs/jquery.counterup/jquery.counterup.min.js"/>"></script>
	
	<!-- apexcharts -->
	<script type="text/javascript" src="<spring:url value="/resources/libs/apexcharts/apexcharts.min.js"/>"></script>
	<script type="text/javascript" src="<spring:url value="/resources/js/pages/dashboard.init.js"/>"></script>
	
	<!-- App js -->
	<script type="text/javascript" src="<spring:url value="/resources/js/app.js"/>"></script>


</body>

</html>