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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
	
	<script>

	$(document).ready(function() {
		getAllrecord();
		var imageVal;
	});


	function getAllrecord() {

		var data = "";
				$.ajax({
					type : "GET",
					url : "Message/getAllMessage",
					success : function(response) {
							data = response
	
							$('.tr').remove();
							for (i = 0; i < data.length; i++) {
								
		
									$("#messageTable")
										.append(
											'<tr class="tr">'
											+ '<td>' + data[i].id + '</td>'
											+ '<td>' + data[i].customer.id + '</td>'
											+ '<td>' + data[i].customer.firstName + '</td>'
											+ '<td>' + data[i].message + '</td>'
											+ '<td>' + data[i].date + '</td>'
											+ '<td>  <input type="button" class="btn btn-outline-warning waves-effect waves-light" onclick="readMessage('+ data[i].id + ')" data-toggle="modal" data-target="#cart" value="Read"></input></td>'
											+ '<td>  <input type="button" class="btn btn-outline-danger waves-effect waves-light" onclick="deleteMessage(' + data[i].id + ')" value="Delete"></input></td>'
											+ '</tr>');
											
											
						}
									
						},
					error : function(err) {
						   alert("error is" + err)
					}
					});
	}

	function readMessage(id){

		$.ajax({
			type : "GET",
			url : "Message/getOneMessage/" + id,
			dataType : 'json',
			success : function(response) {

				$("#id").val(response.id),
				$("#name").val(response.customer.firstName),
				$("#email").val(response.customer.email),
				$("#dateTime").val(response.date),
				$("#message").val(response.message)

			},
			error : function(err) {
				alert("error is" + err)
			}
		});
	}

	function deleteMessage(id) {

		Swal.fire({
			  title: 'Are you sure?',
			  text: "You won't be able to revert this!",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes, delete it!'
			}).then((result) => {
			  if (result.isConfirmed) {

					$.ajax({
						type : "GET",
						url : "Message/deleteMessage/" + id,
						success : function(response) {
							getAllrecord()
						},
						error : function(err) {
							alert("error is" + err)
						}
					});
				  
			    Swal.fire(
			      'Deleted!',
			      'Your file has been deleted.',
			      'success'
			    )
			  }
			})
	}

	function sendMessage(){

		$.ajax({
			type : "POST",
			url : "Message/replyMessage",
			data : {
	
				email : $("#email").val(),
				message : $("#message").val(),
				reply : $("#reply").val()
				
			},
			success : function(result) {
		
			},
			error : function(err) {

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
								<h4 class="mb-0">Message</h4>
								<div class="page-title-right">
									<ol class="breadcrumb m-0">
										<li class="breadcrumb-item"><a href="javascript: void(0);">Message</a></li>
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
									<a href="#addproduct-billinginfo-collapse" class="text-dark" data-bs-toggle="collapse" aria-expanded="true" aria-controls="addproduct-billinginfo-collapse">
										<div class="p-4">
											<div class="d-flex align-items-center">
												<div class="flex-shrink-0 me-3">
													<div class="avatar-xs">
														<div class="avatar-title rounded-circle bg-soft-primary text-primary"> 01 </div>
													</div>
												</div>
												<div class="flex-grow-1 overflow-hidden">
													<h5 class="font-size-16 mb-1">Send Message</h5>
													<p class="text-muted text-truncate mb-0">Fill all information below</p>
												</div>
												<div class="flex-shrink-0"> <i class="mdi mdi-chevron-up accor-down-icon font-size-24"></i> </div>
											</div>
										</div>
									</a>
									
									
									
									<div id="addproduct-billinginfo-collapse" class="collapse show" data-bs-parent="#addproduct-accordion">
										<div class="p-4 border-top">
										<div class="container mt-3">

                                                    
									 
									 
                                        <table id="datatable" class="table table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                            <thead>
					                            <tr>
													<th scope="col">#CM_ID</th>
													<th scope="col">#C_ID</th>
													<th scope="col">Customer Name</th>
													<th scope="col">Message</th>
													<th scope="col">Date</th>
													<th scope="col">Read</th>
													<th scope="col">Delete</th>
												</tr>
                                            </thead>
        
        
                                            <tbody id="messageTable">
                                            
                                             
                                            
                                            </tbody>
                                        </table>
									
										</div>

										</div>
									</div>
									
							<!-- Modal -->
							<div class="modal fade" id="cart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog modal-lg" role="document">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel">Cart</h5>
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="document.location.reload(true)">
							          <span aria-hidden="true">&times;</span>
							        </button>
							      </div>
							      <div class="modal-body">
								  
	  										<form id="categoryForm" name="categoryform" class="needs-validation" novalidate>
												<div class="row">
													
														<div class="col">
															
														<div class="row" id="idfield">
															<div class="col"></div>
															<div class="col">
															<div class="mb-3">
																	<label for="id">#CM_ID</label>
																	<input type="text" readonly="readonly" class="form-control" id="id" name="id">
																</div>
															</div>
															<div class="col"></div>
														</div>
									
									
														<div class="row">
														    <div class="col"></div>
															<div class="col">
																<div class="mb-3">
																	<label class="form-label" for="validationCustom03">Customer Name</label><br>
																	 <input type="text" class="form-control" readonly="readonly" required name="name" id="name">
																	<div class="invalid-feedback">
																		Please provide a valid customer name.
																	</div>
																</div>
															</div>
															<div class="col"></div>	
														</div>
														
														<div class="row">
														    <div class="col"></div>
															<div class="col">
																<div class="mb-3">
																	<label class="form-label" for="validationCustom03">Customer Email</label><br>
																	 <input type="text" class="form-control" readonly="readonly" required name="email" id="email">
																	<div class="invalid-feedback">
																		Please provide a valid customer email.
																	</div>
																</div>
															</div>
															<div class="col"></div>	
														</div>
														
														<div class="row">
														    <div class="col"></div>
															<div class="col">
																<div class="mb-3">
																	<label class="form-label" for="validationCustom03">Date & Time</label><br>
																	 <input type="text" class="form-control" readonly="readonly" required name="dateTime" id="dateTime">
																	<div class="invalid-feedback">
																		Please provide a valid date & time.
																	</div>
																</div>
															</div>
															<div class="col"></div>	
														</div>
														
														<div class="row">
														    <div class="col"></div>
															<div class="col">
																<div class="mb-3">
																	<label class="form-label" for="validationCustom03">Message</label><br>
																	 <textarea  class="form-control" rows="5" readonly="readonly" required name="message" id="message"></textarea>
																	<div class="invalid-feedback">
																		Please provide a valid message.
																	</div>
																</div>
															</div>
															<div class="col"></div>	
														</div>
									
														<div class="row">
														    <div class="col"></div>
															<div class="col">
																<div class="mb-3">
																	<label class="form-label" for="validationCustom02">Reply</label>
																	<textarea  class="form-control" rows="5" required name="reply" id="reply"></textarea>
																	<div class="invalid-feedback">
																		Please provide a valid reply.
																	</div>
																</div>
															</div>
															<div class="col"></div>
														</div>
									
														
														<div class="row">
														    <div class="col"></div>
															<div class="col"></div>
															<div class="col">
															<div class="col text-end">
																	<button class="btn btn-success" type="submit" id="sendMessageBtn" onclick="sendMessageBtn()">Save</button>
																	<button class="btn btn-danger" type="reset" >Cancel</button>
															   </div>
															</div>
														</div>
														
													</div>
												    </div>
												    </form>
													</div>

												
												</div>
										
       
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
							</script> � Henry Bakers. </div>
						
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
	
	</div>
	
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

	
	<!-- parsleyjs -->
    <script type="text/javascript" src="<spring:url value="/resources/libs/parsleyjs/parsley.min.js"/>"></script>
	<script type="text/javascript" src="<spring:url value="/resources/js/pages/form-validation.init.js"/>"></script>
		
	<!-- Table Editable plugin -->
	<script type="text/javascript" src="<spring:url value="/resources/libs/table-edits/build/table-edits.min.js"/>"></script>
	<script type="text/javascript" src="<spring:url value="/resources/js/pages/table-editable.int.js"/>"></script>
	
	 <!-- Sweet Alerts js -->
     <script type="text/javascript" src="<spring:url value="/resources/libs/sweetalert2/sweetalert2.min.js"/>"></script>

     <!-- Sweet alert init js-->
     <script type="text/javascript" src="<spring:url value="/resources/js/pages/sweet-alerts.init.js"/>"></script>
  
	<!-- App js -->
	<script type="text/javascript" src="<spring:url value="/resources/js/app.js"/>"></script>
	
</body>

</html>