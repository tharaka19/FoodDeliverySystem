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
					<button type="button" class="btn btn-sm px-3 font-size-16 header-item waves-effect vertical-menu-btn"> <i class="fa fa-fw fa-bars"></i> </button>
					<!-- App Search-->
					<form class="app-search d-none d-lg-block">
						<div class="position-relative">
							<input type="text" class="form-control" placeholder="Search..."> <span class="uil-search"></span> </div>
					</form>
				</div>
				<div class="d-flex">
					<div class="dropdown d-inline-block d-lg-none ms-2">
						<button type="button" class="btn header-item noti-icon waves-effect" id="page-header-search-dropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="uil-search"></i> </button>
						<div class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0" aria-labelledby="page-header-search-dropdown">
							<form class="p-3">
								<div class="m-0">
									<div class="input-group">
										<input type="text" class="form-control" placeholder="Search ..." aria-label="Recipient's username">
										<div class="input-group-append">
											<button class="btn btn-primary" type="submit"><i class="mdi mdi-magnify"></i></button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
					
					<div class="dropdown d-none d-lg-inline-block ms-1">
						<button type="button" class="btn header-item noti-icon waves-effect" data-bs-toggle="fullscreen"> <i class="uil-minus-path"></i> </button>
					</div>
					<div class="dropdown d-inline-block">
						<button type="button" class="btn header-item noti-icon waves-effect" id="page-header-notifications-dropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="uil-bell"></i> <span class="badge bg-danger rounded-pill">3</span> </button>
						<div class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0" aria-labelledby="page-header-notifications-dropdown">
							<div class="p-3">
								<div class="row align-items-center">
									<div class="col">
										<h5 class="m-0 font-size-16"> Notifications </h5> </div>
									<div class="col-auto"> <a href="#!" class="small"> Mark all as read</a> </div>
								</div>
							</div>
							<div data-simplebar style="max-height: 230px;">
								
								
							</div>
							<div class="p-2 border-top">
								<div class="d-grid">
									<a class="btn btn-sm btn-link font-size-14 text-center" href="javascript:void(0)"> <i class="uil-arrow-circle-right me-1"></i> View More.. </a>
								</div>
							</div>
						</div>
					</div>
					
					<div class="dropdown d-inline-block">
						<button type="button" class="btn header-item waves-effect" id="page-header-user-dropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <img class="rounded-circle header-profile-user" src="<spring:url value="/resources/images/xxxmin.jpg"/>" alt="Header Avatar"> <span class="d-none d-xl-inline-block ms-1 fw-medium font-size-15"><% out.print(name);%></span> <i class="uil-angle-down d-none d-xl-inline-block font-size-15"></i> </button>
						<div class="dropdown-menu dropdown-menu-end">
							<!-- item--><a class="dropdown-item" href="#"><i class="uil uil-user-circle font-size-18 align-middle text-muted me-1"></i> <span class="align-middle">View Profile</span></a> <a class="dropdown-item" href="#"><i class="uil uil-wallet font-size-18 align-middle me-1 text-muted"></i> <span class="align-middle">My Wallet</span></a> <a class="dropdown-item d-block" href="#"><i class="uil uil-cog font-size-18 align-middle me-1 text-muted"></i> <span class="align-middle">Settings</span> <span class="badge bg-soft-success rounded-pill mt-1 ms-2">03</span></a> <a class="dropdown-item" href="#"><i class="uil uil-lock-alt font-size-18 align-middle me-1 text-muted"></i> <span class="align-middle">Lock screen</span></a> <a class="dropdown-item" href="#"><i class="uil uil-sign-out-alt font-size-18 align-middle me-1 text-muted"></i> <span class="align-middle">Sign out</span></a> </div>
					</div>
					
				</div>
			</div>
		</header>
		
	
		<!-- ========== Left Sidebar Start ========== -->
		<div class="vertical-menu">
			<!-- LOGO -->
			<div class="navbar-brand-box">
				<a href="index.html" class="logo logo-dark"> <span class="logo-sm">
                            <img src="assets/images/logo-sm.png" alt="" height="22">
                        </span> <span class="logo-lg">
                            <img src="assets/images/logo-dark.png" alt="" height="20">
                        </span> </a>
				<a href="index.html" class="logo logo-light"> <span class="logo-sm">
                            <img src="assets/images/logo-sm.png" alt="" height="22">
                        </span> <span class="logo-lg">
                            <img src="assets/images/logo-light.png" alt="" height="20">
                        </span> </a>
			</div>
			<button type="button" class="btn btn-sm px-3 font-size-16 header-item waves-effect vertical-menu-btn"> <i class="fa fa-fw fa-bars"></i> </button>
			<div data-simplebar class="sidebar-menu-scroll">
				<!--- Sidemenu -->
				<div id="sidebar-menu">
					<!-- Left Menu Start -->
					<ul class="metismenu list-unstyled" id="side-menu">
						<li class="menu-title">Menu</li>
						<li>
							<a href="./AdminDashbord"> <i class="uil-home-alt"></i><span class="badge rounded-pill bg-primary float-end">01</span> <span>Dashboard</span> </a>
						</li>
						<li>
							<a href="javascript: void(0);" class="has-arrow waves-effect"> <i class="uil-window-section"></i> <span>Layouts</span> </a>
							<ul class="sub-menu" aria-expanded="true">
								
										<li><a href="layouts-dark-sidebar.html">Dark Sidebar</a></li>
										<li><a href="layouts-colored-sidebar.html">Colored Sidebar</a></li>
										
							</ul>
						</li>
						
						<li class="menu-title">Apps</li>
						<li>
							<a href="calendar.html" class="waves-effect"> <i class="uil-calender"></i> <span>Calendar</span> </a>
						</li>
						
						<li>
							<a href="javascript: void(0);" class="has-arrow waves-effect"> <i class="uil-store"></i> <span>Ecommerce</span> </a>
							<ul class="sub-menu" aria-expanded="false">			
								<li><a href="ecommerce-orders.html">Orders</a></li>
								<li><a href="ecommerce-customers.html">Customers</a></li>
								<li><a href="./AdminDashbord/Category">Category</a></li>
								<li><a href="./AdminDashbord/FoodItem">Food Items</a></li>
								<li><a href="./AdminDashbord/Promo">Promo</a></li>
								<li><a href="./AdminDashbord/PromoFood">Promo Food</a></li>
							</ul>
						</li>
						
						<li>
							<a href="javascript: void(0);" class="has-arrow waves-effect"> <i class="uil-invoice"></i> <span>Invoices</span> </a>
							<ul class="sub-menu" aria-expanded="false">
								<li><a href="invoices-list.html">Invoice List</a></li>
								<li><a href="invoices-detail.html">Invoice Detail</a></li>
							</ul>
						</li>
						<li>
							<a href="javascript: void(0);" class="has-arrow waves-effect"> <i class="uil-book-alt"></i> <span>Contacts</span> </a>
							<ul class="sub-menu" aria-expanded="false">
								<li><a href="contacts-grid.html">User Grid</a></li>
								<li><a href="contacts-list.html">User List</a></li>
								<li><a href="contacts-profile.html">Profile</a></li>
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