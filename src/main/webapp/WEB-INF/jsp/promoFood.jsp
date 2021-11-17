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
	<!-- DataTables -->
    <link rel="stylesheet" href="<spring:url value="/resources/libs/datatables.net-bs4/css/dataTables.bootstrap4.min.css"/> ">
    <link rel="stylesheet" href="<spring:url value="/resources/libs/datatables.net-buttons-bs4/css/buttons.bootstrap4.min.css"/> ">
    <!-- Responsive datatable examples -->
    <link rel="stylesheet" href="<spring:url value="/resources/libs/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css"/> ">
	<!-- select2 css -->
	<link rel="stylesheet" id="bootstrap-style" href="<spring:url value="/resources/libs/select2/css/select2.min.css"/> ">
	<!-- dropzone css -->
	<link rel="stylesheet" id="bootstrap-style" href="<spring:url value="/resources/libs/dropzone/min/dropzone.min.css"/> ">
	<!-- Bootstrap Css -->
	<link rel="stylesheet" id="bootstrap-style" href="<spring:url value="/resources/css/bootstrap.min.css"/> ">
	<!-- Icons Css -->
	<link rel="stylesheet" href="<spring:url value="/resources/css/icons.min.css"/> ">
	<!-- App Css-->
	<link rel="stylesheet" id="app-style" href="<spring:url value="/resources/css/app.min.css"/> ">
	
	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
	
	<script>

	$(document).ready(function() {
		getAllPrmoFood()
	});

	let promoQuantity='';
	let foodQuantity='';
	
	function addPromoFoodBtn(){

		getActivePromo("Select","");
		getActiveFoodItem("Select","");
		$('#savePromoFoodBtn').show();
		$('#updatePromoFoodBtn').hide();
		$('#promoFoodIdField').hide();
		$('#availableFoodQuantityField').show();
		$("#availablePromoQuantityField").show();
	}

	function getActivePromo(name,id) {

		var status = "Active";
		var data = "";
		
				$.ajax({
						type : "GET",
						url : "Promo/getActivePrmomo/"+ status,
						success : function(response) {
							 data = response

							 $("#promoNameList").append('<option value="'+id+'">'+name+'</option>');
							 
								for (i = 0; i < data.length; i++) {
									$("#promoNameList")
											.append(
													' <option value="'+data[i].id+'">'+data[i].name+'</option>');			       
								}

							},
							error : function(err) {
								alert("error is" + err)
							}
						});
	}

	function getActiveFoodItem(name,id) {

		var status = "Active";
		var data = "";
		
				$.ajax({
						type : "GET",
						url : "FoodItem/getActiveFoodItem/"+ status,
						success : function(response) {
							 data = response

							 $("#foodItemNameList").append('<option value="'+id+'">'+name+'</option>');
							 
								for (i = 0; i < data.length; i++) {
									$("#foodItemNameList")
											.append(
													' <option value="'+data[i].id+'">'+data[i].name+'</option>');			       
								}

							},
							error : function(err) {
								alert("error is" + err)
							}
						});
	}

	function getAvailablePromoQuantity(){

		if($("#promoNameList").val() == ""){
			$("#availablePromoQuantity").val('');
			promoQuantity = '';	
		}else{
			
			$.ajax({
				type : "GET",
				url : "Promo/getPromoQuantity/" + $("#promoNameList").val(),
				dataType : 'json',
				success : function(response) {

					promoQuantity = response,
					$("#availablePromoQuantity").val(response)		
					
				},
				error : function(err) {
					alert("error is" + err)
				}
			});
		}
	}
	
	function getAvailableFoodQuantity(){

		if($("#foodItemNameList").val() == ""){
			$("#availableFoodQuantity").val('');
			foodQuantity = '';	
		}else{
		
			$.ajax({
				type : "GET",
				url : "FoodItem/getFoodItemQuantity/" + $("#foodItemNameList").val(),
				dataType : 'json',
				success : function(response) {

					foodQuantity = response,
					$("#availableFoodQuantity").val(response)
					
				},
				error : function(err) {
					alert("error is" + err)
				}
			});
		}
	}

	function checkFoodItemForPromo(){
		
		if($("#foodItemNameList").val() == "" || $("#promoNameList").val() == ""){
			getAvailablePromoQuantity();
			getAvailableFoodQuantity();
		}else{
			
		$.ajax({
			type : "POST",
			url : "PromoFood/checkFoodItemForPromo",
			data : {

				promoId  :  $("#promoNameList").val(),
			    foodItemId  : $("#foodItemNameList").val()
					
			 },
			success : function(result) {
	
				if(result == true){

						alert("food item was added");
						$("#foodItemNameList").val('');
						$("#availableFoodQuantity").val('');
						foodQuantity = '';
						getAvailablePromoQuantity();
				
					
				}else{
					getAvailablePromoQuantity();
					getAvailableFoodQuantity();
				}
			
			},
			error : function(err) {
				alert("error is" + err)
			}
		}); 

	    }
		
	}

	function calculateFoodQuantity(action){

		let count = $('input[name="quantity"]').val();
		
		if(action == "plus"){
			
			if(foodQuantity/promoQuantity >= 1){
				
				$('input[name="quantity"]').val(++count);
				foodQuantity = foodQuantity - promoQuantity;
			}else{
				alert("else is");
			}
			
		}else{
			
			if($('input[name="quantity"]').val() >= 1){
				
				$('input[name="quantity"]').val(--count);
				foodQuantity = foodQuantity + promoQuantity;
			}else{
				alert("else is");
			}
			
		}

		 $("#availableFoodQuantity").val(foodQuantity); 
	}

	function resetQuantity(){
		promoQuantity = '';
		foodQuantity = '';
	}
	
	function savePromoFood() {

		updateFoodItemQuantity($("#foodItemNameList").val(), $("#availableFoodQuantity").val());
		
		$.ajax({
			type : "POST",
			url : "PromoFood/savePromoFood",
			data : {

				promoId  : $("#promoNameList").val(),
			    foodItemId  : $("#foodItemNameList").val(),
			    foodQuantity : $('input[name="quantity"]').val(),
			    status : "Active",
					
			 },
			success : function(result) {
				getAllPromoFood()
			},
			error : function(err) {
				alert("error is" + err)
			}
		}); 
		
	}

	function updateFoodItemQuantity(id, quantity){

		$.ajax({
			type : "POST",
			url : "FoodItem/updateFoodItemQuantity",
			data : {
					
				id : id,
				quantity : quantity
	                
			},
			success : function(result) {				

			},
			error : function(err) {
				alert("error is" + err)
			}
		});
	}

	function getAllPrmoFood() {
		
		var data = "";
				$.ajax({
						type : "GET",
						url : "PromoFood/getAllPromoFood",
						success : function(response) {
							 data = response
							 
								$('.tr').remove();
								for (i = 0; i < data.length; i++) {
									
									if(data[i].status == "Active"){

										$("#FoodTable")
										.append(
												'<tr class="tr">'
												        + '<td>' + data[i].id + '</td>'
												        + '<td>' + data[i].promo.name + '</td>'
												        + '<td>' + data[i].foodItem.name + '</td>'
												        + '<td>' + data[i].foodQuantity + '</td>'
												        + '<td>  <div class="badge bg-pill bg-soft-success font-size-12"">'+ data[i].status +'</div>  </td>'
														+ '<td>  <input type="button" id="deactiveBtn" class="btn btn-outline-info waves-effect waves-light" onclick="deactivePromoFood('+ data[i].id + ')" value="Deactive"></input></td>'
												        + '<td>  <input type="button" class="btn btn-outline-warning waves-effect waves-light" onclick="editPromoFood('+ data[i].id + ')" data-toggle="modal" data-target="#cartTwo" value="Edit"></input></td>'
												        + '<td>  <input type="button" class="btn btn-outline-danger waves-effect waves-light" onclick="deletePromoFood(' + data[i].id + ')" value="Delete"></input></td>'
												        + '</tr>');
								        
										$("#infoTable")
										.append(
											'<tr>'
											+ '<td>' + data[i].promo.name + '</td>'
											+ '<td>' + data[i].foodItem.name + '</td>'
											+ '<td>' + data[i].foodQuantity  + '</td>'
											+ '</tr>');
									
									}else{

										$("#FoodTable")
										.append(
												'<tr class="tr">'
												        + '<td>' + data[i].id + '</td>'
												        + '<td>' + data[i].promo.name + '</td>'
												        + '<td>' + data[i].foodItem.name + '</td>'
												        + '<td>' + data[i].foodQuantity + '</td>'
												        + '<td>  <div class="badge bg-pill bg-soft-danger font-size-12">'+ data[i].status +'</div>  </td>'
														+ '<td>  <input type="button" id="activeBtn" class="btn btn-outline-info waves-effect waves-light" onclick="activePromoFood('+ data[i].id + ')" value="Active"></input></td>'
												        + '<td>  <input type="button" class="btn btn-outline-warning waves-effect waves-light" onclick="editPromoFood('+ data[i].id + ')" data-toggle="modal" data-target="#cartTwo" value="Edit"></input></td>'
												        + '<td>  <input type="button" class="btn btn-outline-danger waves-effect waves-light" onclick="deletePromoFood(' + data[i].id + ')" value="Delete"></input></td>'
												        + '</tr>');
									
									}
									
								}

							},
							error : function(err) {
								alert("error is" + err)
							}
						});
	}

	function activePromoFood(id) {
		
		$.ajax({
			type : "POST",
			url : "PromoFood/updatePromoFoodStatus",
			data : {
				
				id : id,
	            status : "Active"
	            
			},
			success : function(result) {				
				getAllPrmoFood()
			},
			error : function(err) {
				alert("error is" + err)
			}
		});
			
	}

	function deactivePromoFood(id) {
		
		$.ajax({
			type : "POST",
			url : "PromoFood/updatePromoFoodStatus",
			data : {
					
				id : id,
	            status : "Deactive"
	                
			},
			success : function(result) {				
				getAllPrmoFood()
			},
			error : function(err) {
				alert("error is" + err)
			}
		});
				
	}

	function editPromoFood(id) {

		$('#savePromoFoodBtn').hide();
		$('#updatePromoFoodBtn').show();
		$('#promoFoodIdField').show();
		$('#availableFoodQuantityField').show();
		$("#availablePromoQuantityField").show();		
		
		$.ajax({
			type : "GET",
			url : "PromoFood/getOnePromoFood/" + id,
			dataType : 'json',
			success : function(response) {

				$("#promoFoodId").val(response.id),
				getActivePromo(response.promo.name,response.promo.id),
				$("#availablePromoQuantity").val(response.promo.quantity),
				getActiveFoodItem(response.foodItem.name,response.foodItem.id),
				$("#availableFoodQuantity").val(response.foodItem.quantity),
				$('input[name="quantity"]').val(response.foodQuantity),

				promoQuantity = response.promo.quantity,
				foodQuantity = response.foodItem.quantity

			},
			error : function(err) {
				alert("error is" + err)
			}
		});
	}

	function updatePromoFood() {

		updateFoodItemQuantity($("#foodItemNameList").val(), $("#availableFoodQuantity").val());

		 $.ajax({
			type : "POST",
			url : "PromoFood/updatePromoFood",
			data : {

				id : $("#promoFoodId").val(),
				promoId  : $("#promoNameList").val(),
			    foodItemId  : $("#foodItemNameList").val(),
			    foodQuantity : $('input[name="quantity"]').val()
			    
			},
			success : function(result) {
				getAllPrmoFood()
			},
			error : function(err) {
				alert("error is" + err)
			}
		});	
	}

	function deletePromoFood(id) {
		
		$.ajax({
			url : "PromoFood/deletePromoFood/" + id,
			success : function(response) {
				getAllPrmoFood()
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
						<button type="button" class="btn header-item waves-effect" id="page-header-user-dropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <img class="rounded-circle header-profile-user" src="assets/images/users/avatar-4.jpg" alt="Header Avatar"> <span class="d-none d-xl-inline-block ms-1 fw-medium font-size-15"><% out.print(name);%></span> <i class="uil-angle-down d-none d-xl-inline-block font-size-15"></i> </button>
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
								<li><a href="./Category">Category</a></li>
								<li><a href="./FoodItem">Food Items</a></li>
								<li><a href="./Promo">Promo</a></li>
								<li><a href="./PromoFood">Promo Food</a></li>
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
		<div class="main-content">
			<div class="page-content">
				<div class="container-fluid">
					<!-- start page title -->
					<div class="row">
						<div class="col-12">
							<div class="page-title-box d-flex align-items-center justify-content-between">
								<h4 class="mb-0">Promo</h4>
								<div class="page-title-right">
									<ol class="breadcrumb m-0">
										<li class="breadcrumb-item"><a href="javascript: void(0);">Ecommerce</a></li>
										<li class="breadcrumb-item active">Promo</li>
									</ol>
								</div>
							</div>
						</div>
					</div>
					<!-- end page title -->
					<div class="row">
						<div class="col-lg-12">
							<div id="addproduct-accordion" class="custom-accordion">
								
						<div class="card">
									<a href="<spring:url value="#addproduct-billinginfo-collapse"/>" class="text-dark" data-bs-toggle="collapse" aria-expanded="true" aria-controls="addproduct-billinginfo-collapse">
										<div class="p-4">
											<div class="d-flex align-items-center">
												<div class="flex-shrink-0 me-3">
													<div class="avatar-xs">
														<div class="avatar-title rounded-circle bg-soft-primary text-primary"> 01 </div>
													</div>
												</div>
												<div class="flex-grow-1 overflow-hidden">
													<h5 class="font-size-16 mb-1">Add Food Item For Promo</h5>
													<p class="text-muted text-truncate mb-0">Fill information below</p>
												</div>
												<div class="flex-shrink-0"> <i class="mdi mdi-chevron-up accor-down-icon font-size-24"></i> </div>
											</div>
										</div>
									</a>
									<div id="addproduct-billinginfo-collapse" class="collapse show" data-bs-parent="#addproduct-accordion">
										<div class="p-4 border-top">
											<button type="button" class="btn btn-success waves-effect waves-light mb-3" data-toggle="modal" data-target="#cartTwo" onclick="addPromoFoodBtn()"><i class="mdi mdi-plus me-1"></i> Add Food Item</button>
										<div class="container mt-3">

									 
                                        <table id="datatable" class="table table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                           
                                            <thead>
					                            <tr>
													<th scope="col">ID</th>
													<th scope="col">Promo Name</th>
													<th scope="col">Food Item Name</th>
													<th scope="col">Food Quantity</th>
													<th scope="col">Status</th>
													<th scope="col">Action</th>
													<th scope="col">Edit</th>
													<th scope="col">Delete</th>
												</tr>
                                            </thead>
        
        
                                            <tbody id="FoodTable">
                                                                                        
                                            </tbody>
                                        </table>
									
										</div>

										</div>
									</div>
									
							<!-- Modal -->
							<div class="modal fade" id="cartTwo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog modal-lg" role="document">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel">Cart</h5>
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="document.location.reload(true)">
							          <span aria-hidden="true">&times;</span>
							        </button>
							      </div>
							      <div class="modal-body">
								  
	  									<form class="needs-validation" id="foodItemForm" name="foodItemForm" novalidate>
										
										<div class="row">
													
										  <div class="col">
										  
										  <div class="row" id="promoFoodIdField">
															<div class="col"></div>
															<div class="col">
															<div class="mb-3">
																	<label for="id">ID</label>
																	<input type="text" readonly="readonly" class="form-control" id="promoFoodId" name="promoFoodId">
																</div>
															</div>
															<div class="col"></div>
										  </div>
										  <div class="row" id="promoField">
														    <div class="col"></div>
															<div class="col">
																<div class="mb-3">
																	<label for="cars" class="form-label" for="validationCustom01">Promo</label>
																		 	<select class="form-control" id="promoNameList" onclick="checkFoodItemForPromo()" required>
																		 	
																			</select>
																<div class="invalid-feedback">
																	Please provide a valid promo.
																</div>
																</div>
															</div>
															<div class="col"></div>	
											 </div>
											 
											  <div class="row" id="availablePromoQuantityField">
															<div class="col"></div>
															<div class="col">
															<div class="mb-3">
																	<label for="id">Available Promo Quantity</label>
																	<input type="text" readonly="readonly" class="form-control" id="availablePromoQuantity" name="availablePromoQuantity">
																</div>
															</div>
															<div class="col"></div>
										    </div>
										
										
										      <div class="row" id="foodItemField">
														    <div class="col"></div>
															<div class="col">
																<div class="mb-3">
																	<label for="cars" class="form-label" for="validationCustom01">Food Item</label>
																		 	<select class="form-control" id="foodItemNameList" onclick="checkFoodItemForPromo()" required>

																			</select>
																<div class="invalid-feedback">
																	Please provide a valid food item.
																</div>
																</div>
															</div>
															<div class="col"></div>	
											 </div>
											 
											 <div class="row" id="availableFoodQuantityField">
															<div class="col"></div>
															<div class="col">
															<div class="mb-3">
																	<label for="id">Available Food Quantity</label>
																	<input type="text" readonly="readonly" class="form-control" id="availableFoodQuantity" name="availableFoodQuantity">
																</div>
															</div>
															<div class="col"></div>
										    </div>
										
											   <div class="row">
													<div class="col-lg-4">
														<div class="mb-3"></div>
													</div>
													<div class="col-md-4">
														<div class="mb-3">
														<label class="form-label" for="validationCustom03">Quantity</label>
															<div class="input-group plus-minus-input">
															  <div class="input-group-button">
																<button type="button" class="form-control" id="validationCustom03" onclick="calculateFoodQuantity('minus')">
																  <i class="fa fa-minus" aria-hidden="true"></i>
																</button>
															  </div>
															  <input type="number" class="form-control" name="quantity" id="quantity" required>
															  <div class="input-group-button">
																<button type="button" class="form-control" id="validationCustom03" onclick="calculateFoodQuantity('plus')">
																  <i class="fa fa-plus" aria-hidden="true"></i>
																</button>
															  </div>
															  <div class="invalid-feedback">
																Please provide a valid quantity.
															</div>
															</div>
														</div>
													</div>
													<div class="col-lg-4">
														<div class="mb-3"></div>
													</div>
											   </div>
														
											   <div class="row">
														    <div class="col"></div>
															<div class="col"></div>
															<div class="col">
															<div class="col text-end">
																	<button class="btn btn-success" type="submit" id="savePromoFoodBtn" onclick="savePromoFood()">Save</button>
																	<button class="btn btn-success" type="submit" id="updatePromoFoodBtn" onclick="updatePromoFood()">Update</button>
																	<button class="btn btn-danger" type="reset" onclick="resetQuantity()">Cancel</button>
															   </div>
															</div>
												</div>
														
													</div>
												    </div> 
                                                 </form>
													</div>

												
												</div>
											
       
                                          </div>
											<div class="modal-footer">
												
											</div>
                                     </div>
									
								</div>
						
								<div class="card">
									<a href="#addproduct-metadata-collapse" class="text-dark collapsed" data-bs-toggle="collapse" aria-haspopup="true" aria-expanded="false" aria-haspopup="true" aria-controls="addproduct-metadata-collapse">
										<div class="p-4">
											<div class="d-flex align-items-center">
												<div class="flex-shrink-0 me-3">
													<div class="avatar-xs">
														<div class="avatar-title rounded-circle bg-soft-primary text-primary"> 03 </div>
													</div>
												</div>
												<div class="flex-grow-1 overflow-hidden">
													<h5 class="font-size-16 mb-1">Promo Info</h5>

												</div>
												<div class="flex-shrink-0"> <i class="mdi mdi-chevron-up accor-down-icon font-size-24"></i> </div>
											</div>
										</div>
									</a>
									<div id="addproduct-metadata-collapse" class="collapse show" data-bs-parent="#addproduct-accordion">
										<div class="p-4 border-top">
											
		               
										
										<table id="datatable-buttons" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                            <thead>
                                            <tr>
                                                <th>Promo Name</th>
                                                <th>Food Item Name</th>
                                                <th>Food Quantity</th>
                                            </tr>
                                            </thead>
        
        
                                            <tbody id="infoTable">
                                           
                                            
                                            </tbody>
                                        </table>
                            
                              
                            <!-- end col -->
                        
											
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- end row -->
					<div class="row mb-4">
						
						<!-- end col -->
					</div>
					<!-- end row-->
				</div>
				<!-- container-fluid -->
			</div>
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
	</div>
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
	
	<!-- Required datatable js -->
	<script type="text/javascript" src="<spring:url value="/resources/libs/datatables.net/js/jquery.dataTables.min.js"/>"></script>
	<script type="text/javascript" src="<spring:url value="/resources/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js"/>"></script>
		
    <!-- Buttons examples -->
    <script type="text/javascript" src="<spring:url value="/resources/libs/datatables.net-buttons/js/dataTables.buttons.min.js"/>"></script>
    <script type="text/javascript" src="<spring:url value="/resources/libs/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js"/>"></script>
    <script type="text/javascript" src="<spring:url value="/resources/libs/jszip/jszip.min.js"/>"></script>
    <script type="text/javascript" src="<spring:url value="/resources/libs/pdfmake/build/pdfmake.min.js"/>"></script>
    <script type="text/javascript" src="<spring:url value="/resources/libs/pdfmake/build/vfs_fonts.js"/>"></script>
    <script type="text/javascript" src="<spring:url value="/resources/libs/datatables.net-buttons/js/buttons.html5.min.js"/>"></script>
    <script type="text/javascript" src="<spring:url value="/resources/libs/datatables.net-buttons/js/buttons.print.min.js"/>"></script>
    <script type="text/javascript" src="<spring:url value="/resources/libs/datatables.net-buttons/js/buttons.colVis.min.js"/>"></script>
        
    <!-- Responsive examples -->
    <script type="text/javascript" src="<spring:url value="/resources/libs/datatables.net-responsive/js/dataTables.responsive.min.js"/>"></script>
    <script type="text/javascript" src="<spring:url value="/resources/libs/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"/>"></script>

    <!-- Datatable init js -->
    <script type="text/javascript" src="<spring:url value="/resources/js/pages/datatables.init.js"/>"></script>
    
	<!-- select 2 plugin -->
	<script type="text/javascript" src="<spring:url value="/resources/libs/select2/js/select2.min.js"/>"></script>

	<!-- dropzone plugin -->
	<script type="text/javascript" src="<spring:url value="/resources/libs/dropzone/min/dropzone.min.js"/>"></script>
	
	<!-- init js -->
	<script type="text/javascript" src="<spring:url value="/resources/js/pages/ecommerce-add-product.init.js"/>"></script>
	<script type="text/javascript" src="<spring:url value="/resources/js/pages/form-advanced.init.js"/>"></script>
	
	<!-- parsleyjs -->
    <script type="text/javascript" src="<spring:url value="/resources/libs/parsleyjs/parsley.min.js"/>"></script>
	<script type="text/javascript" src="<spring:url value="/resources/js/pages/form-validation.init.js"/>"></script>
		
	<!-- Table Editable plugin -->
	<script type="text/javascript" src="<spring:url value="/resources/libs/table-edits/build/table-edits.min.js"/>"></script>
	<script type="text/javascript" src="<spring:url value="/resources/js/pages/table-editable.int.js"/>"></script>
		
	<!-- form mask -->
	<script type="text/javascript" src="<spring:url value="/resources/js/pages/table-editable.int.js"/>"></script>
	<script type="text/javascript" src="<spring:url value="/resources/libs/inputmask/min/jquery.inputmask.bundle.min.js"/>"></script>

	<!-- form mask init -->
	<script type="text/javascript" src="<spring:url value="/resources/js/pages/form-mask.init.js"/>"></script>
		
	<!-- plugins -->
	<script type="text/javascript" src="<spring:url value="/resources/libs/select2/js/select2.min.js"/>"></script>
	<script type="text/javascript" src="<spring:url value="/resources/js/pages/form-advanced.init.js"/>"></script>
     
	<!-- App js -->
	<script type="text/javascript" src="<spring:url value="/resources/js/app.js"/>"></script>
	
</body>

</html>