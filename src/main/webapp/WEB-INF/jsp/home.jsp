<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import= "com.Entity.Customer"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<!DOCTYPE html>
<html style="font-size: 16px;">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="HENRY BAKERS, Heanry Bakers, Fastest Order Delivery, Best Qyality&nbsp;Ingredients">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <title>Home</title>
    
    <link rel="stylesheet" href="resources/admin/css/nicepage.css" media="screen">
    <link rel="stylesheet" href="resources/admin/css/Home.css" media="screen">
    
    <script class="u-script" type="text/javascript" src="resources/admin/js/jquery.js" defer=""></script>
    <script class="u-script" type="text/javascript" src="resources/admin/js/nicepage.js" defer=""></script>
    
    
    <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">
    <link id="u-page-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Annie+Use+Your+Telescope:400">
    
    
     <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    
    
    
    
    
    
    <script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": "Site4",
		"sameAs": [
				"https://www.facebook.com/Henry-Bakers-100880608799532/",
				"https://twitter.com/name",
				"https://instagram.com/name"
		]
}</script>
    <meta name="theme-color" content="#478ac9">
    <meta name="twitter:site" content="@">
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:title" content="Home">
    <meta name="twitter:description" content="Site4">
    <meta property="og:title" content="Home">
    <meta property="og:description" content="">
    <meta property="og:type" content="website">
    
    <script>

 $(document).ready(function() {
    	getActivePromo(),
    	getActiveCategory()
		
	});

	function getActivePromo() {
		
	    var status = "Active";
		var data = "";
		
				$.ajax({
						type : "GET",
						url :"Home/getActivePrmomo/"+ status,
						success : function(response) {
							 data = response
							 
								for (i = 0; i < data.length; i++) {
									
										$("#promoRow").append(
															' <div class="u-align-center u-container-style u-products-item u-repeater-item">'
												  			+ '<div class="u-container-layout u-similar-container u-valign-bottom-sm u-container-layout-3">'
												  			+ '<img alt="" class="u-expanded-width u-image u-image-default u-product-control u-image-3" src="<spring:url value="/resources/siteImage/' + data[i].image + '"/>"'
												  			+ '<div class="u-align-center u-container-style u-expanded-width u-group u-group-3">'
												  			+ '<div class="u-container-layout u-container-layout-4">'
												  			+ '<h4 class="u-custom-font u-product-control u-text u-text-custom-color-2 u-text-3">'
												  			+ '<a class="u-product-title-link" href="#">' + data[i].name + '</a>'
												  			+ '</h4>'
												  			+ '<div class="u-product-control u-product-price u-product-price-1">'
												  			+ '<div class="u-price-wrapper u-spacing-10">'
												  			+ '<div class="u-hide-price u-old-price">$12</div>'
												  			+ '<div class="u-price u-text-palette-2-base" style="font-size: 1.25rem; font-weight: 700;">Rs ' + data[i].price + '</div>'
												  			+ '</div>'
												  			+ '</div>'
												  			+ '</div>'
												  			+ '</div>'
												  			+ '</div>'
												  			+ '</div>');
										
									}
							
							},
							error : function(err) {
								alert("error is" + err)
							}
						});
	}

	function getActiveCategory() {
		
	    var status = "Active";
		var data = "";
		
				$.ajax({
						type : "GET",
						url :"Home/getActiveCategory/"+ status,
						success : function(response) {
							 data = response
							 
								for (i = 0; i < data.length; i++) {
									
										$("#categoryRow").append(
												 				  '<div class="u-align-center u-container-style u-products-item u-repeater-item u-shape-rectangle">'
												 				+ '<div class="u-container-layout u-similar-container u-valign-bottom-sm u-container-layout-1">'
												 				+ '<img alt="" class="u-image u-image-default u-product-control u-image-1" src="<spring:url value="/resources/siteImage/' + data[i].image + '"/>"'
												 				+ '<div class="u-align-center u-container-style u-group u-group-1">'
												 				+ '<div class="u-container-layout u-container-layout-2">'
												 				+ '<h4 class="u-product-control u-text u-text-palette-4-dark-1 u-text-3">'
												 				+ '<a class="u-product-title-link" href="./FoodItemMenu"><!--product_title_content-->' + data[i].name + '<!--/product_title_content--></a>'
												 				+ '</h4>'
												 				+ '<a href="./FoodItemMenu" class="u-border-3 u-border-active-custom-color-2 u-border-grey-90 u-border-hover-palette-2-base u-btn u-button-style u-none u-radius-0 u-text-active-custom-color-2 u-text-grey-40 u-text-hover-palette-2-base u-btn-1">View Menu</a>'
												 				+ '</div></div></div></div>');
												 
									}
							
							},
							error : function(err) {
								alert("error is" + err)
							}
						});
	}
    
    </script>
    
  </head>
  <body data-home-page="Home.html" data-home-page-title="Home" class="u-body u-overlap"><header class=" u-clearfix u-header u-section-row-container" id="sec-8947"><div class="u-section-rows" style="margin-bottom: 0px;">
        <div class="u-section-row u-sticky u-sticky-e2a9 u-section-row-1" id="sec-71fa">
          
          
          
          
          
          <div class="u-clearfix u-sheet u-valign-middle-xl u-sheet-1">
            <h2 class="u-subtitle u-text u-text-default u-text-grey-15 u-text-1" data-animation-name="fadeIn" data-animation-duration="1000" data-animation-delay="0" data-animation-direction="Down">HENRY BAKERS</h2><span class="u-black u-icon u-icon-circle u-spacing-7 u-text-custom-color-2 u-icon-1"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 512 512" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-1b47"></use></svg><svg class="u-svg-content" viewBox="0 0 512 512" x="0px" y="0px" id="svg-1b47" style="enable-background:new 0 0 512 512;"><g><g><path d="M498.682,435.326L297.917,234.56L63.357,0H45.026l-3.743,9.511c-9.879,25.104-14.1,50.78-12.205,74.249    c2.16,26.752,12.323,49.913,29.392,66.982L241.58,333.852l24.152-24.152l169.285,189.293c16.84,16.84,45.825,17.84,63.665,0    C516.236,481.439,516.236,452.879,498.682,435.326z"></path>
</g>
</g><g><g><path d="M156.728,291.442L13.317,434.853c-17.552,17.552-17.552,46.113,0,63.665c16.674,16.674,45.519,18.146,63.665,0    l143.412-143.412L156.728,291.442z"></path>
</g>
</g><g><g><path d="M490.253,85.249l-81.351,81.35l-21.223-21.222l81.351-81.351l-21.222-21.222l-81.35,81.35l-21.222-21.222l81.351-81.35    L405.366,0.361L299.256,106.471c-12.981,12.981-20.732,30.217-21.828,48.535c-0.277,4.641-1.329,9.206-3.074,13.548l68.929,68.929    c4.342-1.747,8.908-2.798,13.548-3.075c18.318-1.093,35.554-8.846,48.535-21.827l106.11-106.109L490.253,85.249z"></path>
</g>
</g></svg></span><span class="u-icon u-icon-circle u-text-custom-color-2 u-icon-2" data-href="./MyAccount" data-page-id="97836832"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 55 55" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-3a3b"></use></svg><svg class="u-svg-content" viewBox="0 0 55 55" x="0px" y="0px" id="svg-3a3b" style="enable-background:new 0 0 55 55;"><path d="M55,27.5C55,12.337,42.663,0,27.5,0S0,12.337,0,27.5c0,8.009,3.444,15.228,8.926,20.258l-0.026,0.023l0.892,0.752
	c0.058,0.049,0.121,0.089,0.179,0.137c0.474,0.393,0.965,0.766,1.465,1.127c0.162,0.117,0.324,0.234,0.489,0.348
	c0.534,0.368,1.082,0.717,1.642,1.048c0.122,0.072,0.245,0.142,0.368,0.212c0.613,0.349,1.239,0.678,1.88,0.98
	c0.047,0.022,0.095,0.042,0.142,0.064c2.089,0.971,4.319,1.684,6.651,2.105c0.061,0.011,0.122,0.022,0.184,0.033
	c0.724,0.125,1.456,0.225,2.197,0.292c0.09,0.008,0.18,0.013,0.271,0.021C25.998,54.961,26.744,55,27.5,55
	c0.749,0,1.488-0.039,2.222-0.098c0.093-0.008,0.186-0.013,0.279-0.021c0.735-0.067,1.461-0.164,2.178-0.287
	c0.062-0.011,0.125-0.022,0.187-0.034c2.297-0.412,4.495-1.109,6.557-2.055c0.076-0.035,0.153-0.068,0.229-0.104
	c0.617-0.29,1.22-0.603,1.811-0.936c0.147-0.083,0.293-0.167,0.439-0.253c0.538-0.317,1.067-0.648,1.581-1
	c0.185-0.126,0.366-0.259,0.549-0.391c0.439-0.316,0.87-0.642,1.289-0.983c0.093-0.075,0.193-0.14,0.284-0.217l0.915-0.764
	l-0.027-0.023C51.523,42.802,55,35.55,55,27.5z M2,27.5C2,13.439,13.439,2,27.5,2S53,13.439,53,27.5
	c0,7.577-3.325,14.389-8.589,19.063c-0.294-0.203-0.59-0.385-0.893-0.537l-8.467-4.233c-0.76-0.38-1.232-1.144-1.232-1.993v-2.957
	c0.196-0.242,0.403-0.516,0.617-0.817c1.096-1.548,1.975-3.27,2.616-5.123c1.267-0.602,2.085-1.864,2.085-3.289v-3.545
	c0-0.867-0.318-1.708-0.887-2.369v-4.667c0.052-0.52,0.236-3.448-1.883-5.864C34.524,9.065,31.541,8,27.5,8
	s-7.024,1.065-8.867,3.168c-2.119,2.416-1.935,5.346-1.883,5.864v4.667c-0.568,0.661-0.887,1.502-0.887,2.369v3.545
	c0,1.101,0.494,2.128,1.34,2.821c0.81,3.173,2.477,5.575,3.093,6.389v2.894c0,0.816-0.445,1.566-1.162,1.958l-7.907,4.313
	c-0.252,0.137-0.502,0.297-0.752,0.476C5.276,41.792,2,35.022,2,27.5z"></path></svg></span><span class="u-icon u-icon-circle u-text-custom-color-2 u-icon-3"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 406.783 406.783" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-f7fc"></use></svg><svg class="u-svg-content" viewBox="0 0 406.783 406.783" x="0px" y="0px" id="svg-f7fc" style="enable-background:new 0 0 406.783 406.783;"><g><g><path d="M127.12,256.572c-19.742,0-35.741,15.993-35.741,35.737c0,19.745,15.999,35.738,35.741,35.738    c19.749,0,35.744-15.993,35.744-35.738C162.864,272.565,146.869,256.572,127.12,256.572z M127.12,307.846    c-8.582,0-15.536-6.955-15.536-15.537c0-8.586,6.954-15.537,15.536-15.537c8.583,0,15.542,6.951,15.542,15.537    C142.662,300.891,135.703,307.846,127.12,307.846z"></path><path d="M315.588,256.572c-19.742,0-35.74,15.993-35.74,35.737c0,19.745,15.998,35.738,35.74,35.738    c19.75,0,35.744-15.993,35.744-35.738C351.332,272.565,335.338,256.572,315.588,256.572z M315.588,307.846    c-8.582,0-15.535-6.955-15.535-15.537c0-8.586,6.953-15.537,15.535-15.537c8.584,0,15.543,6.951,15.543,15.537    C331.131,300.891,324.172,307.846,315.588,307.846z"></path><path d="M167.329,146.759c0,5.008-4.098,9.105-9.105,9.105H32.579c-5.008,0-9.104-4.097-9.104-9.105v-5.463    c0-5.007,4.097-9.104,9.104-9.104h125.645c5.008,0,9.105,4.097,9.105,9.104V146.759z"></path><path d="M385.623,200.066c-13.105-3.407-20.604-5.549-25.75-15.487l-17.207-34.839c-5.148-9.938-18.518-18.07-29.707-18.07    h-23.535c0,0-3.166,0.066-3.166-3.12c0-7.305,0-29.219,0-29.219c0-11.327-6.41-20.595-20.045-20.595H74.405    c-19.521,0-28.789,9.269-28.789,20.595v18.311c0,0,0,5.446,5.271,5.446c26.834,0,107.337,0,107.337,0    c10.041,0,18.21,8.168,18.21,18.209v5.463c0,10.041-8.169,18.209-18.21,18.209H50.887c0,0-5.271-0.438-5.271,5.252    c0,2.826,0,4.723,0,6.297c0,5.008,6.864,5.005,6.864,5.005h72.254c10.041,0,18.21,8.169,18.21,18.209v5.463    c0,10.041-8.169,18.209-18.21,18.209H53.62c0,0-8.004-0.148-8.004,6.225c0,11.062,0,44.246,0,44.246    c0,11.326,9.268,20.595,20.595,20.595c0,0,8.532,0,11.376,0c2.58,0,2.96-1.437,2.96-2.159c0-25.679,20.894-46.568,46.574-46.568    c25.682,0,46.575,20.891,46.575,46.568c0,0.725-0.206,2.159,1.767,2.159c22.55,0,91.806,0,91.806,0    c1.82,0,1.746-1.534,1.746-2.159c0-25.679,20.893-46.568,46.574-46.568s46.574,20.891,46.574,46.568    c0,0.725-0.018,2.159,1.121,2.159c10.34,0,23.146,0,23.146,0c11.195,0,20.352-9.157,20.352-20.351v-38.664    C406.783,202.894,396.502,202.894,385.623,200.066z M346.896,198.255c0,0-43.219,0-57.928,0c-2.393,0-2.711-2.33-2.711-2.33    V147.67c0,0-0.135-1.853,2.938-1.853c4.133,0,16.529,0,16.529,0c9.959,0,21.855,7.236,26.434,16.079l15.312,31    c0.645,1.248,1.334,2.356,2.072,3.349C350.086,196.973,349.174,198.255,346.896,198.255z"></path><path d="M133.838,205.195c0,5.008-4.097,9.105-9.104,9.105H9.104C4.096,214.3,0,210.203,0,205.195v-5.463    c0-5.007,4.097-9.104,9.104-9.104h115.63c5.008,0,9.104,4.097,9.104,9.104V205.195z"></path>
</g>
</g></svg></span><span class="u-icon u-icon-circle u-text-custom-color-2 u-icon-4"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 469.333 469.333" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-8807"></use></svg><svg class="u-svg-content" viewBox="0 0 469.333 469.333" x="0px" y="0px" id="svg-8807" style="enable-background:new 0 0 469.333 469.333;"><g><g><path d="M416,181.333H53.333C23.915,181.333,0,205.269,0,234.667v128C0,392.064,23.915,416,53.333,416H416    c29.419,0,53.333-23.936,53.333-53.333v-128C469.333,205.269,445.419,181.333,416,181.333z M96,288    c5.888,0,10.667,4.779,10.667,10.667S101.888,309.333,96,309.333H64V352h53.333c5.888,0,10.667,4.779,10.667,10.667    c0,5.888-4.779,10.667-10.667,10.667h-64c-5.888,0-10.667-4.779-10.667-10.667v-128c0-5.888,4.779-10.667,10.667-10.667h64    c5.888,0,10.667,4.779,10.667,10.667s-4.779,10.667-10.667,10.667H64V288H96z M251.243,371.541    c-1.813,1.216-3.861,1.792-5.909,1.792c-3.435,0-6.805-1.664-8.875-4.757l-33.792-50.688l-33.792,50.688    c-2.069,3.093-5.44,4.757-8.875,4.757c-2.048,0-4.096-0.576-5.909-1.792c-4.885-3.264-6.229-9.877-2.965-14.784l38.72-58.091    l-38.72-58.091c-3.264-4.907-1.941-11.52,2.965-14.784c4.864-3.264,11.499-1.963,14.784,2.965l33.792,50.688l33.792-50.688    c3.285-4.928,9.941-6.229,14.784-2.965c4.885,3.264,6.229,9.877,2.965,14.784l-38.72,58.091l38.72,58.091    C257.472,361.664,256.149,368.277,251.243,371.541z M298.667,362.667c0,5.888-4.779,10.667-10.667,10.667    s-10.667-4.779-10.667-10.667v-128c0-5.888,4.779-10.667,10.667-10.667s10.667,4.779,10.667,10.667V362.667z M416,245.333h-32    v117.333c0,5.888-4.779,10.667-10.667,10.667s-10.667-4.779-10.667-10.667V245.333h-32c-5.888,0-10.667-4.779-10.667-10.667    S324.779,224,330.667,224H416c5.888,0,10.667,4.779,10.667,10.667S421.888,245.333,416,245.333z"></path>
</g>
</g><g><g><path d="M96,96c-5.888,0-10.667,4.779-10.667,10.667V192c0,5.888,4.779,10.667,10.667,10.667s10.667-4.779,10.667-10.667v-85.333    C106.667,100.779,101.888,96,96,96z"></path>
</g>
</g><g><g><path d="M373.333,96c-5.888,0-10.667,4.779-10.667,10.667V192c0,5.888,4.779,10.667,10.667,10.667S384,197.888,384,192v-85.333    C384,100.779,379.221,96,373.333,96z"></path>
</g>
</g><g><g><path d="M160,53.333H32c-5.888,0-10.667,4.779-10.667,10.667c0,29.397,23.915,53.333,53.333,53.333h42.667    c29.419,0,53.333-23.936,53.333-53.333C170.667,58.112,165.888,53.333,160,53.333z"></path>
</g>
</g><g><g><path d="M437.333,53.333h-128c-5.888,0-10.667,4.779-10.667,10.667c0,29.397,23.915,53.333,53.333,53.333h42.667    C424.085,117.333,448,93.397,448,64C448,58.112,443.221,53.333,437.333,53.333z"></path>
</g>
</g></svg></span>
          </div>
        </div>
        <div class="u-section-row u-sticky u-sticky-c88c u-section-row-2" id="sec-13b1">
          <div class="u-clearfix u-sheet u-sheet-2">
            <nav class="u-menu u-menu-dropdown u-offcanvas u-menu-1" data-responsive-from="MD">
              <div class="menu-collapse" style="font-size: 1rem; letter-spacing: 0px; font-weight: 700;">
                <a class="u-button-style u-custom-active-border-color u-custom-active-color u-custom-border u-custom-border-color u-custom-borders u-custom-hover-border-color u-custom-hover-color u-custom-left-right-menu-spacing u-custom-text-active-color u-custom-text-color u-custom-text-hover-color u-custom-top-bottom-menu-spacing u-nav-link" href="#">
                  <svg><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#menu-hamburger"></use></svg>
                  <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><defs><symbol id="menu-hamburger" viewBox="0 0 16 16" style="width: 16px; height: 16px;"><rect y="1" width="16" height="2"></rect><rect y="7" width="16" height="2"></rect><rect y="13" width="16" height="2"></rect>
</symbol>
</defs></svg>
                </a>
              </div>
              <div class="u-custom-menu u-nav-container">
                <ul class="u-nav u-spacing-20 u-unstyled u-nav-1"><li class="u-nav-item"><a class="u-border-active-palette-1-base u-border-hover-palette-1-base u-button-style u-nav-link u-text-active-custom-color-2 u-text-custom-color-1 u-text-hover-palette-2-base" href="./Home" style="padding: 10px 0px;">Home</a>
</li><li class="u-nav-item"><a class="u-border-active-palette-1-base u-border-hover-palette-1-base u-button-style u-nav-link u-text-active-custom-color-2 u-text-custom-color-1 u-text-hover-palette-2-base" href="./About" style="padding: 10px 0px;">About</a>
</li><li class="u-nav-item"><a class="u-border-active-palette-1-base u-border-hover-palette-1-base u-button-style u-nav-link u-text-active-custom-color-2 u-text-custom-color-1 u-text-hover-palette-2-base" href="./Feature" style="padding: 10px 0px;">Feature</a>
</li><li class="u-nav-item"><a class="u-border-active-palette-1-base u-border-hover-palette-1-base u-button-style u-nav-link u-text-active-custom-color-2 u-text-custom-color-1 u-text-hover-palette-2-base" href="./Menu" style="padding: 10px 0px;">Menu</a>
</li><li class="u-nav-item"><a class="u-border-active-palette-1-base u-border-hover-palette-1-base u-button-style u-nav-link u-text-active-custom-color-2 u-text-custom-color-1 u-text-hover-palette-2-base" href="./Chef" style="padding: 10px 0px;">Chef</a>
</li><li class="u-nav-item"><a class="u-border-active-palette-1-base u-border-hover-palette-1-base u-button-style u-nav-link u-text-active-custom-color-2 u-text-custom-color-1 u-text-hover-palette-2-base" href="./Contact" style="padding: 10px 0px;">Contact</a>
</li></ul>
              </div>
              <div class="u-custom-menu u-nav-container-collapse">
                <div class="u-black u-container-style u-inner-container-layout u-opacity u-opacity-95 u-sidenav">
                  <div class="u-sidenav-overflow">
                    <div class="u-menu-close"></div>
                    <ul class="u-align-center u-nav u-popupmenu-items u-unstyled u-nav-2"><li class="u-nav-item"><a class="u-button-style u-nav-link" href="./Home" style="padding: 10px 4px;">Home</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link" href="./About" style="padding: 10px 4px;">About</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link" href="./Feature" style="padding: 10px 4px;">Feature</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link" href="./Menu" style="padding: 10px 4px;">Menu</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link" href="./Chef" style="padding: 10px 4px;">Chef</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link" href="./Contact" style="padding: 10px 4px;">Contact</a>
</li></ul>
                  </div>
                </div>
                <div class="u-black u-menu-overlay u-opacity u-opacity-70"></div>
              </div>
            </nav><!--shopping_cart-->
            <a class="u-shopping-cart u-shopping-cart-1" href="./ShoppingCart"><span class="u-icon u-shopping-cart-icon"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 16 16" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-58a1"></use></svg><svg class="u-svg-content" viewBox="0 0 16 16" x="0px" y="0px" id="svg-58a1"><path d="M14.5,3l-2.1,5H6.1L5.9,7.6L4,3H14.5 M0,0v1h2.1L5,8l-2,4h11v-1H4.6l1-2H13l3-7H3.6L2.8,0H0z M12.5,13
	c-0.8,0-1.5,0.7-1.5,1.5s0.7,1.5,1.5,1.5s1.5-0.7,1.5-1.5S13.3,13,12.5,13L12.5,13z M4.5,13C3.7,13,3,13.7,3,14.5S3.7,16,4.5,16
	S6,15.3,6,14.5S5.3,13,4.5,13L4.5,13z"></path></svg>
        <span class="u-icon-circle u-palette-1-base u-shopping-cart-count" style="font-size: 0.75rem;"><!--shopping_cart_count-->2<!--/shopping_cart_count--></span>
    </span>
            </a><!--/shopping_cart-->
          </div>
          
          
          
          
          
        </div>
      </div></header>
    <section class="u-clearfix u-video u-section-1" id="sec-d18c">
      <div class="u-background-video u-expanded u-video-contain" style="">
        <div class="embed-responsive embed-responsive-1">
          <iframe style="position: absolute;top: 0;left: 0;width: 100%;height: 100%;" class="embed-responsive-item" src="https://www.youtube.com/embed/BX0rDbMlbto?playlist=BX0rDbMlbto&amp;loop=1&amp;mute=1&amp;showinfo=0&amp;controls=0&amp;start=0&amp;autoplay=1" frameborder="0" allowfullscreen=""></iframe>
        </div>
      </div>
      <div class="u-clearfix u-sheet u-sheet-1"><span class="u-black u-icon u-icon-circle u-spacing-10 u-text-custom-color-2 u-icon-1"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 469.333 469.333" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-37ae"></use></svg><svg class="u-svg-content" viewBox="0 0 469.333 469.333" x="0px" y="0px" id="svg-37ae" style="enable-background:new 0 0 469.333 469.333;"><g><g><g><path d="M394.667,384H74.75c-5.885,0-10.656,4.771-10.667,10.656l-0.042,31.104c-0.01,11.635,4.51,22.573,12.729,30.802     c8.229,8.24,19.156,12.771,30.792,12.771h254.25c24,0,43.521-19.521,43.521-43.521v-31.146     C405.333,388.771,400.563,384,394.667,384z"></path><path d="M352,42.667c-6.531,0-13.24,0.656-20.344,1.979C307.25,16.187,272.271,0,234.667,0c-70.583,0-128,57.417-128,128     c0,5.885-4.781,10.667-10.667,10.667c-5.885,0-10.667-4.781-10.667-10.667c0-23.094,5.313-45.438,15.792-66.406     c1.865-3.729,1.385-8.198-1.219-11.448c-2.604-3.229-6.865-4.667-10.906-3.677C36.594,59.542,0,106.229,0,160     c0,44.333,25,84.635,64.25,104.562l-0.115,87.427c0,2.823,1.115,5.542,3.115,7.552c2.01,2,4.719,3.125,7.552,3.125h319.865     c5.896,0,10.667-4.771,10.667-10.667v-87.594c39.104-19.979,64-60.219,64-104.406C469.333,95.302,416.698,42.667,352,42.667z      M156.104,296.25c-1.99,1.625-4.385,2.417-6.76,2.417c-3.083,0-6.146-1.333-8.26-3.896c-3.521-4.302-34.417-42.76-34.417-70.771     c0-5.896,4.771-10.667,10.667-10.667c5.896,0,10.667,4.771,10.667,10.667c0,15.438,18.146,43.292,29.583,57.229     C161.312,285.792,160.656,292.51,156.104,296.25z M245.333,288c0,5.896-4.771,10.667-10.667,10.667S224,293.896,224,288v-64     c0-5.896,4.771-10.667,10.667-10.667s10.667,4.771,10.667,10.667V288z M328.25,294.771c-2.115,2.563-5.167,3.896-8.25,3.896     c-2.385,0-4.781-0.792-6.76-2.417c-4.552-3.74-5.219-10.458-1.49-15.01c11.438-13.969,29.583-41.854,29.583-57.24     c0-5.896,4.771-10.667,10.667-10.667c5.896,0,10.667,4.771,10.667,10.667C362.667,252.01,331.771,290.469,328.25,294.771z"></path>
</g>
</g>
</g></svg></span>
        <h1 class="u-custom-font u-text u-text-default u-title u-text-1">
          <span class="u-text-custom-color-2" style="font-weight: 700;">Heanry&nbsp;</span>
          <span class="u-text-custom-color-1" style="font-weight: 700;">Bakers</span>
        </h1>
        <a href="./Menu" data-page-id="47550152" class="u-active-palette-2-base u-border-2 u-border-active-black u-border-custom-color-1 u-border-hover-black u-btn u-btn-round u-button-style u-hover-custom-color-1 u-none u-radius-50 u-text-black u-text-hover-black u-btn-1">View Menu</a>
      </div>
    </section>
    <section id="carousel_f6e5" class="u-carousel u-slide u-block-084a-1" data-u-ride="carousel" data-interval="2500">
      <ol class="u-absolute-hcenter u-carousel-indicators u-block-084a-2">
        <li data-u-target="#carousel_f6e5" data-u-slide-to="0" class="u-active u-active-custom-color-2 u-grey-30 u-shape-rectangle" style="width: 30px; height: 3px;"></li>
        <li data-u-target="#carousel_f6e5" class="u-active-custom-color-2 u-grey-30 u-shape-rectangle" data-u-slide-to="1" style="width: 30px; height: 3px;"></li>
      </ol>
      <div class="u-carousel-inner" role="listbox">
        <div class="skrollable u-active u-align-center u-carousel-item u-clearfix u-image u-parallax u-shading u-section-2-1" src="" data-image-width="1920" data-image-height="1080">
          <div class="u-align-left u-clearfix u-sheet u-sheet-1"><span class="u-icon u-icon-circle u-text-body-color u-icon-1" data-animation-name="jackInTheBox" data-animation-duration="1000" data-animation-delay="0" data-animation-direction=""><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 512 512" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-f06a"></use></svg><svg class="u-svg-content" viewBox="0 0 512 512" id="svg-f06a"><path d="m344 128 39.35 133.789a16.015 16.015 0 0 1 .65 4.511v229.7h-128v-368z" fill="#93573d"></path><path d="m304 496h-280v-228.061a32.033 32.033 0 0 1 .955-7.761l39.045-132.178h280l-39.045 132.178a32.033 32.033 0 0 0 -.955 7.761z" fill="#ab6647"></path><path d="m126.816 440h-13.632a16 16 0 0 1 -15.96-17.14l6.776-94.86h32l6.776 94.86a16 16 0 0 1 -15.96 17.14z" fill="#e74444"></path><path d="m214.32 440h-12.64a16 16 0 0 1 -15.921-17.592l6.241-62.408h32l6.241 62.408a16 16 0 0 1 -15.921 17.592z" fill="#e74444"></path><path d="m56 80c-8.837 0-16 10.745-16 24s7.163 24 16 24h288v-48z" fill="#93573d"></path><path d="m392 100.773a35.226 35.226 0 0 1 -35.226 35.227h-19.667a3.226 3.226 0 0 0 -1.981.68l-49.926 38.832a27.227 27.227 0 0 1 -37.976-4.483 27.228 27.228 0 0 1 2.008-36.26l49.261-49.261a3.226 3.226 0 0 0 -2.282-5.508h-144.211l80.114-43.7a35.232 35.232 0 0 1 16.869-4.3h203.791a3.227 3.227 0 0 1 3.226 3.226v57.548a3.227 3.227 0 0 1 -3.226 3.226h-56a4.773 4.773 0 0 0 -4.774 4.773z" fill="#f5cbaa"></path><path d="m424 16h64v104h-64z" fill="#155384"></path><path d="m304 496 40-40 40 40z" fill="#794832"></path><path d="m192 360v-8l-16-8s6-80 48-80v96z" fill="#d9dbdd"></path><path d="m152 296-16 32h-32l-16-32z" fill="#d9dbdd"></path><path d="m232 359.6v-95.6a8 8 0 0 0 -8-8c-48.86 0-55.71 83.833-55.978 87.4a8 8 0 0 0 4.4 7.754l11.578 5.79v2.66l-6.2 62.008a24 24 0 0 0 23.88 26.388h12.64a24 24 0 0 0 23.88-26.388zm-47.451-20.27a175.605 175.605 0 0 1 7.365-33.019c6.148-18.091 14.226-29.1 24.086-32.853v78.542h-16a8 8 0 0 0 -4.422-7.155zm35.7 90.038a7.91 7.91 0 0 1 -5.929 2.632h-12.64a8 8 0 0 1 -7.961-8.8l5.521-55.2h17.52l5.521 55.2a7.908 7.908 0 0 1 -2.029 6.168z"></path><path d="m488 8h-64a8 8 0 0 0 -8 8v8h-167.018a43.35 43.35 0 0 0 -20.7 5.278l-78.323 42.722h-93.959c-13.458 0-24 14.056-24 32 0 16.748 9.185 30.1 21.351 31.811l-36.068 122.1c-.032.109-.062.219-.09.328a40.073 40.073 0 0 0 -1.193 9.7v228.061a8 8 0 0 0 8 8h360a8 8 0 0 0 8-8v-227.392a39.933 39.933 0 0 0 -1.626-11.287l-33.332-113.328a43.281 43.281 0 0 0 42.839-39.993h16.119v16a8 8 0 0 0 8 8h64a8 8 0 0 0 8-8v-104a8 8 0 0 0 -8-8zm-440 96c0-9.767 4.738-16 8-16h228.687l-32 32h-196.687c-3.262 0-8-6.233-8-16zm249.193 154.24a40.073 40.073 0 0 0 -1.193 9.7v220.06h-264v-220.061a24.077 24.077 0 0 1 .679-5.668l37.299-126.271h168.235a35.245 35.245 0 0 0 51.9 45.826l38.487-29.937-31.317 106.023c-.032.109-.062.219-.09.328zm46.807 209.074 20.686 20.686h-41.372zm31.025-205.475a23.947 23.947 0 0 1 .975 6.769v208.078l-24-24v-172.686a8 8 0 0 0 -16 0v172.687l-24 24v-208.748a24.077 24.077 0 0 1 .679-5.668l31.3-105.976zm40.975-173.839h-19.227a12.788 12.788 0 0 0 -12.773 12.773 27.258 27.258 0 0 1 -27.227 27.227h-19.666a11.282 11.282 0 0 0 -6.892 2.365l-49.927 38.835a19.226 19.226 0 0 1 -25.4-28.771l54.768-54.769a8 8 0 0 0 -5.656-13.66h-120.626l52.571-28.676a27.3 27.3 0 0 1 13.037-3.324h167.018zm64 24h-48v-88h48z"></path><path d="m160 264a8 8 0 0 0 -16 0v24h-16v-24a8 8 0 0 0 -16 0v24h-16v-24a8 8 0 0 0 -16 0v32h.015a7.974 7.974 0 0 0 .83 3.578l15.019 30.039-6.619 92.673a24 24 0 0 0 23.939 25.71h13.632a24 24 0 0 0 23.939-25.71l-6.619-92.673 15.019-30.039a7.974 7.974 0 0 0 .83-3.578h.015zm-20.944 40-8 16h-22.112l-8-16zm-6.384 125.451a7.919 7.919 0 0 1 -5.856 2.549h-13.632a8 8 0 0 1 -7.98-8.569l6.245-87.431h17.1l6.245 87.431a7.919 7.919 0 0 1 -2.122 6.02z"></path></svg></span>
            <h1 class="u-text u-title u-text-1">Fastest <span class="u-text-custom-color-2">Order </span>Delivery
            </h1>
          </div>
        </div>
        <div class="skrollable u-align-center u-carousel-item u-clearfix u-image u-parallax u-shading u-section-2-2" src="" data-image-width="1600" data-image-height="1067">
          <div class="u-align-left u-clearfix u-sheet u-sheet-1">
            <h1 class="u-text u-text-default u-title u-text-1">
              <span class="u-text-custom-color-2">Best </span>Qyality&nbsp;<span class="u-text-custom-color-2">Ingredients</span>
            </h1><span class="u-icon u-icon-circle u-text-body-color u-icon-1" data-animation-name="jackInTheBox" data-animation-duration="1000" data-animation-delay="0" data-animation-direction=""><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 512 512" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-bc5f"></use></svg><svg class="u-svg-content" viewBox="0 0 512 512" id="svg-bc5f"><path d="m352 419.441v-244.456h144v245.027z" fill="#ffb656"></path><path d="m352 168v47.985c12 0 12 14 24 14s12-14 24-14 12 14 24 14 12-14 24-14 12 14 24 14 12-14 24-14v-17l10-30.985z" fill="#f4dfcb"></path><path d="m352 384h40v-216h-76a28.031 28.031 0 0 0 -28 28v68h16v-68a12.013 12.013 0 0 1 12-12h36z" fill="#fff" opacity=".2"></path><path d="m64 472v-376s-21.06-29.881-16-40c8-16 56 8 72 0s96-14.985 152 0c0 0 24 8 40 0s32-8 32 8-24 32-24 32v376z" fill="#a5834e"></path><path d="m213.318 47.658c-42.239-2.033-82.475 2.921-93.318 8.342-16 8-64-16-72 0-5.06 10.119 16 40 16 40v376h40v-352c5.13-41.037 66.173-62.338 109.318-72.342z" fill="#fff" opacity=".2"></path><g fill="#f4dfcb"><path d="m176 150.985-32-24v26a22 22 0 0 0 22 22h10z"></path><path d="m176 214.985-32-24v26a22 22 0 0 0 22 22h10z"></path><path d="m176 278.985-32-24v26a22 22 0 0 0 22 22h10z"></path><path d="m224 150.985 32-24v26a22 22 0 0 1 -22 22h-10z"></path><path d="m224 214.985 32-24v26a22 22 0 0 1 -22 22h-10z"></path><path d="m224 278.985 32-24v26a22 22 0 0 1 -22 22h-10z"></path><path d="m216 110.985a16 16 0 1 1 -32 0c0-8.837 16-24 16-24s16 15.164 16 24z"></path>
</g><path d="m504 414.985c0 70.693-70.8 57.015-168 57.015s-184 13.678-184-57.015 78.8-128 176-128 176 57.308 176 128z" fill="#a0470a"></path><path d="m250.57 399.558 3.441-1.376a20 20 0 0 0 11.368-25.4l-24.912-68.862a179.887 179.887 0 0 0 -40.455 23.217l24.561 61.284a20 20 0 0 0 25.997 11.137z" fill="#fc9149"></path><path d="m330.264 374.985h3.471a20 20 0 0 0 19.919-18.185l6.739-67.639a241.609 241.609 0 0 0 -32.393-2.176q-11.666 0-22.945 1.083l5.292 68.728a20 20 0 0 0 19.917 18.189z" fill="#fc9149"></path><path d="m402.084 390.548 3.57 2.678a20 20 0 0 0 29.483-6.288l29.163-52.932c-15.3-13.608-34.379-24.885-56.073-32.979l-13.753 69.6a20 20 0 0 0 7.61 19.921z" fill="#fc9149"></path><path d="m0 472h512v40h-512z" fill="#e8c28b"></path><path d="m8 440h120l-27.692 32h-64.616z" fill="#af4732"></path><path d="m24 440 21.509-30.112a24.918 24.918 0 0 1 39.2-1.733l27.291 31.845z" fill="#ffb656"></path><path d="m68.211 399.578a24.835 24.835 0 0 0 -22.7 10.31l-21.511 30.112h-16l27.692 32h12.308v-32z" fill="#fff" opacity=".2"></path><path d="m152 414.985c0 43.235 32.47 54.53 79.926 56.783-47.681-143.8 176.3-170.741 176.3-170.741a230.125 230.125 0 0 0 -80.226-14.042c-97.2 0-176 57.308-176 128z" fill="#fff" opacity=".2"></path><path d="m166 182.985h10a8 8 0 0 0 8-8v-24a8 8 0 0 0 -3.2-6.4l-32-24a8 8 0 0 0 -12.8 6.4v26a30.034 30.034 0 0 0 30 30zm-14-40 16 12v12h-2a14.016 14.016 0 0 1 -14-14z"></path><path d="m166 246.985h10a8 8 0 0 0 8-8v-24a8 8 0 0 0 -3.2-6.4l-32-24a8 8 0 0 0 -12.8 6.4v26a30.034 30.034 0 0 0 30 30zm-14-40 16 12v12h-2a14.016 14.016 0 0 1 -14-14z"></path><path d="m166 310.985h10a8 8 0 0 0 8-8v-24a8 8 0 0 0 -3.2-6.4l-32-24a8 8 0 0 0 -12.8 6.4v26a30.034 30.034 0 0 0 30 30zm-14-40 16 12v12h-2a14.016 14.016 0 0 1 -14-14z"></path><path d="m216 150.985v24a8 8 0 0 0 8 8h10a30.034 30.034 0 0 0 30-30v-26a8 8 0 0 0 -12.8-6.4l-32 24a8 8 0 0 0 -3.2 6.4zm16 4 16-12v10a14.016 14.016 0 0 1 -14 14h-2z"></path><path d="m259.578 183.83a8 8 0 0 0 -8.377.755l-32 24a8 8 0 0 0 -3.2 6.4v24a8 8 0 0 0 8 8h10a30.034 30.034 0 0 0 30-30v-26a8 8 0 0 0 -4.423-7.155zm-11.578 33.155a14.016 14.016 0 0 1 -14 14h-2v-12l16-12z"></path><path d="m200 134.985a24.027 24.027 0 0 0 24-24c0-5.714-3.116-12.188-9.805-20.376a112.161 112.161 0 0 0 -8.692-9.431 8 8 0 0 0 -11.006 0 112.161 112.161 0 0 0 -8.692 9.431c-6.689 8.191-9.805 14.662-9.805 20.376a24.027 24.027 0 0 0 24 24zm0-36.407c4.456 5.147 7.893 10.325 8 12.419a8 8 0 0 1 -16 0c.1-2.084 3.541-7.268 8-12.419z"></path><path d="m504 200.338 7.556-21.708a8 8 0 0 0 -7.556-10.63h-176v-67.9c7.625-5.781 24-20.064 24-36.1 0-10.888-5.662-16.013-9.037-18.1-8.145-5.035-20.734-3.96-34.541 2.943-10.616 5.307-28.074 1.483-33.893-.435q-.229-.076-.462-.139c-55.789-14.928-138.823-8.838-157.646.573-4.633 2.319-18.592-.558-28.785-2.655-19.468-4.009-39.6-8.152-46.793 6.232-3.415 6.83-1.448 16.719 6.19 31.121 3.359 6.334 7 11.981 8.965 14.925v294.474a32.7 32.7 0 0 0 -17 12.3l-19.115 26.761h-11.883a8 8 0 0 0 -6.049 13.235l27.692 32a8 8 0 0 0 6.049 2.765s366.872.247 377.721.247c36.613 0 65.441-3.212 82.571-19.928 10.777-10.519 16.016-25.345 16.016-45.334a104.485 104.485 0 0 0 -8-40.012zm-46.844 117.668c-26.9-19.562-60.607-32.287-97.156-36.984v-49.647c3.159 3.32 7.641 6.611 14.665 6.611 9.483 0 14.338-6 17.551-9.967 2.807-3.468 3.524-4.033 5.115-4.033s2.307.565 5.114 4.033c3.213 3.969 8.067 9.967 17.55 9.967s14.339-6 17.551-9.967c2.808-3.468 3.525-4.033 5.115-4.033s2.309.565 5.117 4.034c3.213 3.969 8.069 9.966 17.552 9.966s14.339-6 17.553-9.966c2.808-3.469 3.525-4.034 5.117-4.034v123.577a150.849 150.849 0 0 0 -30.844-29.557zm-54.843 54.206 12.148-60.077a168.719 168.719 0 0 1 39.785 23.77l-26.1 47.148a12 12 0 0 1 -17.69 3.772l-3.57-2.678a12.05 12.05 0 0 1 -4.573-11.935zm-74.313-77.227c7.87 0 15.612.4 23.2 1.149l-5.51 59.937a11.941 11.941 0 0 1 -11.951 10.914h-3.472a11.941 11.941 0 0 1 -11.951-10.911l-5.489-60.594c4.998-.321 10.057-.495 15.173-.495zm164.745-110.985-4.3 12.355a8.009 8.009 0 0 0 -.444 2.63v9c-9.483 0-14.339 6-17.552 9.966-2.808 3.469-3.525 4.034-5.117 4.034s-2.309-.565-5.117-4.034c-3.213-3.969-8.069-9.966-17.552-9.966s-14.338 6-17.551 9.967c-2.808 3.468-3.525 4.033-5.116 4.033s-2.307-.565-5.114-4.033c-3.213-3.969-8.068-9.967-17.551-9.967s-14.338 6-17.551 9.967c-2.807 3.468-3.524 4.033-5.114 4.033s-2.307-.565-5.114-4.033c-2.149-2.654-5.04-6.208-9.551-8.276v-25.676zm-148.745 0v95.5q-7.939-.5-16-.513v-94.987zm-291.982 230.538a16.918 16.918 0 0 1 26.612-1.177l15.976 18.639h-55.061zm-4.018 49.462h-8.651l-13.849-16h85l-13.849 16zm69.811 0 16.239-18.765a8 8 0 0 0 -6.05-13.235h-12.321l-24.9-29.051a32.7 32.7 0 0 0 -18.779-10.91v-296.039a8.007 8.007 0 0 0 -1.459-4.606c-8.862-12.594-16.078-27.653-15.319-31.907.383-.406 2.175-1.23 6.944-1.107 6.146.166 14.33 1.851 22.245 3.48 15.21 3.131 29.577 6.09 39.166 1.295 14.154-7.077 92.683-13.718 146.152.519 2.983.956 27.866 8.471 45.848-.519 10.086-5.043 16.872-4.941 18.973-3.644.962.594 1.449 2.1 1.449 4.488 0 8.8-13.775 20.877-20.438 25.344a8 8 0 0 0 -3.561 6.657v72.29a28.039 28.039 0 0 0 -24 27.71v68h16v-68a12.01 12.01 0 0 1 8-11.3v94.8a239.869 239.869 0 0 0 -48.741 8.088 29.963 29.963 0 0 0 .741-6.6v-26a8 8 0 0 0 -12.8-6.4l-32 24a8 8 0 0 0 -3.2 6.4v24a7.954 7.954 0 0 0 .826 3.524q-4.508 2.529-8.826 5.276v-168.8h-16v180.27c-31.024 25.066-48 57.36-48 91.728 0 18.1 5.366 32.522 15.95 42.862a53.777 53.777 0 0 0 7.6 6.152zm114.189-169.015v-12l16-12v10a14.016 14.016 0 0 1 -14 14zm3.8 19.738 22.06 60.787a11.948 11.948 0 0 1 -6.82 15.243l-3.44 1.377a12 12 0 0 1 -15.6-6.685l-22.246-55.616a171.152 171.152 0 0 1 26.046-15.106zm249.009 134.145c-17.38 16.96-56.268 16.006-105.5 14.806-13.84-.339-28.152-.688-43.311-.688-14.863 0-29.424.34-43.506.669-54.348 1.27-101.284 2.364-121.362-17.252-7.489-7.317-11.13-17.594-11.13-31.418 0-28.243 13.739-54.233 36.682-74.754l20.462 51.156a27.948 27.948 0 0 0 36.4 15.6l3.442-1.377a27.879 27.879 0 0 0 15.914-35.563l-22.33-61.531a214.711 214.711 0 0 1 46.33-11.461l5.478 60.466a27.865 27.865 0 0 0 27.885 25.465h3.472a27.862 27.862 0 0 0 27.884-25.457l5.448-59.26a214.472 214.472 0 0 1 32.239 8.08l-12.68 62.708a28.139 28.139 0 0 0 10.656 27.892l3.57 2.678a28 28 0 0 0 41.282-8.812l24.243-43.791c18.672 19.333 29.623 42.749 29.623 67.961 0 15.452-3.661 26.535-11.191 33.883z"></path><path d="m432 246.985h32v16h-32z"></path><path d="m432 270.985h32v16h-32z"></path></svg></span>
          </div>
        </div>
      </div>
      <a class="u-absolute-vcenter u-carousel-control u-carousel-control-prev u-icon-rectangle u-text-body-color u-text-hover-custom-color-2 u-block-084a-5" href="#carousel_f6e5" role="button" data-u-slide="prev">
        <span aria-hidden="true">
          <svg viewBox="0 0 477.175 477.175"><path d="M145.188,238.575l215.5-215.5c5.3-5.3,5.3-13.8,0-19.1s-13.8-5.3-19.1,0l-225.1,225.1c-5.3,5.3-5.3,13.8,0,19.1l225.1,225
                    c2.6,2.6,6.1,4,9.5,4s6.9-1.3,9.5-4c5.3-5.3,5.3-13.8,0-19.1L145.188,238.575z"></path></svg>
        </span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="u-carousel-control u-carousel-control-next u-icon-rectangle u-text-body-color u-text-hover-custom-color-2 u-block-084a-6" href="#carousel_f6e5" role="button" data-u-slide="next">
        <span aria-hidden="true">
          <svg viewBox="0 0 477.175 477.175"><path d="M360.731,229.075l-225.1-225.1c-5.3-5.3-13.8-5.3-19.1,0s-5.3,13.8,0,19.1l215.5,215.5l-215.5,215.5
                    c-5.3,5.3-5.3,13.8,0,19.1c2.6,2.6,6.1,4,9.5,4c3.4,0,6.9-1.3,9.5-4l225.1-225.1C365.931,242.875,365.931,234.275,360.731,229.075z"></path></svg>
        </span>
        <span class="sr-only">Next</span>
      </a>
    </section>
    <section class="u-black u-clearfix u-section-3" id="sec-43a0">
      <div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
        <div class="u-clearfix u-expanded-width u-gutter-0 u-layout-spacing-vertical u-layout-wrap u-layout-wrap-1">
          <div class="u-layout">
            <div class="u-layout-row">
              <div class="u-align-left u-container-style u-custom-color-1 u-layout-cell u-left-cell u-size-33 u-layout-cell-1">
                <div class="u-container-layout u-container-layout-1">
                  <h2 class="u-text u-text-black u-text-1">About Us</h2>
                  <p class="u-text u-text-2"> Cooking Since <span class="u-text-custom-color-2">2009</span>
                  </p>
                  <p class="u-text u-text-3"> Henry Bakers is  a cafe and a retail bakery located in Meerigama Sri Lanka.</p>
                  <a href="./About" data-page-id="1736228671" class="u-btn u-button-style u-none u-text-hover-palette-1-base u-text-palette-2-base u-btn-1"><span class="u-icon u-text-palette-2-base u-icon-1"><svg class="u-svg-content" viewBox="0 0 412.72 412.72" x="0px" y="0px" style="width: 1em; height: 1em;"><path d="M404.72,82.944c-0.027,0-0.054,0-0.08,0h0h-27.12v-9.28c0.146-3.673-2.23-6.974-5.76-8    c-18.828-4.934-38.216-7.408-57.68-7.36c-32,0-75.6,7.2-107.84,40c-32-33.12-75.92-40-107.84-40    c-19.464-0.048-38.852,2.426-57.68,7.36c-3.53,1.026-5.906,4.327-5.76,8v9.2H8c-4.418,0-8,3.582-8,8v255.52c0,4.418,3.582,8,8,8    c1.374-0.004,2.724-0.362,3.92-1.04c0.8-0.4,80.8-44.16,192.48-16h1.2h0.72c0.638,0.077,1.282,0.077,1.92,0    c112-28.4,192,15.28,192.48,16c2.475,1.429,5.525,1.429,8,0c2.46-1.42,3.983-4.039,4-6.88V90.944    C412.72,86.526,409.139,82.944,404.72,82.944z M16,333.664V98.944h19.12v200.64c-0.05,4.418,3.491,8.04,7.909,8.09    c0.432,0.005,0.864-0.025,1.291-0.09c16.55-2.527,33.259-3.864,50-4c23.19-0.402,46.283,3.086,68.32,10.32    C112.875,307.886,62.397,314.688,16,333.664z M94.32,287.664c-14.551,0.033-29.085,0.968-43.52,2.8V79.984    c15.576-3.47,31.482-5.241,47.44-5.28c29.92,0,71.2,6.88,99.84,39.2l0.24,199.28C181.68,302.304,149.2,287.664,94.32,287.664z     M214.32,113.904c28.64-32,69.92-39.2,99.84-39.2c15.957,0.047,31.863,1.817,47.44,5.28v210.48    c-14.354-1.849-28.808-2.811-43.28-2.88c-54.56,0-87.12,14.64-104,25.52V113.904z M396.64,333.664    c-46.496-19.028-97.09-25.831-146.96-19.76c22.141-7.26,45.344-10.749,68.64-10.32c16.846,0.094,33.663,1.404,50.32,3.92    c4.368,0.663,8.447-2.341,9.11-6.709c0.065-0.427,0.095-0.859,0.09-1.291V98.944h19.12L396.64,333.664z"></path></svg><img></span>Read More
                  </a>
                </div>
              </div>
              <div class="u-container-style u-effect-hover-liftUp u-image u-layout-cell u-right-cell u-size-27 u-image-1" src="" data-image-width="1080" data-image-height="1080" data-animation-name="zoomIn" data-animation-duration="1000" data-animation-delay="0" data-animation-direction="">
                <div class="u-background-effect u-expanded">
                  <div class="u-background-effect-image u-expanded u-image u-image-2" data-image-width="1080" data-image-height="1080"></div>
                </div>
                <div class="u-container-layout u-container-layout-2"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="u-clearfix u-section-4" id="carousel_ac81">
      <div class="u-clearfix u-sheet u-sheet-1">
        <h2 class="u-text u-text-default u-text-grey-40 u-text-1"> Why Choose Us</h2>
        <h1 class="u-text u-text-default u-text-2">Our <span class="u-text-custom-color-2">Key </span>Features
        </h1>
        <div class="u-clearfix u-expanded-width u-gutter-0 u-layout-wrap u-layout-wrap-1">
          <div class="u-layout">
            <div class="u-layout-row">
              <div class="u-container-style u-layout-cell u-size-15 u-layout-cell-1">
                <div class="u-container-layout u-container-layout-1"><span class="u-icon u-icon-circle u-text-palette-1-base u-icon-1" data-animation-name="slideIn" data-animation-duration="1000" data-animation-delay="0" data-animation-direction="Down"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 256 256" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-8570"></use></svg><svg class="u-svg-content" viewBox="0 0 256 256" id="svg-8570"><g><path d="m146.582 19.667c-1.684-8.64-9.361-15.167-18.582-15.167s-16.898 6.528-18.582 15.169c-10.724-9.463-27.974-2.014-27.974 12.41 0 7.607 5.149 14.022 12.19 16.001v21.44h68.734v-21.448c7.041-1.979 12.19-8.394 12.19-15.993 0-14.389-17.229-21.898-27.976-12.412z" fill="#f2e1d6"></path><path d="m144.93 127.49v10.85l-3.87 1.24c-3.03.98-4.98 3.91-4.71 7.08l.6 12.34h-18.07l.59-12.34c.28-3.17-1.67-6.1-4.7-7.08l-3.7-1.19v-10.88c10.383 5.83 23.268 5.961 33.86-.02z" fill="#ffb69f"></path><path d="m93.632 69.518v19.258l13.803-19.258z" fill="#afafaf"></path><path d="m148.565 69.518 13.803 19.258v-19.258z" fill="#afafaf"></path><path d="m165.84 84.256h-3.47v-14.736h-68.74v14.736h-3.47c-5.482 0-9.89 4.394-9.89 9.789 0 5.405 4.422 9.789 9.89 9.789h4.001c1.851 10.358 8.27 18.836 16.909 23.675 10.383 5.83 23.268 5.961 33.86-.02 8.689-4.859 15.088-13.388 16.909-23.655h4.001c5.482 0 9.89-4.393 9.89-9.789 0-5.404-4.422-9.789-9.89-9.789z" fill="#ffb69f"></path><path d="m200.77 180.52c-1.17-11.6-8.96-21.48-19.97-25.32l-29.19-10.18.034-6.087c.008-1.362-1.318-2.333-2.614-1.915l-4.101 1.322-3.87 1.24c-3.03.98-4.98 3.91-4.71 7.08l.6 12.34h-18.07l.59-12.34c.28-3.17-1.67-6.1-4.7-7.08l-3.7-1.19-4.272-1.374c-1.296-.417-2.62.554-2.613 1.915l.035 6.149-29.019 10.12c-11.01 3.84-18.8 13.72-19.97 25.32l-7 69.48h159.54z" fill="#f2e1d6"></path><g fill="#f0c020"><path d="m71.58 127.487c-3.961-1.309-8.051-2.453-10.348-12.345-2.115 9.112-5.504 10.745-10.348 12.345 7.9 2.61 9.092 6.933 10.348 12.345 2.165-9.33 5.745-10.825 10.348-12.345z"></path><path d="m204.31 60.214c-3.961-1.309-8.051-2.453-10.348-12.345-2.115 9.112-5.504 10.745-10.348 12.345 7.9 2.61 9.092 6.933 10.348 12.345 2.165-9.33 5.746-10.825 10.348-12.345z"></path><path d="m224.979 98.055c-3.961-1.309-8.051-2.453-10.348-12.345-2.115 9.112-5.504 10.745-10.348 12.345 7.9 2.61 9.092 6.933 10.348 12.345 2.165-9.329 5.746-10.824 10.348-12.345z"></path>
</g><path d="m120.33 107.95c-.46-1.25-1.95-1.93-3.21-1.46-1.288.491-1.953 1.918-1.47 3.22l.01.01c1.838 4.936 6.659 8.47 12.34 8.47 5.67 0 10.477-3.517 12.35-8.47.49-1.29-.16-2.74-1.45-3.23-1.26-.47-2.75.21-3.22 1.46-1.189 3.13-4.27 5.24-7.68 5.24s-6.49-2.1-7.67-5.24z"></path><path d="m109.507 89.023v2.003c0 1.381 1.119 2.5 2.5 2.5s2.5-1.119 2.5-2.5v-2.003c0-1.381-1.119-2.5-2.5-2.5s-2.5 1.12-2.5 2.5z"></path><path d="m141.493 89.023v2.003c0 1.381 1.119 2.5 2.5 2.5s2.5-1.119 2.5-2.5v-2.003c0-1.381-1.119-2.5-2.5-2.5s-2.5 1.12-2.5 2.5z"></path><path d="m130.5 98.059v-10.285c0-1.381-1.119-2.5-2.5-2.5s-2.5 1.119-2.5 2.5v10.284c0 1.381 1.119 2.5 2.5 2.5s2.5-1.119 2.5-2.499z"></path><path d="m119.75 174.75c1.381 0 2.5-1.119 2.5-2.5v-1.25c0-1.381-1.119-2.5-2.5-2.5s-2.5 1.119-2.5 2.5v1.25c0 1.381 1.119 2.5 2.5 2.5z"></path><path d="m137.125 174.75c1.381 0 2.5-1.119 2.5-2.5v-1.25c0-1.381-1.119-2.5-2.5-2.5s-2.5 1.119-2.5 2.5v1.25c0 1.381 1.119 2.5 2.5 2.5z"></path><path d="m117.25 191.25c0 1.381 1.119 2.5 2.5 2.5s2.5-1.119 2.5-2.5v-1.25c0-1.381-1.119-2.5-2.5-2.5s-2.5 1.119-2.5 2.5z"></path><path d="m134.625 191.25c0 1.381 1.119 2.5 2.5 2.5s2.5-1.119 2.5-2.5v-1.25c0-1.381-1.119-2.5-2.5-2.5s-2.5 1.119-2.5 2.5z"></path><path d="m117.25 210.25c0 1.381 1.119 2.5 2.5 2.5s2.5-1.119 2.5-2.5v-1.25c0-1.381-1.119-2.5-2.5-2.5s-2.5 1.119-2.5 2.5z"></path><path d="m134.625 210.25c0 1.381 1.119 2.5 2.5 2.5s2.5-1.119 2.5-2.5v-1.25c0-1.381-1.119-2.5-2.5-2.5s-2.5 1.119-2.5 2.5z"></path><path d="m117.25 229.25c0 1.381 1.119 2.5 2.5 2.5s2.5-1.119 2.5-2.5v-1.25c0-1.381-1.119-2.5-2.5-2.5s-2.5 1.119-2.5 2.5z"></path><path d="m134.625 229.25c0 1.381 1.119 2.5 2.5 2.5s2.5-1.119 2.5-2.5v-1.25c0-1.381-1.119-2.5-2.5-2.5s-2.5 1.119-2.5 2.5z"></path><path d="m52.2 210.61c-1.37-.14-2.6.87-2.74 2.24-.149 1.453.998 2.75 2.49 2.75 1.29 0 2.36-.97 2.48-2.25.14-1.37-.86-2.6-2.23-2.74z"></path><path d="m52.74 180.27-2.28 22.63c-.14 1.37.87 2.6 2.24 2.74 1.37.13 2.6-.87 2.74-2.24l2.28-22.63c1.07-10.59 8.25-19.7 18.3-23.21l29.02-10.12c1.01-.35 1.69-1.31 1.68-2.37l-.03-5.46c3.072.986 4.108 1.32 7.31 2.35 1.782.577 3.135 2.256 2.98 4.48l-.485 10.06h-11.245c-1.555 0-2.736 1.408-2.46 2.942 7.077 39.423 2.025 89.798 1.974 90.302-.141 1.374.857 2.602 2.231 2.743 1.39.141 2.603-.871 2.743-2.231.051-.499 4.931-49.121-1.523-88.756h39.036c1.381 0 2.5-1.119 2.5-2.5s-1.119-2.5-2.5-2.5h-7.916c-.01-.203-.479-9.888-.495-10.09-.195-1.797.939-3.789 2.99-4.45 8.802-2.829-1.493.48 7.31-2.35l-.03 5.4c-.01 1.06.671 2.02 1.681 2.37l29.189 10.18c10.051 3.5 17.23 12.61 18.301 23.21l7 69.48c.148 1.459 1.489 2.4 2.739 2.24 1.37-.14 2.38-1.37 2.24-2.74v-.01l-7-69.47c-1.244-12.377-9.533-23.215-21.64-27.43l-27.5-9.59.02-4.3c0-3.068-2.985-5.26-5.899-4.31l-.811.261v-5.995c.246-.15.501-.291.74-.446 1.16-.75 1.49-2.3.74-3.46-.721-1.12-2.33-1.47-3.46-.74-20.828 13.627-49.318-1.063-49.318-26.352v-8.329l12.586-17.559h38.563l12.586 17.558v8.329c0 4.208-.878 8.502-2.577 12.432-.563 1.291.039 2.762 1.3 3.29 1.229.54 2.75-.07 3.29-1.3 0 0 0 0 0-.01.833-1.928 1.502-3.934 1.991-5.985h1.969c6.832 0 12.391-5.513 12.391-12.29s-5.559-12.289-12.391-12.289h-.97c0-11.415 0-20.587 0-31.886 7.074-2.77 12.169-9.625 12.189-17.79 0-1.35-.149-2.7-.43-4-.28-1.32-1.64-2.21-2.97-1.92-1.409.304-2.204 1.682-1.91 2.97.2.96.31 1.95.31 2.95 0 7.848-6.533 14.216-14.45 14.132-1.388-.098-2.571.945-2.666 2.323s.945 2.571 2.322 2.666c.731.049 1.873-.034 2.604-.114v15.932c-11.537 0-12.049.001-12.186.001v-9.455c0-1.381-1.119-2.5-2.5-2.5s-2.5 1.119-2.5 2.5v9.455h-12.184v-9.455c0-1.381-1.119-2.5-2.5-2.5s-2.5 1.119-2.5 2.5v9.455h-12.184v-9.455c0-1.381-1.119-2.5-2.5-2.5s-2.5 1.119-2.5 2.5v9.455c-.092 0 .644-.001-12.188-.001v-15.928c1.221.132 2.174.141 2.604.111 1.373-.095 2.398-1.28 2.311-2.653-.088-1.374-1.292-2.421-2.654-2.335-7.95.079-14.451-6.284-14.451-14.132.031-12.208 14.666-18.611 23.82-10.54 1.414 1.263 3.738.534 4.11-1.39 1.469-7.553 8.185-13.151 16.143-13.151 7.86 0 14.64 5.53 16.12 13.15.373 1.91 2.681 2.646 4.11 1.39 3.323-2.931 7.751-4.094 11.859-3.4 1.36.22 2.65-.72 2.87-2.07.22-1.36-.7-2.64-2.06-2.87-4.376-.715-8.978.081-12.92 2.38-3.09-7.928-10.843-13.58-19.989-13.58-9.131 0-16.893 5.635-19.99 13.58-12.663-7.385-29.041 1.549-29.07 16.5.02 8.08 4.997 14.959 12.2 17.8 0 5.677-.01 26.199-.01 31.876h-.97c-6.832 0-12.39 5.513-12.39 12.289s5.558 12.29 12.39 12.29h1.969c2.241 9.409 8.128 17.493 16.441 22.592v6.037l-1.01-.324c-2.809-.956-5.87 1.2-5.87 4.29l.02 4.38-27.33 9.53c-11.804 4.109-20.364 14.733-21.64 27.43zm43.392-99.273v-8.977h6.435zm63.736-8.977v8.977l-6.435-8.977zm5.972 14.736c4.075 0 7.391 3.27 7.391 7.289 0 4.02-3.315 7.29-7.391 7.29h-1.135c.001-.008.001-.016.002-.023.106-1.123.163-2.259.163-3.401v-11.155zm-75.68 14.578c-4.075 0-7.39-3.27-7.39-7.29 0-4.019 3.315-7.289 7.39-7.289h.97v11.155c0 1.132.055 2.26.16 3.375.002.016.002.033.004.05h-1.134zm23.41 30.176c9.23 3.898 19.666 3.886 28.86-.01v5.013l-2.13.687c-4.205 1.355-6.808 5.398-6.45 9.61l.47 9.69h-12.82l.47-9.72c.353-4.23-2.269-8.232-6.43-9.58l-1.97-.632z"></path><path d="m47.98 252.49c1.262.162 2.593-.79 2.74-2.24l2.71-26.95c.14-1.37-.86-2.6-2.23-2.74s-2.6.87-2.74 2.24l-2.72 26.95c-.14 1.37.87 2.6 2.24 2.74z"></path><path d="m76.825 252.499c1.38-.043 2.464-1.197 2.42-2.577l-1.842-58.75c-.043-1.38-1.21-2.455-2.577-2.42-1.38.043-2.464 1.197-2.42 2.577l1.842 58.75c.044 1.407 1.233 2.469 2.577 2.42z"></path><path d="m176.75 249.92c-.04 1.373 1.05 2.58 2.51 2.58 1.35 0 2.45-1.06 2.49-2.42l.78-24.99c.05-1.38-1.04-2.53-2.421-2.58-1.39-.06-2.529 1.04-2.569 2.42z"></path><path d="m180.66 207.52c1.359 0 2.46-1.06 2.5-2.42l.43-13.77c.05-1.38-1.04-2.54-2.42-2.58-1.38-.05-2.53 1.04-2.57 2.42l-.439 13.77c-.041 1.385 1.064 2.58 2.499 2.58z"></path><path d="m180.35 217.52c1.36 0 2.46-1.07 2.5-2.43.043-1.391-1.057-2.529-2.42-2.57-1.41-.07-2.54 1.03-2.58 2.42-.041 1.401 1.077 2.58 2.5 2.58z"></path><path d="m152.399 118.17c-.924 1.096-.719 2.668.29 3.52 1.017.882 2.598.795 3.521-.28.9-1.067.761-2.641-.28-3.52-1.02-.86-2.67-.73-3.531.28z"></path><path d="m171.16 21.75c.939-1.01.89-2.59-.11-3.54-.96-.91-2.62-.86-3.53.11-.905.944-.947 2.527.101 3.53.99.928 2.562.917 3.539-.1z"></path><path d="m50.05 130.012c6.686 2.209 7.444 5.476 8.591 10.421.637 2.743 4.545 2.742 5.182 0 1.905-8.212 4.709-9.139 8.591-10.421 2.424-.801 2.43-4.249 0-5.051-3.729-1.228-6.641-2.022-8.591-10.421-.635-2.737-4.548-2.73-5.181 0-1.907 8.213-4.566 9.091-8.591 10.422-2.425.8-2.43 4.248-.001 5.05zm11.192-7.102c1.2 2.161 2.566 3.591 3.977 4.601-1.472 1.035-2.794 2.423-3.934 4.439-.942-1.587-2.25-3.089-4.164-4.403 1.548-1.062 2.934-2.503 4.121-4.637z"></path><path d="m182.781 62.739c6.686 2.209 7.444 5.476 8.591 10.421.637 2.743 4.545 2.742 5.182 0 1.905-8.212 4.709-9.139 8.591-10.421 2.424-.801 2.43-4.249 0-5.051-3.729-1.228-6.641-2.022-8.591-10.421-.635-2.737-4.548-2.73-5.181 0-1.907 8.213-4.566 9.092-8.591 10.422-2.425.8-2.431 4.248-.001 5.05zm11.192-7.102c1.2 2.161 2.566 3.592 3.977 4.601-1.472 1.035-2.794 2.423-3.934 4.439-.942-1.587-2.25-3.089-4.164-4.403 1.548-1.062 2.934-2.503 4.121-4.637z"></path><path d="m203.45 100.581c6.686 2.209 7.444 5.476 8.591 10.421.637 2.743 4.545 2.742 5.182 0 1.905-8.212 4.709-9.139 8.591-10.421 2.424-.801 2.43-4.249 0-5.051-3.729-1.228-6.641-2.022-8.591-10.421-.635-2.737-4.548-2.73-5.181 0-1.907 8.213-4.566 9.092-8.591 10.422-2.426.8-2.431 4.247-.001 5.05zm11.191-7.103c1.2 2.161 2.566 3.591 3.977 4.601-1.472 1.035-2.794 2.423-3.934 4.439-.942-1.587-2.25-3.089-4.164-4.403 1.549-1.061 2.935-2.503 4.121-4.637z"></path>
</g></svg></span>
                  <h6 class="u-align-center u-text u-text-default u-text-3"> World’s best Chef</h6>
                  <p class="u-align-center u-text u-text-default u-text-4"> We can confidently say that our chefs provide excellent service for you, friends, familers and your lovings !</p>
                </div>
              </div>
              <div class="u-container-style u-layout-cell u-size-15 u-layout-cell-2">
                <div class="u-container-layout u-container-layout-2">
                  <h6 class="u-align-center u-text u-text-default u-text-5"> Natural ingredients</h6>
                  <p class="u-align-center u-text u-text-6"> We always use only fresh natural ingredients, taking into account the comfort of our heartfelt customers !</p><span class="u-icon u-icon-circle u-text-palette-1-base u-icon-2" data-animation-name="slideIn" data-animation-duration="1000" data-animation-delay="0" data-animation-direction="Up"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 512 512" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-f1c6"></use></svg><svg class="u-svg-content" viewBox="0 0 512 512" id="svg-f1c6"><path d="m271.09375 67.125h4.726562c10.949219 0 19.824219-8.875 19.824219-19.820312 0-10.949219-8.875-19.824219-19.824219-19.824219-.046874 0-.09375.003906-.140624.003906-1.15625-9.84375-9.523438-17.484375-19.679688-17.484375s-18.523438 7.640625-19.679688 17.484375c-.046874 0-.09375-.003906-.140624-.003906-10.949219 0-19.824219 8.875-19.824219 19.824219 0 10.945312 8.875 19.820312 19.824219 19.820312zm0 0" fill="#cbe558"></path><path d="m256.019531 67.125c-40.976562 0-71.867187 37.242188-64.289062 77.511719l13.050781 69.363281h102.476562l13.050782-69.363281c7.574218-40.269531-23.316406-77.511719-64.289063-77.511719zm0 0" fill="#ff765b"></path><path d="m113.691406 99.09375c-11.050781-19.144531-35.535156-25.707031-54.679687-14.652344-19.148438 11.054688-25.707031 35.535156-14.652344 54.683594v.003906c8.851563 15.324219 11.636719 33.421875 7.753906 50.6875-4.226562 18.796875-1.699219 39.164063 8.640625 57.179688 21.644532 37.714844 70.121094 51.160156 108.082032 29.941406 38.914062-21.75 52.402343-71.046875 30.183593-109.527344-10.347656-17.925781-26.605469-30.3125-44.890625-36.125-17.007812-5.40625-31.511718-16.734375-40.4375-32.191406zm0 0" fill="#cbe558"></path><path d="m436.488281 95.101562c-14.386719-2.316406-28.9375 4.683594-40.117187 17.546876-11.175782-12.863282-25.726563-19.863282-40.113282-17.546876-25.625 4.128907-41.011718 36.25-34.359374 71.75 6.648437 35.5 32.808593 60.933594 58.4375 56.804688 5.949218-.957031 11.339843-3.441406 16.035156-7.109375 4.699218 3.667969 10.089844 6.152344 16.039062 7.109375 25.628906 4.128906 51.789063-21.304688 58.4375-56.804688 6.648438-35.5-8.734375-67.621093-34.359375-71.75zm0 0" fill="#ff6977"></path><path d="m482 406h-452c-11.046875 0-20 8.953125-20 20v56c0 11.046875 8.953125 20 20 20h452c11.046875 0 20-8.953125 20-20v-56c0-11.046875-8.953125-20-20-20zm0 0" fill="#ffcb7c"></path><path d="m482 310h-452c-11.046875 0-20 8.953125-20 20v56c0 11.046875 8.953125 20 20 20h452c11.046875 0 20-8.953125 20-20v-56c0-11.046875-8.953125-20-20-20zm0 0" fill="#ffd89e"></path><path d="m482 214h-452c-11.046875 0-20 8.953125-20 20v56c0 11.046875 8.953125 20 20 20h452c11.046875 0 20-8.953125 20-20v-56c0-11.046875-8.953125-20-20-20zm0 0" fill="#ffcb7c"></path><path d="m365.792969 121.464844c-8.320313 8.320312-11.269531 19.976562-8.855469 30.667968 10.6875 2.410157 22.34375-.539062 30.664062-8.859374 8.324219-8.324219 11.269532-19.976563 8.859376-30.667969-10.691407-2.410157-22.34375.535156-30.667969 8.859375zm0 0" fill="#d8ec84"></path><path d="m512 234c0-16.542969-13.457031-30-30-30h-15.394531c6.742187-10.21875 11.640625-22.328125 14.074219-35.308594 4.414062-23.582031.328124-46.527344-11.21875-62.941406-8.027344-11.410156-18.878907-18.507812-31.382813-20.519531-9.128906-1.472657-18.414063-.054688-27.195313 3.9375 2.933594-5.3125 7.640626-9.515625 13.46875-11.816407 5.136719-2.027343 7.65625-7.835937 5.628907-12.972656-2.027344-5.136718-7.835938-7.660156-12.976563-5.628906-14.699218 5.804688-25.351562 18.511719-28.507812 33.996094-10.652344-6.660156-22.367188-9.359375-33.828125-7.515625-11.441407 1.84375-21.492188 7.953125-29.269531 17.71875-2.828126-6.613281-6.621094-12.871094-11.332032-18.550781-5.109375-6.160157-11.074218-11.378907-17.652344-15.554688 5.679688-5.433594 9.226563-13.078125 9.226563-21.539062 0-13.753907-9.359375-25.363282-22.042969-28.792969-4.480468-10.953125-15.242187-18.511719-27.597656-18.511719s-23.117188 7.558594-27.601562 18.511719c-12.683594 3.429687-22.042969 15.039062-22.042969 28.792969 0 8.46875 3.554687 16.117187 9.242187 21.550781-6.566406 4.175781-12.527344 9.386719-17.625 15.539062-11.492187 13.855469-17.535156 31.097657-17.371094 48.761719-7.136718-4.871094-15-8.71875-23.441406-11.402344-14.875-4.730468-27.234375-14.550781-34.804687-27.660156-6.683594-11.574219-17.472657-19.851562-30.378907-23.3125-10.339843-2.769531-21.042968-2.175781-30.84375 1.601562-5.492187-5.839843-8.511718-13.421874-8.511718-21.476562 0-5.523438-4.476563-10-10-10-5.519532 0-10 4.476562-10 10 0 11.929688 4.042968 23.234375 11.472656 32.363281-6.398438 6.210938-11.023438 14.050781-13.394531 22.886719-3.457031 12.910156-1.683594 26.394531 5 37.96875 7.628906 13.214844 9.992187 28.660156 6.65625 43.492188-1.203125 5.359374-1.90625 10.847656-2.109375 16.378906h-10.246094c-16.542969 0-30 13.457031-30 30v56c0 7.679687 2.902344 14.6875 7.664062 20-4.761718 5.316406-7.664062 12.324218-7.664062 20.003906v56c0 7.679688 2.902344 14.6875 7.664062 20-4.761718 5.3125-7.664062 12.320312-7.664062 20v56c0 16.542969 13.457031 30 30 30h452c16.542969 0 30-13.457031 30-30v-56c0-7.679688-2.902344-14.6875-7.664062-20 4.761718-5.3125 7.664062-12.320312 7.664062-20v-56c0-7.679688-2.902344-14.6875-7.664062-20 4.761718-5.3125 7.664062-12.320312 7.664062-20zm-124.796875-112.136719c-.445313 5.351563-2.753906 10.421875-6.671875 14.335938-3.917969 3.917969-8.988281 6.226562-14.335938 6.671875.445313-5.347656 2.753907-10.421875 6.667969-14.335938 3.917969-3.917968 8.992188-6.226562 14.339844-6.671875zm-29.355469-16.886719c4.078125-.65625 8.296875-.238281 12.476563 1.140626-4.226563 2.066406-8.15625 4.832031-11.601563 8.277343-10.5 10.5-14.8125 25.429688-11.539062 39.9375.847656 3.765625 3.789062 6.703125 7.554687 7.554688 3.191407.71875 6.40625 1.074219 9.589844 1.074219 11.273437 0 22.160156-4.429688 30.347656-12.617188 9.183594-9.183594 13.636719-21.761719 12.417969-34.484375 8.636719-8.421875 18.589844-12.367187 27.804688-10.882813 8.914062 1.433594 14.820312 7.46875 18.203124 12.28125 8.339844 11.855469 11.300782 29.707032 7.917969 47.753907-2.957031 15.808593-10.3125 29.8125-20.367187 38.988281h-88.554688c-10.058594-9.175781-17.410156-23.179688-20.371094-38.988281-3.378906-18.046875-.417968-35.898438 7.921876-47.753907 3.378906-4.8125 9.285156-10.847656 18.199218-12.28125zm-36.867187 90.152344c1.566406 3.089844 3.296875 6.046875 5.160156 8.871094h-6.828125zm-84.800781-138.003906c-5.417969 0-9.824219-4.40625-9.824219-9.820312 0-5.382813 4.355469-9.769532 9.726562-9.824219.101563.003906.167969.003906.242188.003906 5.0625 0 9.335937-3.792969 9.929687-8.832031.578125-4.933594 4.769532-8.652344 9.746094-8.652344s9.167969 3.71875 9.746094 8.652344c.59375 5.042968 4.867187 8.832031 9.933594 8.832031h.101562.117188c5.378906.039063 9.746093 4.429687 9.746093 9.820313 0 5.414062-4.40625 9.820312-9.820312 9.820312zm19.839843 20c16.542969 0 32.089844 7.304688 42.652344 20.039062 7.210937 8.695313 11.5 19.203126 12.523437 30.171876h-17.417968c-5.519532 0-10 4.476562-10 10 0 5.519531 4.480468 10 10 10h15.847656l-10.664062 56.664062h-85.886719l-11.515625-61.214844c-1.226563-6.515625-1.25-13.089844-.183594-19.449218h35.378906c5.519532 0 10-4.480469 10-10 0-5.523438-4.480468-10-10-10h-27.8125c1.328125-2.136719 2.792969-4.207032 4.421875-6.171876 10.5625-12.734374 26.109375-20.039062 42.65625-20.039062zm-203 57c-4.011719-6.945312-5.078125-15.039062-3-22.789062 2.074219-7.746094 7.042969-14.222657 13.992188-18.234376 6.945312-4.007812 15.039062-5.078124 22.789062-3 7.746094 2.078126 14.222657 7.046876 18.230469 13.992188 10.070312 17.4375 26.429688 30.480469 46.070312 36.722656 13.769532 4.378906 25.582032 12.707032 34.273438 24.125l7.347656 39.058594h-132.457031c.191406-4.054688.722656-8.066406 1.605469-11.988281 4.4375-19.75 1.296875-40.308594-8.851563-57.886719zm-33.019531 99.875c0-5.515625 4.484375-10 10-10h452c5.515625 0 10 4.484375 10 10v56c0 5.515625-4.484375 10-10 10h-452c-5.515625 0-10-4.484375-10-10zm472 248c0 5.515625-4.484375 10-10 10h-452c-5.515625 0-10-4.484375-10-10v-56c0-5.515625 4.484375-10 10-10h186.128906c5.519532 0 10-4.476562 10-10s-4.480468-10-10-10h-186.128906c-5.515625 0-10-4.484375-10-10v-56c0-5.515625 4.484375-10 10-10h452c5.515625 0 10 4.484375 10 10v56c0 5.515625-4.484375 10-10 10h-185.871094c-5.523437 0-10 4.476562-10 10s4.476563 10 10 10h185.871094c5.515625 0 10 4.484375 10 10zm0 0"></path><path d="m64 272c2.628906 0 5.210938-1.070312 7.070312-2.929688 1.859376-1.859374 2.929688-4.441406 2.929688-7.070312s-1.070312-5.210938-2.929688-7.070312c-1.859374-1.859376-4.441406-2.929688-7.070312-2.929688s-5.210938 1.070312-7.070312 2.929688c-1.859376 1.859374-2.929688 4.441406-2.929688 7.070312s1.070312 5.210938 2.929688 7.070312c1.859374 1.859376 4.441406 2.929688 7.070312 2.929688zm0 0"></path><path d="m448 272c2.628906 0 5.210938-1.070312 7.070312-2.929688 1.859376-1.859374 2.929688-4.441406 2.929688-7.070312s-1.070312-5.210938-2.929688-7.070312c-1.859374-1.859376-4.441406-2.929688-7.070312-2.929688s-5.210938 1.070312-7.070312 2.929688c-1.859376 1.859374-2.929688 4.441406-2.929688 7.070312s1.070312 5.210938 2.929688 7.070312c1.859374 1.859376 4.441406 2.929688 7.070312 2.929688zm0 0"></path><path d="m64 348c-2.628906 0-5.210938 1.070312-7.070312 2.929688-1.859376 1.859374-2.929688 4.441406-2.929688 7.070312s1.070312 5.210938 2.929688 7.070312c1.859374 1.859376 4.441406 2.929688 7.070312 2.929688s5.210938-1.070312 7.070312-2.929688c1.859376-1.859374 2.929688-4.441406 2.929688-7.070312s-1.070312-5.210938-2.929688-7.070312c-1.859374-1.859376-4.441406-2.929688-7.070312-2.929688zm0 0"></path><path d="m448 368c2.628906 0 5.210938-1.070312 7.070312-2.929688 1.859376-1.859374 2.929688-4.441406 2.929688-7.070312s-1.070312-5.210938-2.929688-7.070312c-1.859374-1.859376-4.441406-2.929688-7.070312-2.929688s-5.210938 1.070312-7.070312 2.929688c-1.859376 1.859374-2.929688 4.441406-2.929688 7.070312s1.070312 5.210938 2.929688 7.070312c1.859374 1.859376 4.441406 2.929688 7.070312 2.929688zm0 0"></path><path d="m64 444c-2.628906 0-5.210938 1.070312-7.070312 2.929688-1.859376 1.859374-2.929688 4.441406-2.929688 7.070312s1.070312 5.210938 2.929688 7.070312c1.859374 1.859376 4.441406 2.929688 7.070312 2.929688s5.210938-1.070312 7.070312-2.929688c1.859376-1.859374 2.929688-4.441406 2.929688-7.070312s-1.070312-5.210938-2.929688-7.070312c-1.859374-1.859376-4.441406-2.929688-7.070312-2.929688zm0 0"></path><path d="m448 444c-2.628906 0-5.210938 1.070312-7.070312 2.929688-1.859376 1.859374-2.929688 4.441406-2.929688 7.070312s1.070312 5.210938 2.929688 7.070312c1.859374 1.859376 4.441406 2.929688 7.070312 2.929688s5.210938-1.070312 7.070312-2.929688c1.859376-1.859374 2.929688-4.441406 2.929688-7.070312s-1.070312-5.210938-2.929688-7.070312c-1.859374-1.859376-4.441406-2.929688-7.070312-2.929688zm0 0"></path><path d="m226.753906 166.136719c0 5.519531 4.476563 10 10 10h19.964844c5.519531 0 10-4.480469 10-10 0-5.523438-4.480469-10-10-10h-19.964844c-5.523437 0-10 4.476562-10 10zm0 0"></path><path d="m256 396c-2.628906 0-5.210938 1.070312-7.070312 2.929688-1.859376 1.859374-2.929688 4.441406-2.929688 7.070312s1.070312 5.210938 2.929688 7.070312c1.859374 1.859376 4.441406 2.929688 7.070312 2.929688s5.210938-1.070312 7.070312-2.929688c1.859376-1.859374 2.929688-4.441406 2.929688-7.070312s-1.070312-5.210938-2.929688-7.070312c-1.859374-1.859376-4.441406-2.929688-7.070312-2.929688zm0 0"></path></svg></span>
                </div>
              </div>
              <div class="u-container-style u-layout-cell u-size-15 u-layout-cell-3">
                <div class="u-container-layout u-container-layout-3"><span class="u-icon u-icon-circle u-text-palette-1-base u-icon-3" data-animation-name="slideIn" data-animation-duration="1000" data-animation-delay="0" data-animation-direction="Down"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 64 64" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-9bf7"></use></svg><svg class="u-svg-content" viewBox="0 0 64 64" id="svg-9bf7"><path d="m30 19h-2v6.32c-1.99 2.83-5.28 4.68-9 4.68-6.08 0-11-4.92-11-11s4.92-11 11-11 11 4.92 11 11zm-6 0c0-2.76-2.24-5-5-5s-5 2.24-5 5 2.24 5 5 5 5-2.24 5-5z" fill="#fcd770"></path><path d="m36 16v2.63c-1.37.25-2.77.37-4.17.37h-1.83c0-6.08-4.92-11-11-11s-11 4.92-11 11 4.92 11 11 11c3.72 0 7.01-1.85 9-4.68v4.96c0 .8.04 1.6.12 2.38l-1.36-.84c-1.28.78-2.69 1.37-4.18 1.73l-.58 2.45h-6l-.58-2.45c-1.49-.36-2.9-.95-4.18-1.73l-2.14 1.32-4.24-4.24 1.32-2.14c-.78-1.28-1.37-2.69-1.73-4.18l-2.45-.58v-6l2.45-.58c.36-1.49.95-2.9 1.73-4.18l-1.32-2.14 4.24-4.24 2.14 1.32c1.28-.78 2.69-1.37 4.18-1.73l.58-2.45h6l.58 2.45c1.49.36 2.9.95 4.18 1.73l2.14-1.32 4.24 4.24-1.32 2.14c.78 1.28 1.37 2.69 1.73 4.18z" fill="#ffc729"></path><path d="m57 45 3 11-4-1-3 5-3-9-.05-.09c2.72-1.53 5.08-3.57 6.97-5.98z" fill="#fc6e51"></path><path d="m40.05 50.91-.05.09-3 9-3-5-4 1 3-11 .08-.07c1.89 2.41 4.25 4.45 6.97 5.98z" fill="#fc6e51"></path><path d="m62 19v11.28c0 5.46-1.87 10.58-5.08 14.65-1.89 2.41-4.25 4.45-6.97 5.98-1.54.87-3.2 1.58-4.95 2.09-1.75-.51-3.41-1.22-4.95-2.09-2.72-1.53-5.08-3.57-6.97-5.98-2.74-3.47-4.5-7.71-4.96-12.27-.08-.78-.12-1.58-.12-2.38v-4.96-6.32h2 1.83c1.4 0 2.8-.12 4.17-.37 3.19-.57 6.25-1.79 8.97-3.61l.03-.02.03.02c3.89 2.6 8.46 3.98 13.14 3.98z" fill="#b4dd7f"></path><path d="m58 23v7.28c0 8.27-5.29 15.72-13 18.51-7.71-2.79-13-10.24-13-18.51v-7.28c4.57-.03 9.01-1.17 13-3.33 3.99 2.16 8.43 3.3 13 3.33z" fill="#e6e9ed"></path><path d="m54 30-11 11-5-5 3-3 2 2 8-8z" fill="#ff826e"></path><path d="m43.303 25.925-.701-1.873c-.627.235-1.263.45-1.891.64l.578 1.914c.669-.202 1.347-.431 2.014-.681z"></path><path d="m37 30.28v-2.688c.742-.119 1.487-.265 2.226-.435l-.451-1.949c-.964.224-1.941.4-2.904.527l-.871.115v4.431c0 .268.006.535.02.801l1.998-.102c-.012-.233-.018-.465-.018-.7z"></path><path d="m19 13c-3.309 0-6 2.691-6 6s2.691 6 6 6 6-2.691 6-6-2.691-6-6-6zm0 10c-2.206 0-4-1.794-4-4s1.794-4 4-4 4 1.794 4 4-1.794 4-4 4z"></path><path d="m45.478 18.788-.477-.259-.477.259c-3.828 2.074-8.161 3.185-12.53 3.211l-.994.006v8.275c0 8.677 5.489 16.495 13.659 19.453l.341.123.341-.123c8.17-2.958 13.659-10.776 13.659-19.453v-8.275l-.994-.006c-4.366-.026-8.698-1.137-12.528-3.211zm11.522 11.492c0 7.717-4.807 14.682-12 17.445-7.193-2.764-12-9.729-12-17.445v-6.305c4.178-.171 8.297-1.261 12.001-3.177 3.705 1.916 7.823 3.006 11.999 3.177z"></path><path d="m41 31.586-4.414 4.414 6.414 6.414 12.414-12.414-4.414-4.414-8 8zm11.586-1.586-9.586 9.586-3.586-3.586 1.586-1.586 2 2 8-8z"></path><path d="m63 18h-4.829c-4.494 0-8.845-1.317-12.622-3.836l-.587-.341-.551.367c-2.277 1.519-4.784 2.595-7.411 3.209v-2.191l-2.635-.62c-.332-1.159-.795-2.275-1.381-3.332l1.426-2.303-5.363-5.363-2.303 1.426c-1.057-.586-2.173-1.049-3.332-1.381l-.62-2.635h-7.584l-.62 2.635c-1.159.332-2.275.795-3.332 1.381l-2.303-1.426-5.363 5.363 1.426 2.303c-.586 1.057-1.049 2.173-1.381 3.332l-2.635.62v7.584l2.635.62c.332 1.159.795 2.275 1.381 3.332l-1.426 2.303 5.363 5.363 2.303-1.426c1.057.586 2.173 1.049 3.332 1.381l.62 2.635h7.584l.62-2.635c1.159-.332 2.275-.795 3.332-1.381l.461.285c.536 4.323 2.198 8.378 4.745 11.78l-3.364 12.335 4.938-1.235 3.737 6.229 3.353-10.059c1.304.659 2.671 1.217 4.104 1.639l.282.084.282-.083c1.433-.422 2.8-.98 4.104-1.639l3.353 10.059 3.737-6.229 4.938 1.235-3.364-12.335c3.127-4.178 4.95-9.332 4.95-14.77zm-36.234 12.646-.523.318c-1.215.736-2.527 1.281-3.903 1.617l-.596.146-.536 2.273h-4.416l-.535-2.273-.596-.146c-1.376-.336-2.688-.881-3.903-1.617l-.523-.318-1.986 1.229-3.123-3.123 1.229-1.986-.318-.523c-.736-1.215-1.281-2.527-1.617-3.903l-.146-.596-2.274-.536v-4.416l2.273-.535.146-.596c.336-1.376.881-2.688 1.617-3.903l.318-.523-1.229-1.987 3.123-3.123 1.986 1.229.523-.318c1.215-.736 2.527-1.281 3.903-1.617l.596-.146.536-2.273h4.416l.535 2.273.596.146c1.376.336 2.688.881 3.903 1.617l.523.318 1.986-1.229 3.123 3.123-1.229 1.986.318.523c.736 1.215 1.281 2.527 1.617 3.903l.146.596 2.274.536v.982c-1.045.146-2.103.226-3.171.226h-.88c-.511-6.15-5.669-11-11.949-11-6.617 0-12 5.383-12 12s5.383 12 12 12c2.98 0 5.82-1.119 8-3.068v2.349c0 .176.018.349.022.524zm.234-12.646v6.979c-1.887 2.518-4.849 4.021-8 4.021-5.514 0-10-4.486-10-10s4.486-10 10-10c5.176 0 9.446 3.954 9.949 9zm9.739 39.621-2.263-3.771-3.062.765 2.099-7.698c1.552 1.701 3.34 3.189 5.324 4.409zm21.847-3.006-3.062-.765-2.263 3.771-2.098-6.295c1.984-1.22 3.772-2.708 5.324-4.409zm2.414-24.335c0 9.894-6.564 18.765-16 21.676-9.436-2.911-16-11.782-16-21.676v-10.28h2.829c4.673 0 9.203-1.309 13.17-3.808 3.948 2.494 8.489 3.808 13.172 3.808h2.829z"></path></svg></span>
                  <h6 class="u-align-center u-text u-text-default u-text-7"> Best quality products</h6>
                  <p class="u-align-center u-text u-text-8"> We always strive to give our customers the best, the best, the tastiest, the most nutritious. We would like to say it for sure.&nbsp;<br>Best brand among&nbsp;<br>brands !
                  </p>
                </div>
              </div>
              <div class="u-container-style u-layout-cell u-size-15 u-layout-cell-4">
                <div class="u-container-layout u-valign-middle-xs u-container-layout-4">
                  <h6 class="u-align-center u-text u-text-default u-text-9"> Fastest food delivery</h6>
                  <p class="u-align-center u-text u-text-10"> Our staff is ready to serve hot meals at home. We consider your enjoyment and happiness to be our priority !</p><span class="u-icon u-icon-circle u-text-palette-1-base u-icon-4" data-animation-name="fadeIn" data-animation-duration="1000" data-animation-delay="0" data-animation-direction="Up"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 64 64" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-9d9b"></use></svg><svg class="u-svg-content" viewBox="0 0 64 64" id="svg-9d9b"><path d="m8.961 15.46h34v32h-34z" fill="#90622a" transform="matrix(.983 -.182 .182 .983 -5.294 5.252)"></path><path d="m12.743 9.5-6.41 9.323 12.782-2.367 7.867-1.456 12.782-2.367 6.41-9.323z" fill="#7a5324"></path><path d="m46.174 3.31-6.41 9.323 5.826 31.465 6.41-9.323z" fill="#7a5324"></path><path d="m20.232 15.619h8v13h-8z" fill="#fca947" transform="matrix(.983 -.182 .182 .983 -3.622 4.781)"></path><path d="m26.982 14.999-7.867 1.457 6.41-9.323 7.867-1.456z" fill="#fca947"></path><g fill="#7a5324"><path d="m32.674 31.609 1.824.332c-.757-.603-1.169-1.589-.965-2.605.266-1.331 1.488-2.25 2.84-2.137l9.627.801-3.828-5.359c-.676-.947-.569-2.244.254-3.066.231-.231.499-.402.784-.518l-.534-.468c-.943-.825-2.364-.778-3.25.108-.823.823-.93 2.119-.254 3.066l3.828 5.36-9.627-.802c-1.352-.113-2.574.807-2.84 2.137-.293 1.464.672 2.884 2.141 3.151z"></path><path d="m37.536 43.848 6.464-4.848-6.023 1.39-3.441 2.58c-.89.667-1.175 1.875-.678 2.87.07.139.152.267.244.384l2.523-.467c-.021-.728.296-1.448.911-1.909z"></path><path d="m30.489 39.446c-.271-1.356.597-2.679 1.95-2.969l11.561-2.477-3.838-.698-10.723 2.298c-1.353.29-2.221 1.612-1.95 2.969.28 1.398 1.659 2.289 3.049 1.968l.398-.092c-.213-.289-.372-.623-.447-.999z"></path><path d="m18 40 9.627-.802c1.14-.095 2.181.548 2.641 1.549.744-.643 1.14-1.649.933-2.684-.282-1.408-1.574-2.38-3.004-2.261l-7.652.638z"></path><path d="m21.574 31.574c.013.013.022.028.034.041l.453-.635c.715-1.001.602-2.373-.268-3.243-.937-.937-2.44-.987-3.438-.115l-6.69 5.854-2.83-1.132.678 3.661 2.487.995 6.324-5.534c.943-.825 2.364-.778 3.25.108z"></path><path d="m32.357 45.617-4.706-1.008-7.651 1.391 7.1 1.521 6.546-1.212c-.347-.334-.783-.584-1.289-.692z"></path>
</g><path d="m2 33 10 4 6.324-5.534c.943-.825 2.364-.778 3.25.108.823.823.93 2.119.254 3.066l-3.828 5.36 9.627-.802c1.352-.113 2.574.807 2.84 2.137.293 1.464-.672 2.884-2.141 3.151l-8.326 1.514 11.561 2.477c1.353.29 2.221 1.612 1.95 2.969-.28 1.398-1.659 2.289-3.049 1.968l-10.462-2.414 6.464 4.848c.89.667 1.175 1.875.678 2.87-.61 1.221-2.143 1.645-3.294.912l-8.848-5.63 2 4c.552 1.105.105 2.448-1 3-1.105.552-2.448.105-3-1l-5-10-6-3" fill="#fee6d5"></path><path d="m62 21-10 4-6.324-5.534c-.943-.825-2.364-.778-3.25.108-.823.823-.93 2.119-.254 3.066l3.828 5.36-9.627-.802c-1.352-.113-2.574.807-2.84 2.137-.293 1.464.672 2.884 2.141 3.151l8.326 1.514-11.561 2.477c-1.353.29-2.221 1.612-1.95 2.969.28 1.398 1.659 2.289 3.049 1.968l10.462-2.414-6.464 4.848c-.89.667-1.175 1.875-.678 2.87.61 1.221 2.143 1.645 3.294.912l8.848-5.63-1.544 5.405c-.255.892.238 1.827 1.118 2.12.818.273 1.712-.098 2.098-.869l5.328-10.656 6-3" fill="#fee6d5"></path><path d="m55.553 37.105c-.193.097-.351.254-.447.447l-5.328 10.655c-.162.324-.543.483-.888.367-.373-.124-.581-.518-.473-.896l1.544-5.404c.114-.399-.03-.827-.363-1.076-.333-.248-.785-.266-1.135-.042l-8.847 5.63c-.316.201-.688.256-1.047.156s-.649-.338-.816-.672c-.282-.563-.121-1.245.383-1.623l6.464-4.847c.378-.283.506-.793.307-1.222s-.672-.659-1.131-.553l-10.463 2.414c-.405.095-.823.021-1.172-.204-.351-.227-.588-.576-.67-.985-.163-.815.366-1.62 1.179-1.795l11.561-2.478c.467-.1.798-.516.791-.993-.008-.478-.352-.883-.821-.968l-8.326-1.514c-.445-.081-.829-.332-1.083-.706-.254-.373-.345-.823-.256-1.266.167-.833.929-1.413 1.776-1.337l9.627.802c.381.042.76-.163.953-.502.192-.339.17-.759-.056-1.075l-3.829-5.359c-.394-.551-.332-1.299.147-1.778.511-.511 1.339-.54 1.884-.063l6.324 5.534c.283.246.679.314 1.03.176l10-4-.743-1.857-9.431 3.772-1.437-1.257-3.603-19.457-.009.002c-.023-.127-.062-.252-.135-.365-.22-.339-.62-.511-1.021-.438l-33.432 6.189c-.261.049-.492.198-.642.417l-6.41 9.322c-.15.219-.208.487-.159.748l2.85 15.399-5.829-2.331-.743 1.857 10 4c.352.14.748.071 1.03-.176l6.324-5.534c.544-.477 1.373-.449 1.884.063.479.479.542 1.228.147 1.778l-3.828 5.359c-.226.316-.248.736-.056 1.075s.566.542.953.502l9.627-.802c.851-.067 1.61.505 1.776 1.337.088.442-.002.893-.256 1.266-.254.374-.638.625-1.083.706l-8.326 1.514c-.47.085-.813.49-.821.968-.007.478.324.894.791.993l11.561 2.478c.813.175 1.342.979 1.179 1.795-.082.409-.32.759-.67.985-.35.225-.766.299-1.173.204l-10.462-2.414c-.458-.105-.932.124-1.131.553s-.072.938.306 1.221l6.464 4.848c.503.378.665 1.061.383 1.623-.167.334-.457.572-.816.672-.361.099-.732.045-1.046-.156l-8.848-5.63c-.377-.239-.872-.2-1.207.102-.333.301-.425.787-.225 1.189l2 4c.305.609.057 1.354-.553 1.658-.294.147-.629.171-.943.067-.313-.104-.567-.324-.715-.62l-5-10c-.097-.193-.254-.351-.447-.447l-6-3-.895 1.789 5.702 2.851 4.851 9.702c.387.773 1.051 1.35 1.871 1.623.336.112.682.168 1.026.168.496 0 .988-.116 1.445-.344 1.595-.799 2.245-2.746 1.447-4.342l-.386-.771 5.802 3.691c.788.501 1.755.646 2.654.396.899-.249 1.654-.871 2.071-1.705.714-1.429.305-3.16-.972-4.117l-2.68-2.01 5.854 1.351c.936.216 1.898.048 2.707-.473.809-.522 1.358-1.329 1.547-2.273.352-1.762-.703-3.487-2.378-4.032l3.753-.695c.033.083.058.168.098.25.417.834 1.172 1.456 2.071 1.705.898.248 1.866.104 2.654-.396l6.625-4.216-.82 2.872c-.403 1.411.372 2.88 1.763 3.343.282.095.571.14.856.14 1.012 0 1.982-.566 2.454-1.51l5.178-10.357 5.702-2.851-.895-1.789zm-16.378-25.38-10.002 1.852 4.807-6.991 10.002-1.852zm-17.868 3.308 4.807-6.991 5.085-.942-4.807 6.991zm4.874 1.131 2.002 10.816-5.899 1.093-2.003-10.817zm-12.849-5.756 10.001-1.852-4.807 6.991-10.001 1.852zm4.334 20.305-5.863 5.131-1.406-.562-2.899-15.659 10.816-2.002 2.185 11.799c.051.276.217.494.432.639-1.098-.354-2.344-.151-3.265.654zm9.878 7.489-7.475.622 2.573-3.603c.964-1.349.813-3.181-.36-4.354-.281-.281-.605-.494-.948-.655.05.008.096.026.148.026.06 0 .122-.005.183-.017l7.866-1.456c.261-.049.492-.198.642-.417s.208-.487.159-.748l-2.184-11.8 10.816-2.002.441 2.384 1.967-.363-.548-2.96 4.807-6.992 2.702 14.596-1.999-1.749c-1.334-1.166-3.361-1.1-4.616.154-1.173 1.174-1.324 3.006-.36 4.354l2.573 3.603-7.475-.622c-1.863-.157-3.537 1.106-3.904 2.937-.195.973.005 1.961.563 2.782s1.403 1.371 2.38 1.549l3.357.61-6.623 1.42c-1.515.325-2.586 1.603-2.75 3.073-.582-.29-1.245-.429-1.935-.372zm8.166 6.708-8.596 1.592-1.966-.422 3.357-.61c.977-.178 1.822-.728 2.379-1.549.365-.538.56-1.15.608-1.781.708.329 1.496.426 2.269.248l5.854-1.351-2.68 2.01c-.631.475-1.049 1.14-1.225 1.863z"></path><path d="m7 9h2c0-2.757 2.243-5 5-5h1v-2h-1c-3.86 0-7 3.141-7 7z"></path><path d="m51 60v2h1c3.86 0 7-3.141 7-7h-2c0 2.757-2.243 5-5 5z"></path><path d="m49 57h-1v2h1c3.86 0 7-3.141 7-7h-2c0 2.757-2.243 5-5 5z"></path></svg></span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="skrollable u-clearfix u-image u-parallax u-section-5" id="carousel_cc73" data-image-width="1600" data-image-height="1067">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-container-style u-effect-hover-liftUp u-group u-image u-image-round u-image-1" data-image-width="700" data-image-height="1000">
          <div class="u-background-effect u-expanded">
            <div class="u-background-effect-image u-expanded u-image u-image-2" data-image-width="700" data-image-height="1000"></div>
          </div>
          <div class="u-container-layout u-container-layout-1">
            <div class="u-black u-container-style u-expanded-width-xs u-group u-group-2" data-animation-name="rollIn" data-animation-duration="1000" data-animation-delay="0" data-animation-direction="">
              <div class="u-container-layout u-container-layout-2">
                <h1 class="u-align-center u-custom-font u-text u-title u-text-1">
                  <span class="u-text-custom-color-2">#Promo</span> Offers
                </h1>
                <h2 class="u-subtitle u-text u-text-default u-text-2">by Henry Bakers</h2>
                <a href="https://nicepage.com/" class="u-active-none u-border-2 u-border-black u-btn u-btn-rectangle u-button-style u-hover-none u-none u-btn-1">read more</a>
              </div>
            </div>
          </div>
        </div><!--products--><!--products_options_json--><!--{"type":"Recent","source":"","tags":"","count":""}--><!--/products_options_json-->
        <div class="u-layout-horizontal u-products u-products-1">
          <div class="u-repeater u-repeater-1" id="promoRow"><!--product_item-->
           
          </div>
          <a class="u-gallery-nav u-gallery-nav-prev u-icon-circle u-opacity u-opacity-70 u-palette-5-dark-2 u-spacing-10 u-text-custom-color-2 u-text-hover-white u-gallery-nav-1" href="#" role="button">
            <span aria-hidden="true">
              <svg viewBox="0 0 451.847 451.847"><path d="M97.141,225.92c0-8.095,3.091-16.192,9.259-22.366L300.689,9.27c12.359-12.359,32.397-12.359,44.751,0
c12.354,12.354,12.354,32.388,0,44.748L173.525,225.92l171.903,171.909c12.354,12.354,12.354,32.391,0,44.744
c-12.354,12.365-32.386,12.365-44.745,0l-194.29-194.281C100.226,242.115,97.141,234.018,97.141,225.92z"></path></svg>
            </span>
            <span class="sr-only">
              <svg viewBox="0 0 451.847 451.847"><path d="M97.141,225.92c0-8.095,3.091-16.192,9.259-22.366L300.689,9.27c12.359-12.359,32.397-12.359,44.751,0
c12.354,12.354,12.354,32.388,0,44.748L173.525,225.92l171.903,171.909c12.354,12.354,12.354,32.391,0,44.744
c-12.354,12.365-32.386,12.365-44.745,0l-194.29-194.281C100.226,242.115,97.141,234.018,97.141,225.92z"></path></svg>
            </span>
          </a>
          <a class="u-absolute-vcenter-lg u-absolute-vcenter-md u-absolute-vcenter-sm u-absolute-vcenter-xl u-gallery-nav u-gallery-nav-next u-icon-circle u-opacity u-opacity-70 u-palette-5-dark-2 u-spacing-10 u-text-custom-color-2 u-text-hover-white u-gallery-nav-2" href="#" role="button">
            <span aria-hidden="true">
              <svg viewBox="0 0 451.846 451.847"><path d="M345.441,248.292L151.154,442.573c-12.359,12.365-32.397,12.365-44.75,0c-12.354-12.354-12.354-32.391,0-44.744
L278.318,225.92L106.409,54.017c-12.354-12.359-12.354-32.394,0-44.748c12.354-12.359,32.391-12.359,44.75,0l194.287,194.284
c6.177,6.18,9.262,14.271,9.262,22.366C354.708,234.018,351.617,242.115,345.441,248.292z"></path></svg>
            </span>
            <span class="sr-only">
              <svg viewBox="0 0 451.846 451.847"><path d="M345.441,248.292L151.154,442.573c-12.359,12.365-32.397,12.365-44.75,0c-12.354-12.354-12.354-32.391,0-44.744
L278.318,225.92L106.409,54.017c-12.354-12.359-12.354-32.394,0-44.748c12.354-12.359,32.391-12.359,44.75,0l194.287,194.284
c6.177,6.18,9.262,14.271,9.262,22.366C354.708,234.018,351.617,242.115,345.441,248.292z"></path></svg>
            </span>
          </a>
        </div><!--/products-->
      </div>
    </section>
    <section class="u-align-center u-clearfix u-section-6" id="sec-fa94">
      <div class="u-clearfix u-sheet u-sheet-1">
        <h2 class="u-text u-text-default u-text-grey-40 u-text-1"> Food Menu</h2>
        <h1 class="u-text u-text-default u-text-2">
          <span class="u-text-custom-color-2">Delicious </span>Food Menu
        </h1><!--products--><!--products_options_json--><!--{"type":"products-category","source":"Pizza","tags":"","count":""}--><!--/products_options_json-->
        <div class="u-pagination-center u-products u-products-1">
          <div class="u-list-control"></div>
          <div class="u-repeater u-repeater-1" id="categoryRow">
           <!--/product_item-->
          </div>
          <div class="u-list-control"></div>
        </div><!--/products-->
      </div>
    </section>
    <section class="u-align-left u-clearfix u-section-7" id="carousel_edc5">
      <h2 class="u-text u-text-grey-40 u-text-1"> Our Team</h2>
      <h1 class="u-text u-text-2"> Our Master&nbsp;<span class="u-text-custom-color-2">Chef</span>
      </h1><span class="u-icon u-icon-circle u-text-grey-90 u-icon-1" data-animation-name="jello" data-animation-duration="1000" data-animation-delay="0" data-animation-direction=""><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 512 512" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-fb92"></use></svg><svg class="u-svg-content" viewBox="0 0 512 512" x="0px" y="0px" id="svg-fb92" style="enable-background:new 0 0 512 512;"><path style="fill:#D7D9CC;" d="M187.54,392.479c-50.131,0-90.767,40.636-90.767,90.757V504.5h50.776l7.715-6.234l7.285,6.234h39.282  l81.401-112.021H187.54z"></path><path style="fill:#F3F5E6;" d="M324.459,392.479h-41.227l-41.434,33.919l-39.967,32.472v45.63h147.62l7.5-5.734l7.5,5.734h50.776  v-21.264C415.226,433.115,374.59,392.479,324.459,392.479z"></path><polygon style="fill:#A8503C;" points="419.124,229.544 256,214.588 92.876,229.544 92.876,298.57 419.124,298.57 "></polygon><circle style="fill:#E3B098;" cx="402.42" cy="298.99" r="34.31"></circle><ellipse style="fill:#FBC4AC;" cx="256" cy="288.15" rx="149.37" ry="138.87"></ellipse><path style="fill:#E3B098;" d="M136.626,288.153c0-71.988,58.921-131.18,134.374-138.174c-4.934-0.458-9.937-0.694-15-0.694  c-73.898,0-135.253,49.891-147.243,115.417c-18.566,0.438-33.484,15.615-33.484,34.286c0,18.947,15.36,34.307,34.307,34.307  c1.876,0,3.512-0.156,4.953-0.446c20.014,54.767,75.789,94.174,141.467,94.174c5.063,0,10.066-0.237,15-0.694  C195.547,419.333,136.626,360.142,136.626,288.153z"></path><path style="fill:#F3F5E6;" d="M372.728,7.5c-25.988,0-48.341,15.499-58.364,37.75C304.341,22.999,281.988,7.5,256,7.5  s-48.341,15.499-58.364,37.75C187.613,22.999,165.259,7.5,139.271,7.5c-35.345,0-63.998,28.653-63.998,63.998  c0,17.084,6.694,32.604,17.602,44.081l0.001,0.001v84.053L256,214.588l163.124-14.955V115.58l0.001-0.001  c10.908-11.477,17.602-26.997,17.602-44.081C436.726,36.153,408.074,7.5,372.728,7.5z"></path><path style="fill:#D7D9CC;" d="M122.876,199.633V115.58h-0.001c-10.908-11.477-17.602-26.998-17.602-44.081  c0-30.182,20.899-55.467,49.011-62.216c-4.816-1.159-9.841-1.782-15.013-1.782c-35.345,0-63.998,28.653-63.998,63.998  c0,17.083,6.694,32.604,17.602,44.081h0.001v84.054L256,214.588l15-1.375L122.876,199.633z"></path><path style="fill:#A8503C;" d="M256,342.75c16.888,21.111,41.772,12.362,54.896,5.429c3.183-1.681,3.41-6.102,0.46-8.166  c-7.523-5.264-11.903-16.79-18.117-22.582c-9.654-8.998-26.286-14.464-37.239-4.533c-10.953-9.931-27.585-4.465-37.239,4.533  c-6.214,5.791-10.594,17.318-18.117,22.582c-2.949,2.064-2.723,6.484,0.46,8.166C214.228,355.112,239.111,363.86,256,342.75z"></path><g><path style="fill:#F98084;" d="M349.236,329.18h-21.804c-4.142,0-7.5-3.358-7.5-7.5s3.358-7.5,7.5-7.5h21.804   c4.142,0,7.5,3.358,7.5,7.5C356.736,325.822,353.378,329.18,349.236,329.18z"></path><path style="fill:#F98084;" d="M184.568,329.18h-21.805c-4.142,0-7.5-3.358-7.5-7.5s3.358-7.5,7.5-7.5h21.805   c4.142,0,7.5,3.358,7.5,7.5S188.711,329.18,184.568,329.18z"></path>
</g><rect x="92.88" y="199.63" style="fill:#D7D9CC;" width="326.25" height="29.911"></rect><rect x="92.88" y="199.63" style="fill:#BDBFB4;" width="30" height="29.91"></rect><path d="M315.657,333.868c-3.06-2.141-5.903-6.493-8.652-10.701c-2.595-3.972-5.278-8.079-8.651-11.222  c-7.961-7.419-18.505-11.849-28.207-11.849c-5.136,0-9.934,1.233-14.146,3.606c-4.211-2.373-9.009-3.606-14.146-3.606  c-9.702,0-20.247,4.429-28.207,11.849c-3.373,3.144-6.056,7.25-8.651,11.222c-2.749,4.208-5.592,8.56-8.652,10.701  c-3.559,2.49-5.522,6.556-5.252,10.875c0.267,4.292,2.701,8.055,6.51,10.067c7.518,3.971,19.043,8.706,31.258,8.706  c0.001,0,0,0,0.002,0c10.326,0,19.571-3.419,27.138-9.968c7.568,6.548,16.814,9.968,27.141,9.968  c12.214,0,23.741-4.734,31.259-8.706c3.809-2.012,6.242-5.775,6.51-10.067C321.179,340.424,319.215,336.358,315.657,333.868z   M283.141,348.517c-8.695,0-15.657-3.419-21.284-10.452c-1.423-1.779-3.578-2.815-5.856-2.815s-4.433,1.036-5.856,2.815  c-5.626,7.033-12.588,10.452-21.282,10.452c-0.001,0-0.001,0-0.001,0c-7.421,0-14.811-2.498-20.549-5.139  c3.724-3.56,6.62-7.992,9.242-12.006c2.202-3.37,4.281-6.553,6.32-8.454c5.099-4.751,12.156-7.822,17.98-7.822  c3.636,0,6.615,1.099,9.108,3.358c2.858,2.592,7.217,2.592,10.075,0c2.493-2.26,5.472-3.358,9.108-3.358  c5.824,0,12.882,3.07,17.98,7.822c2.039,1.9,4.119,5.083,6.32,8.454c2.623,4.014,5.518,8.446,9.242,12.006  C297.95,346.019,290.561,348.517,283.141,348.517z"></path><path d="M338.334,305.649c4.142,0,7.5-3.358,7.5-7.5V282.14c0-4.142-3.358-7.5-7.5-7.5s-7.5,3.358-7.5,7.5v16.009  C330.834,302.291,334.192,305.649,338.334,305.649z"></path><path d="M173.666,305.649c4.142,0,7.5-3.358,7.5-7.5V282.14c0-4.142-3.358-7.5-7.5-7.5s-7.5,3.358-7.5,7.5v16.009  C166.166,302.291,169.524,305.649,173.666,305.649z"></path><path d="M256,177.631c4.142,0,7.5-3.358,7.5-7.5V86.416c0-4.142-3.358-7.5-7.5-7.5s-7.5,3.358-7.5,7.5v83.715  C248.5,174.273,251.858,177.631,256,177.631z"></path><path d="M180.82,177.631c4.142,0,7.5-3.358,7.5-7.5V86.416c0-4.142-3.358-7.5-7.5-7.5s-7.5,3.358-7.5,7.5v83.715  C173.32,174.273,176.678,177.631,180.82,177.631z"></path><path d="M331.18,177.631c4.142,0,7.5-3.358,7.5-7.5V86.416c0-4.142-3.358-7.5-7.5-7.5s-7.5,3.358-7.5,7.5v83.715  C323.68,174.273,327.037,177.631,331.18,177.631z"></path><circle cx="236.63" cy="472" r="9.192"></circle><circle cx="313.43" cy="472" r="9.192"></circle><path d="M85.376,265.021c-10.626,7.627-17.603,20.077-17.603,33.967c0,23.052,18.755,41.807,41.807,41.807  c0.015,0,0.03-0.001,0.045-0.001c8.341,20.122,21.313,38.108,37.697,52.813c-14.873,6.71-28.084,17.125-38.022,30.18  c-13.102,17.211-20.027,37.77-20.027,59.452V504.5c0,4.142,3.358,7.5,7.5,7.5h318.453c4.142,0,7.5-3.358,7.5-7.5v-21.264  c0-21.682-6.925-42.24-20.026-59.452c-9.938-13.055-23.149-23.469-38.022-30.18c16.384-14.705,29.356-32.69,37.697-52.813  c0.015,0,0.03,0.001,0.045,0.001c23.052,0,41.807-18.754,41.807-41.807c0-13.89-6.977-26.34-17.603-33.967l0.001-146.539  c11.373-13.027,17.602-29.593,17.602-46.983C444.226,32.074,412.153,0,372.728,0c-23.419,0-45.116,11.523-58.364,30.22  C301.117,11.523,279.42,0,256,0c-23.419,0-45.116,11.523-58.364,30.22C184.389,11.523,162.692,0,139.272,0  C99.848,0,67.774,32.074,67.774,71.498c0,17.39,6.229,33.957,17.603,46.984L85.376,265.021z M411.624,222.043H100.376v-14.91  h311.248V222.043z M100.376,258.218v-21.174h8.585c-2.716,6.779-4.863,13.705-6.457,20.752c-0.041,0.007-0.081,0.017-0.122,0.024  c-0.033,0.006-0.066,0.014-0.099,0.02C101.645,257.953,101.009,258.075,100.376,258.218z M104.212,325.254  c-12.218-2.493-21.439-13.323-21.439-26.267c0-11.238,7.117-21.013,17.08-24.948c-0.114,1.115-0.215,2.233-0.302,3.354  c-1.059,13.725-0.022,27.499,2.934,40.936C103.007,320.648,103.57,322.96,104.212,325.254z M104.274,483.236  c0-35.545,23.018-67.446,56.41-78.827c16.795,12.008,35.841,20.623,56.112,25.485c2.299,0.553,4.612,1.068,6.934,1.52  l-26.627,21.634c-1.753,1.424-2.771,3.563-2.771,5.821V497H162.55v-37.313c0-4.142-3.358-7.5-7.5-7.5s-7.5,3.358-7.5,7.5V497  h-43.276L104.274,483.236L104.274,483.236z M351.315,404.409c33.393,11.38,56.412,43.282,56.412,78.827V497h-43.275v-37.313  c0-4.142-3.358-7.5-7.5-7.5s-7.5,3.358-7.5,7.5V497h-140.12v-34.56l34.868-28.33c1.8,0.125,3.611,0.214,5.428,0.282  c25.796,0.964,51.754-3.998,75.242-14.751C334.138,415.397,343.016,410.334,351.315,404.409z M321.126,404.839  c-33.098,15.903-72.145,18.943-107.388,8.731c-50.986-14.762-89.697-55.502-97.969-105.405c-0.003-0.021-0.007-0.041-0.01-0.062  c-2.236-13.732-3.052-28.304,0.357-41.939l0.007-0.032c0.02-0.089,0.038-0.179,0.054-0.269c1.826-9.881,4.893-19.555,9.126-28.819  h261.393c4.234,9.265,7.301,18.938,9.127,28.819c0.017,0.09,0.035,0.179,0.055,0.269l0.006,0.029  c2.512,13.806,2.646,28.101,0.357,41.947c-0.003,0.018-0.006,0.036-0.009,0.054C389.25,350.292,360.57,385.888,321.126,404.839z   M407.788,325.254c4.346-15.514,5.9-31.791,4.661-47.85c-0.087-1.124-0.189-2.246-0.303-3.365  c9.963,3.936,17.079,13.709,17.079,24.948C429.226,311.931,420.006,322.761,407.788,325.254z M409.616,257.819  c-0.041-0.007-0.08-0.017-0.121-0.024c-1.594-7.047-3.741-13.973-6.457-20.752h8.585v21.174c-0.625-0.141-1.256-0.262-1.888-0.375  C409.696,257.836,409.656,257.827,409.616,257.819z M82.774,71.498C82.774,40.345,108.119,15,139.272,15  c22.18,0,42.405,13.083,51.525,33.329c2.605,5.783,11.077,5.771,13.677,0.001C213.595,28.083,233.82,15,256,15  s42.405,13.083,51.525,33.329c2.607,5.788,11.073,5.781,13.677,0.002C330.323,28.083,350.548,15,372.728,15  c31.153,0,56.498,25.345,56.498,56.498c0,14.552-5.519,28.372-15.539,38.915c-1.325,1.394-2.063,3.244-2.063,5.167v76.553H100.376  l-0.001-76.554c0-1.923-0.739-3.773-2.063-5.167C88.292,99.87,82.774,86.049,82.774,71.498z"></path></svg></span>
      <p class="u-align-center u-text u-text-3"> " You are our heart and our beloved customers. It is our sole responsibility to provide you with the freshest and tastiest food you want ! "</p>
      <div class="u-palette-3-base u-shape u-shape-rectangle u-shape-1"></div>
      <div class="u-clearfix u-gutter-48 u-layout-wrap u-layout-wrap-1">
        <div class="u-gutter-0 u-layout">
          <div class="u-layout-row">
            <div class="u-align-left u-container-style u-effect-hover-zoom u-layout-cell u-left-cell u-size-30 u-layout-cell-1" src="" data-image-width="639" data-image-height="915">
              <div class="u-background-effect u-expanded">
                <div class="u-background-effect-image u-expanded u-image u-shading u-image-1" data-image-width="639" data-image-height="915"></div>
              </div>
              <div class="u-container-layout u-container-layout-1">
                <div class="u-social-icons u-spacing-7 u-social-icons-1" data-animation-name="rotateIn" data-animation-duration="1000" data-animation-delay="0" data-animation-direction="">
                  <a class="u-social-url" title="facebook" target="_blank" href="https://www.facebook.com/gihan.isharaka"><span class="u-icon u-social-facebook u-social-icon u-icon-2"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 112 112" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-8ed9"></use></svg><svg class="u-svg-content" viewBox="0 0 112 112" x="0" y="0" id="svg-8ed9"><path fill="currentColor" d="M75.5,28.8H65.4c-1.5,0-4,0.9-4,4.3v9.4h13.9l-1.5,15.8H61.4v45.1H42.8V58.3h-8.8V42.4h8.8V32.2
c0-7.4,3.4-18.8,18.8-18.8h13.8v15.4H75.5z"></path></svg></span>
                  </a>
                  <a class="u-social-url" target="_blank" title="Whatsapp" href=""><span class="u-icon u-social-icon u-social-whatsapp u-icon-3"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 112 112" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-a026"></use></svg><svg class="u-svg-content" viewBox="0 0 112 112" x="0" y="0" id="svg-a026"><circle fill="currentColor" cx="56.1" cy="56.1" r="55"></circle><path fill="#FFFFFF" d="M83.8,28.3C77.2,21.7,68.4,18,59,18c-19.3,0-35.1,15.7-35.1,35.1c0,6.2,1.6,12.2,4.7,17.5l-5,18.2L42.2,84
	c5.1,2.8,10.9,4.3,16.8,4.3h0l0,0c19.3,0,35.1-15.7,35.1-35.1C94.1,43.8,90.5,35,83.8,28.3 M59,82.3L59,82.3
	c-5.2,0-10.4-1.4-14.9-4.1l-1.1-0.6l-11,2.9L35,69.8l-0.7-1.1c-2.9-4.6-4.5-10-4.5-15.5C29.8,37,42.9,24,59,24
	c7.8,0,15.1,3,20.6,8.6c5.5,5.5,8.5,12.8,8.5,20.6C88.2,69.2,75.1,82.3,59,82.3 M75,60.5c-0.9-0.4-5.2-2.6-6-2.9
	c-0.8-0.3-1.4-0.4-2,0.4s-2.3,2.9-2.8,3.4c-0.5,0.6-1,0.7-1.9,0.2c-0.9-0.4-3.7-1.4-7.1-4.4c-2.6-2.3-4.4-5.2-4.9-6.1
	c-0.5-0.9-0.1-1.4,0.4-1.8c0.4-0.4,0.9-1,1.3-1.5c0.4-0.5,0.6-0.9,0.9-1.5c0.3-0.6,0.1-1.1-0.1-1.5c-0.2-0.4-2-4.8-2.7-6.5
	c-0.7-1.7-1.4-1.5-2-1.5c-0.5,0-1.1,0-1.7,0c-0.6,0-1.5,0.2-2.3,1.1c-0.8,0.9-3.1,3-3.1,7.3c0,4.3,3.1,8.5,3.6,9.1
	c0.4,0.6,6.2,9.4,15,13.2c2.1,0.9,3.7,1.4,5,1.8c2.1,0.7,4,0.6,5.5,0.3c1.7-0.3,5.2-2.1,5.9-4.2c0.7-2,0.7-3.8,0.5-4.2
	C76.5,61.1,75.9,60.9,75,60.5"></path></svg></span>
                  </a>
                  <a class="u-social-url" target="_blank" title="Instagram" href=""><span class="u-icon u-social-icon u-social-instagram u-icon-4"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 112 112" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-27c4"></use></svg><svg class="u-svg-content" viewBox="0 0 112 112" x="0" y="0" id="svg-27c4"><circle fill="currentColor" cx="56.1" cy="56.1" r="55"></circle><path fill="#FFFFFF" d="M55.9,38.2c-9.9,0-17.9,8-17.9,17.9C38,66,46,74,55.9,74c9.9,0,17.9-8,17.9-17.9C73.8,46.2,65.8,38.2,55.9,38.2
            z M55.9,66.4c-5.7,0-10.3-4.6-10.3-10.3c-0.1-5.7,4.6-10.3,10.3-10.3c5.7,0,10.3,4.6,10.3,10.3C66.2,61.8,61.6,66.4,55.9,66.4z"></path><path fill="#FFFFFF" d="M74.3,33.5c-2.3,0-4.2,1.9-4.2,4.2s1.9,4.2,4.2,4.2s4.2-1.9,4.2-4.2S76.6,33.5,74.3,33.5z"></path><path fill="#FFFFFF" d="M73.1,21.3H38.6c-9.7,0-17.5,7.9-17.5,17.5v34.5c0,9.7,7.9,17.6,17.5,17.6h34.5c9.7,0,17.5-7.9,17.5-17.5V38.8
            C90.6,29.1,82.7,21.3,73.1,21.3z M83,73.3c0,5.5-4.5,9.9-9.9,9.9H38.6c-5.5,0-9.9-4.5-9.9-9.9V38.8c0-5.5,4.5-9.9,9.9-9.9h34.5
            c5.5,0,9.9,4.5,9.9,9.9V73.3z"></path></svg></span>
                  </a>
                </div>
              </div>
            </div>
            <div class="u-align-left u-container-style u-effect-hover-zoom u-layout-cell u-size-30 u-layout-cell-2" src="" data-image-width="960" data-image-height="960">
              <div class="u-background-effect u-expanded">
                <div class="u-background-effect-image u-expanded u-image u-image-2" data-image-width="960" data-image-height="960"></div>
              </div>
              <div class="u-container-layout u-container-layout-2">
                <div class="u-social-icons u-spacing-7 u-social-icons-2" data-animation-name="rotateIn" data-animation-duration="1000" data-animation-delay="0" data-animation-direction="">
                  <a class="u-social-url" title="facebook" target="_blank" href="https://www.facebook.com/gayan.isharaka"><span class="u-icon u-social-facebook u-social-icon u-icon-5"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 112 112" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-523f"></use></svg><svg class="u-svg-content" viewBox="0 0 112 112" x="0" y="0" id="svg-523f"><path fill="currentColor" d="M75.5,28.8H65.4c-1.5,0-4,0.9-4,4.3v9.4h13.9l-1.5,15.8H61.4v45.1H42.8V58.3h-8.8V42.4h8.8V32.2
c0-7.4,3.4-18.8,18.8-18.8h13.8v15.4H75.5z"></path></svg></span>
                  </a>
                  <a class="u-social-url" target="_blank" title="Whatsapp" href=""><span class="u-icon u-social-icon u-social-whatsapp u-icon-6"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 112 112" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-3cd8"></use></svg><svg class="u-svg-content" viewBox="0 0 112 112" x="0" y="0" id="svg-3cd8"><circle fill="currentColor" cx="56.1" cy="56.1" r="55"></circle><path fill="#FFFFFF" d="M83.8,28.3C77.2,21.7,68.4,18,59,18c-19.3,0-35.1,15.7-35.1,35.1c0,6.2,1.6,12.2,4.7,17.5l-5,18.2L42.2,84
	c5.1,2.8,10.9,4.3,16.8,4.3h0l0,0c19.3,0,35.1-15.7,35.1-35.1C94.1,43.8,90.5,35,83.8,28.3 M59,82.3L59,82.3
	c-5.2,0-10.4-1.4-14.9-4.1l-1.1-0.6l-11,2.9L35,69.8l-0.7-1.1c-2.9-4.6-4.5-10-4.5-15.5C29.8,37,42.9,24,59,24
	c7.8,0,15.1,3,20.6,8.6c5.5,5.5,8.5,12.8,8.5,20.6C88.2,69.2,75.1,82.3,59,82.3 M75,60.5c-0.9-0.4-5.2-2.6-6-2.9
	c-0.8-0.3-1.4-0.4-2,0.4s-2.3,2.9-2.8,3.4c-0.5,0.6-1,0.7-1.9,0.2c-0.9-0.4-3.7-1.4-7.1-4.4c-2.6-2.3-4.4-5.2-4.9-6.1
	c-0.5-0.9-0.1-1.4,0.4-1.8c0.4-0.4,0.9-1,1.3-1.5c0.4-0.5,0.6-0.9,0.9-1.5c0.3-0.6,0.1-1.1-0.1-1.5c-0.2-0.4-2-4.8-2.7-6.5
	c-0.7-1.7-1.4-1.5-2-1.5c-0.5,0-1.1,0-1.7,0c-0.6,0-1.5,0.2-2.3,1.1c-0.8,0.9-3.1,3-3.1,7.3c0,4.3,3.1,8.5,3.6,9.1
	c0.4,0.6,6.2,9.4,15,13.2c2.1,0.9,3.7,1.4,5,1.8c2.1,0.7,4,0.6,5.5,0.3c1.7-0.3,5.2-2.1,5.9-4.2c0.7-2,0.7-3.8,0.5-4.2
	C76.5,61.1,75.9,60.9,75,60.5"></path></svg></span>
                  </a>
                  <a class="u-social-url" target="_blank" title="Instagram" href=""><span class="u-icon u-social-icon u-social-instagram u-icon-7"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 112 112" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-8c53"></use></svg><svg class="u-svg-content" viewBox="0 0 112 112" x="0" y="0" id="svg-8c53"><circle fill="currentColor" cx="56.1" cy="56.1" r="55"></circle><path fill="#FFFFFF" d="M55.9,38.2c-9.9,0-17.9,8-17.9,17.9C38,66,46,74,55.9,74c9.9,0,17.9-8,17.9-17.9C73.8,46.2,65.8,38.2,55.9,38.2
            z M55.9,66.4c-5.7,0-10.3-4.6-10.3-10.3c-0.1-5.7,4.6-10.3,10.3-10.3c5.7,0,10.3,4.6,10.3,10.3C66.2,61.8,61.6,66.4,55.9,66.4z"></path><path fill="#FFFFFF" d="M74.3,33.5c-2.3,0-4.2,1.9-4.2,4.2s1.9,4.2,4.2,4.2s4.2-1.9,4.2-4.2S76.6,33.5,74.3,33.5z"></path><path fill="#FFFFFF" d="M73.1,21.3H38.6c-9.7,0-17.5,7.9-17.5,17.5v34.5c0,9.7,7.9,17.6,17.5,17.6h34.5c9.7,0,17.5-7.9,17.5-17.5V38.8
            C90.6,29.1,82.7,21.3,73.1,21.3z M83,73.3c0,5.5-4.5,9.9-9.9,9.9H38.6c-5.5,0-9.9-4.5-9.9-9.9V38.8c0-5.5,4.5-9.9,9.9-9.9h34.5
            c5.5,0,9.9,4.5,9.9,9.9V73.3z"></path></svg></span>
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <h4 class="u-text u-text-4">Gihan Isharaka</h4>
      <h4 class="u-text u-text-5">Gayan Isharaka</h4>
    </section>
    <section class="u-clearfix u-white u-section-8" id="carousel_e423">
      <div class="u-clearfix u-sheet u-valign-middle-sm u-sheet-1">
        <h2 class="u-text u-text-grey-40 u-text-1"> Contact Us</h2>
        <h1 class="u-align-center-xs u-text u-text-2"> Contact For <span class="u-text-custom-color-2">Any Query</span>
        </h1>
        <div class="u-clearfix u-expanded-width u-layout-wrap u-layout-wrap-1">
          <div class="u-layout" style="">
            <div class="u-layout-row" style="">
              <div class="u-container-style u-layout-cell u-left-cell u-size-20 u-size-60-md u-layout-cell-1">
                <div class="u-container-layout u-container-layout-1">
                  <h3 class="u-text u-text-3">Get in touch</h3><span class="u-icon u-icon-rectangle u-text-black u-icon-1" data-animation-name="tada" data-animation-duration="1000" data-animation-delay="0" data-animation-direction="" data-href="./Contact" data-page-id="91808029"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 512 512" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-4e9a"></use></svg><svg class="u-svg-content" viewBox="0 0 512 512" id="svg-4e9a"><g><g><g><g><path d="m413.426 439.686h53.438c16.99 0 30.762-13.773 30.762-30.762v-90.156h-84.2z" fill="#ffd88f"></path><path d="m413.426 357.94h53.438c16.99 0 30.762-13.773 30.762-30.762v-90.156h-84.2z" fill="#ff7893"></path><path d="m413.426 276.194h53.438c16.99 0 30.762-13.773 30.762-30.762v-91.513h-84.2z" fill="#59a1a5"></path><path d="m413.426 193.092h53.435c16.991 0 30.764-13.772 30.764-30.76v-59.398c0-16.988-13.774-30.76-30.764-30.76h-53.435z" fill="#ff9e5e"></path>
</g><g><path d="m392.274 504.5h-275.444c-30.691 0-55.571-24.88-55.571-55.571v-385.858c0-30.691 24.88-55.57 55.571-55.57h275.444c30.691 0 55.571 24.88 55.571 55.571v385.858c0 30.69-24.88 55.57-55.571 55.57z" fill="#fff7e8"></path><path d="m392.274 7.5h-40c30.691 0 55.571 24.88 55.571 55.571v385.858c0 30.691-24.88 55.571-55.571 55.571h40c30.691 0 55.571-24.88 55.571-55.571v-385.857c0-30.692-24.88-55.572-55.571-55.572z" fill="#fff1d6"></path><g><path d="m116.834 7.5c-30.693 0-55.575 24.878-55.575 55.567v385.866c0 30.689 24.882 55.567 55.575 55.567h34.823v-497z" fill="#59a1a5"></path>
</g><g fill="#b5e8e0"><path d="m87.85 111.173h-52.85c-11.392 0-20.626-9.235-20.626-20.626 0-11.392 9.235-20.626 20.626-20.626h52.85c11.392 0 20.626 9.235 20.626 20.626 0 11.391-9.234 20.626-20.626 20.626z"></path><path d="m87.85 221.476h-52.85c-11.391 0-20.626-9.235-20.626-20.626 0-11.392 9.235-20.627 20.627-20.627h52.85c11.392 0 20.626 9.235 20.626 20.626-.001 11.392-9.235 20.627-20.627 20.627z"></path><path d="m87.85 331.778h-52.85c-11.391 0-20.626-9.235-20.626-20.626 0-11.392 9.235-20.627 20.627-20.627h52.85c11.392 0 20.626 9.235 20.626 20.626-.001 11.392-9.235 20.627-20.627 20.627z"></path><path d="m87.85 442.08h-52.85c-11.391 0-20.626-9.235-20.626-20.626 0-11.392 9.235-20.626 20.627-20.626h52.85c11.392 0 20.626 9.235 20.626 20.626-.001 11.392-9.235 20.626-20.627 20.626z"></path>
</g><g fill="#97dbd1"><path d="m87.85 69.92h-40c11.392 0 20.626 9.235 20.626 20.626s-9.235 20.626-20.626 20.626h40c11.392 0 20.626-9.235 20.626-20.626s-9.234-20.626-20.626-20.626z"></path><path d="m87.85 180.223h-40c11.392 0 20.626 9.235 20.626 20.626 0 11.392-9.235 20.626-20.626 20.626h40c11.392 0 20.626-9.235 20.626-20.626.001-11.391-9.234-20.626-20.626-20.626z"></path><path d="m87.85 290.525h-40c11.392 0 20.626 9.235 20.626 20.626 0 11.392-9.235 20.626-20.626 20.626h40c11.392 0 20.626-9.235 20.626-20.626.001-11.391-9.234-20.626-20.626-20.626z"></path><path d="m87.85 400.828h-40c11.392 0 20.626 9.235 20.626 20.626 0 11.392-9.235 20.626-20.626 20.626h40c11.392 0 20.626-9.235 20.626-20.626.001-11.392-9.234-20.626-20.626-20.626z"></path>
</g>
</g>
</g>
</g><g><path d="m466.862 64.674h-11.517c.379-34.865-27.804-64.674-63.071-64.674h-240.445c-.029 0-.057.004-.086.004s-.057-.004-.086-.004h-34.823c-34.563 0-62.709 27.943-63.059 62.421h-18.775c-15.509 0-28.126 12.617-28.126 28.126s12.617 28.126 28.126 28.126h18.759v54.05h-18.759c-15.509 0-28.126 12.618-28.126 28.127s12.617 28.126 28.126 28.126h18.759v54.05h-18.759c-15.509 0-28.126 12.618-28.126 28.127s12.617 28.125 28.126 28.125h18.759v54.05h-18.759c-15.509 0-28.126 12.617-28.126 28.126s12.617 28.126 28.126 28.126h18.776c.35 34.477 28.496 62.42 63.058 62.42h34.823c.029 0 .057-.004.086-.004s.057.004.086.004h240.445c35.376 0 63.441-29.886 63.071-64.813h11.519c21.098 0 38.262-17.165 38.262-38.263v-305.99c0-21.097-17.165-38.26-38.264-38.26zm23.264 262.504c0 12.827-10.436 23.263-23.262 23.263h-11.519v-66.746h11.519c8.746 0 16.811-2.956 23.262-7.913zm0-81.746c0 12.827-10.436 23.263-23.262 23.263h-11.519v-68.103h11.517c8.747 0 16.812-2.956 23.265-7.913v52.753zm-23.264-165.758c12.828 0 23.265 10.435 23.265 23.26v59.398c0 12.825-10.437 23.26-23.265 23.26h-11.517v-105.918zm-444.988 10.873c0-7.237 5.889-13.126 13.126-13.126h52.85c7.238 0 13.126 5.889 13.126 13.126s-5.888 13.126-13.126 13.126h-52.85c-7.238 0-13.126-5.889-13.126-13.126zm0 110.303c0-7.238 5.889-13.127 13.126-13.127h52.85c7.238 0 13.126 5.889 13.126 13.127 0 7.237-5.888 13.126-13.126 13.126h-52.85c-7.238 0-13.126-5.889-13.126-13.126zm0 110.302c0-7.238 5.889-13.127 13.126-13.127h52.85c7.238 0 13.126 5.889 13.126 13.126 0 7.238-5.888 13.127-13.126 13.127h-52.85c-7.238 0-13.126-5.888-13.126-13.126zm0 110.302c0-7.237 5.889-13.126 13.126-13.126h52.85c7.238 0 13.126 5.889 13.126 13.126s-5.888 13.126-13.126 13.126h-52.85c-7.238 0-13.126-5.889-13.126-13.126zm444.99 10.733h-11.519v-10.732c0-9.697-15-9.697-15 0v27.476c0 26.506-21.564 48.07-48.071 48.07h-233.118v-385.828c0-9.697-15-9.697-15 0v385.827h-27.323c-26.291 0-47.709-21.214-48.058-47.42h19.075c15.509 0 28.126-12.617 28.126-28.126s-12.617-28.126-28.126-28.126h-19.091v-54.05h19.091c15.509 0 28.126-12.618 28.126-28.127s-12.617-28.126-28.126-28.126h-19.091v-54.05h19.091c15.509 0 28.126-12.617 28.126-28.126s-12.617-28.127-28.126-28.127h-19.091v-54.05h19.091c15.509 0 28.126-12.617 28.126-28.126s-12.617-28.125-28.126-28.125h-19.075c.349-26.207 21.767-47.421 48.059-47.421h27.323v57.174c0 9.697 15 9.697 15 0v-57.174h233.118c26.506 0 48.071 21.564 48.071 48.071v319.467c0 9.697 15 9.697 15 0v-17.098h11.519c8.746 0 16.811-2.956 23.262-7.913v51.397c-.001 12.827-10.436 23.263-23.263 23.263z"></path><path d="m335.478 206.883c13.655-11.534 21.927-28.728 21.927-47.036 0-33.901-27.584-61.482-61.491-61.482-33.906 0-61.49 27.581-61.49 61.482 0 18.309 8.271 35.502 21.927 47.036-32.468 15.161-54.068 48.142-54.068 84.85 0 9.697 15 9.697 15 0 0-35.257 23.725-66.418 57.695-75.779 6.577-1.813 7.371-11.118 1.196-14.019-16.25-7.635-26.75-24.154-26.75-42.088 0-25.631 20.855-46.482 46.49-46.482s46.491 20.852 46.491 46.482c0 17.934-10.5 34.453-26.75 42.088-6.174 2.901-5.381 12.206 1.196 14.019 33.97 9.361 57.695 40.522 57.695 75.779 0 9.697 15 9.697 15 0 0-36.709-21.599-69.689-54.068-84.85z"></path><path d="m382.046 349.019h-172.263c-9.697 0-9.697 15 0 15h172.263c9.697 0 9.697-15 0-15z"></path><path d="m351.909 398.496h-111.989c-9.697 0-9.697 15 0 15h111.989c9.697 0 9.697-15 0-15z"></path>
</g>
</g></svg></span>
                </div>
              </div>
              <div class="u-container-style u-layout-cell u-size-20-lg u-size-20-xl u-size-21-sm u-size-21-xs u-size-60-md u-layout-cell-2">
                <div class="u-container-layout u-container-layout-2">
                  <h6 class="u-text u-text-4">call us</h6>
                  <a href="tel:+94 703644626" class="u-active-none u-btn u-btn-rectangle u-button-style u-hover-none u-none u-radius-0 u-text-body-color u-text-hover-palette-2-base u-btn-1"><span class="u-icon"><svg class="u-svg-content" viewBox="0 0 405.333 405.333" x="0px" y="0px" style="width: 1em; height: 1em;"><path d="M373.333,266.88c-25.003,0-49.493-3.904-72.704-11.563c-11.328-3.904-24.192-0.896-31.637,6.699l-46.016,34.752    c-52.8-28.181-86.592-61.952-114.389-114.368l33.813-44.928c8.512-8.512,11.563-20.971,7.915-32.64    C142.592,81.472,138.667,56.96,138.667,32c0-17.643-14.357-32-32-32H32C14.357,0,0,14.357,0,32    c0,205.845,167.488,373.333,373.333,373.333c17.643,0,32-14.357,32-32V298.88C405.333,281.237,390.976,266.88,373.333,266.88z"></path></svg><img></span>&nbsp; +94 703644626
                  </a>
                  <a href="tel:+94 777780071" class="u-active-none u-btn u-button-style u-hover-none u-none u-text-black u-text-hover-palette-2-base u-btn-2"><span class="u-icon u-text-palette-4-base u-icon-3"><svg class="u-svg-content" viewBox="0 0 512 512" x="0px" y="0px" style="width: 1em; height: 1em;"><path style="fill:currentColor;" d="M256,0C114.617,0,0,114.617,0,256c0,52.03,15.563,100.414,42.231,140.818L0,512l119.128-39.706  C158.72,497.399,205.639,512,256,512c141.383,0,256-114.617,256-256S397.383,0,256,0z"></path><path style="fill:#FFFFFF;" d="M397.233,335.078V377.6c0.062,15.66-12.606,28.398-28.292,28.469c-0.892,0-1.783-0.035-2.675-0.115  c-43.705-4.74-85.689-19.641-122.571-43.52c-34.313-21.76-63.409-50.803-85.222-85.054c-24.002-36.979-38.938-79.086-43.599-122.898  c-1.412-15.59,10.108-29.378,25.732-30.791c0.847-0.062,1.686-0.106,2.534-0.106h42.611c14.257-0.141,26.412,10.293,28.407,24.382  c1.801,13.612,5.138,26.968,9.94,39.83c3.902,10.364,1.404,22.042-6.391,29.908l-18.035,17.999  c20.215,35.487,49.664,64.874,85.221,85.054l18.035-17.999c7.883-7.786,19.588-10.275,29.97-6.382  c12.888,4.802,26.271,8.13,39.91,9.922C387.09,308.312,397.594,320.689,397.233,335.078z"></path></svg><img></span>&nbsp;+94 777780071
                  </a>
                  <h6 class="u-text u-text-5">Address</h6>
                  <p class="u-text u-text-6"></p><span class="u-icon u-icon-circle u-icon-4"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 52 52" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-057d"></use></svg><svg class="u-svg-content" viewBox="0 0 52 52" x="0px" y="0px" id="svg-057d" style="enable-background:new 0 0 52 52;"><path style="fill:currentColor;" d="M38.853,5.324L38.853,5.324c-7.098-7.098-18.607-7.098-25.706,0h0
	C6.751,11.72,6.031,23.763,11.459,31L26,52l14.541-21C45.969,23.763,45.249,11.72,38.853,5.324z M26.177,24c-3.314,0-6-2.686-6-6
	s2.686-6,6-6s6,2.686,6,6S29.491,24,26.177,24z"></path></svg></span>
                  <p class="u-text u-text-7"> NO 163,Mugulugampala,Mirigama</p>
                  <h6 class="u-text u-text-8">Email us</h6>
                  <a href="https://mail.google.com/mail/u/0/#sent?compose=new" class="u-border-1 u-border-active-palette-2-base u-border-hover-palette-1-base u-btn u-button-style u-none u-text-palette-1-base u-btn-3" target="_blank">gihan.isharaka@gmail.com</a><span class="u-icon u-icon-circle u-text-palette-1-base u-icon-5"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 512 512" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-ed1a"></use></svg><svg class="u-svg-content" viewBox="0 0 512 512" x="0px" y="0px" id="svg-ed1a" style="enable-background:new 0 0 512 512;"><rect x="64" y="64" style="fill:#ECEFF1;" width="384" height="384"></rect><polygon style="fill:#CFD8DC;" points="256,296.384 448,448 448,148.672 "></polygon><path style="fill:#F44336;" d="M464,64h-16L256,215.616L64,64H48C21.504,64,0,85.504,0,112v288c0,26.496,21.504,48,48,48h16V148.672  l192,147.68L448,148.64V448h16c26.496,0,48-21.504,48-48V112C512,85.504,490.496,64,464,64z"></path></svg></span>
                  <h6 class="u-text u-text-9">follow us</h6>
                  <div class="u-social-icons u-spacing-10 u-social-icons-1">
                    <a class="u-social-url" title="facebook" target="_blank" href="https://www.facebook.com/Henry-Bakers-100880608799532/"><span class="u-icon u-social-facebook u-social-icon u-icon-6"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 112 112" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-1331"></use></svg><svg class="u-svg-content" viewBox="0 0 112 112" x="0" y="0" id="svg-1331"><path fill="currentColor" d="M75.5,28.8H65.4c-1.5,0-4,0.9-4,4.3v9.4h13.9l-1.5,15.8H61.4v45.1H42.8V58.3h-8.8V42.4h8.8V32.2
c0-7.4,3.4-18.8,18.8-18.8h13.8v15.4H75.5z"></path></svg></span>
                    </a>
                    <a class="u-social-url" title="twitter" target="_blank" href="https://twitter.com/name"><span class="u-icon u-social-icon u-social-twitter u-icon-7"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 112 112" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-40d7"></use></svg><svg class="u-svg-content" viewBox="0 0 112 112" x="0" y="0" id="svg-40d7"><path fill="currentColor" d="M92.2,38.2c0,0.8,0,1.6,0,2.3c0,24.3-18.6,52.4-52.6,52.4c-10.6,0.1-20.2-2.9-28.5-8.2
	c1.4,0.2,2.9,0.2,4.4,0.2c8.7,0,16.7-2.9,23-7.9c-8.1-0.2-14.9-5.5-17.3-12.8c1.1,0.2,2.4,0.2,3.4,0.2c1.6,0,3.3-0.2,4.8-0.7
	c-8.4-1.6-14.9-9.2-14.9-18c0-0.2,0-0.2,0-0.2c2.5,1.4,5.4,2.2,8.4,2.3c-5-3.3-8.3-8.9-8.3-15.4c0-3.4,1-6.5,2.5-9.2
	c9.1,11.1,22.7,18.5,38,19.2c-0.2-1.4-0.4-2.8-0.4-4.3c0.1-10,8.3-18.2,18.5-18.2c5.4,0,10.1,2.2,13.5,5.7c4.3-0.8,8.1-2.3,11.7-4.5
	c-1.4,4.3-4.3,7.9-8.1,10.1c3.7-0.4,7.3-1.4,10.6-2.9C98.9,32.3,95.7,35.5,92.2,38.2z"></path></svg></span>
                    </a>
                    <a class="u-social-url" title="instagram" target="_blank" href="https://instagram.com/name"><span class="u-icon u-social-icon u-social-instagram u-icon-8"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 112 112" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-3918"></use></svg><svg class="u-svg-content" viewBox="0 0 112 112" x="0" y="0" id="svg-3918"><path fill="currentColor" d="M55.9,32.9c-12.8,0-23.2,10.4-23.2,23.2s10.4,23.2,23.2,23.2s23.2-10.4,23.2-23.2S68.7,32.9,55.9,32.9z
	 M55.9,69.4c-7.4,0-13.3-6-13.3-13.3c-0.1-7.4,6-13.3,13.3-13.3s13.3,6,13.3,13.3C69.3,63.5,63.3,69.4,55.9,69.4z"></path><path fill="#FFFFFF" d="M79.7,26.8c-3,0-5.4,2.5-5.4,5.4s2.5,5.4,5.4,5.4c3,0,5.4-2.5,5.4-5.4S82.7,26.8,79.7,26.8z"></path><path fill="currentColor" d="M78.2,11H33.5C21,11,10.8,21.3,10.8,33.7v44.7c0,12.6,10.2,22.8,22.7,22.8h44.7c12.6,0,22.7-10.2,22.7-22.7
	V33.7C100.8,21.1,90.6,11,78.2,11z M91,78.4c0,7.1-5.8,12.8-12.8,12.8H33.5c-7.1,0-12.8-5.8-12.8-12.8V33.7
	c0-7.1,5.8-12.8,12.8-12.8h44.7c7.1,0,12.8,5.8,12.8,12.8V78.4z"></path></svg></span>
                    </a>
                  </div>
                </div>
              </div>
              <div class="u-container-style u-custom-color-2 u-layout-cell u-right-cell u-size-19-sm u-size-19-xs u-size-20-lg u-size-20-xl u-size-60-md u-layout-cell-3">
                <div class="u-container-layout u-valign-top u-container-layout-3">
                  <div class="u-expanded-width u-form u-form-1">
                    <form action="#" method="POST" class="u-clearfix u-form-spacing-10 u-form-vertical u-inner-form" style="padding: 0;" source="custom" name="form">
                      <div class="u-form-group u-form-name">
                        <label for="name-daf4" class="u-form-control-hidden u-label">Name</label>
                        <input type="text" placeholder="Enter your Name" id="name-daf4" name="name" class="u-input u-input-rectangle u-white" required="">
                      </div>
                      <div class="u-form-email u-form-group">
                        <label for="email-daf4" class="u-form-control-hidden u-label">Email</label>
                        <input type="email" placeholder="Enter a valid email address" id="email-daf4" name="email" class="u-input u-input-rectangle u-white" required="">
                      </div>
                      <div class="u-form-group u-form-message">
                        <label for="message-daf4" class="u-form-control-hidden u-label">Message</label>
                        <textarea placeholder="" rows="4" cols="50" id="message-daf4" name="message" class="u-input u-input-rectangle u-white" required=""></textarea>
                      </div>
                      <div class="u-align-left u-form-group u-form-submit">
                        <a href="#" class="u-active-palette-2-base u-black u-border-none u-btn u-btn-submit u-button-style u-hover-custom-color-1 u-btn-4">Submit</a>
                        <input type="submit" value="submit" class="u-form-control-hidden">
                      </div>
                      <div class="u-form-send-message u-form-send-success"> Thank you! Your message has been sent. </div>
                      <div class="u-form-send-error u-form-send-message"> Unable to send your message. Please fix errors then try again. </div>
                      <input type="hidden" value="" name="recaptchaResponse">
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    
    <footer class="u-clearfix u-footer u-grey-80" id="sec-a3b0"><div class="u-clearfix u-sheet u-sheet-1">
        <h6 class="u-text u-text-custom-color-2 u-text-1">
          <span style="font-size: 1.125rem;">Our Address</span><i></i>
          <br><i></i>
        </h6>
        <h6 class="u-text u-text-custom-color-2 u-text-2">
          <span style="font-size: 1.125rem;"> Quick Links</span><i></i>
          <br><i></i>
        </h6><span class="u-black u-icon u-icon-circle u-spacing-7 u-text-custom-color-2 u-icon-1"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 512 512" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-0b61"></use></svg><svg class="u-svg-content" viewBox="0 0 512 512" x="0px" y="0px" id="svg-0b61" style="enable-background:new 0 0 512 512;"><g><g><path d="M498.682,435.326L297.917,234.56L63.357,0H45.026l-3.743,9.511c-9.879,25.104-14.1,50.78-12.205,74.249    c2.16,26.752,12.323,49.913,29.392,66.982L241.58,333.852l24.152-24.152l169.285,189.293c16.84,16.84,45.825,17.84,63.665,0    C516.236,481.439,516.236,452.879,498.682,435.326z"></path>
</g>
</g><g><g><path d="M156.728,291.442L13.317,434.853c-17.552,17.552-17.552,46.113,0,63.665c16.674,16.674,45.519,18.146,63.665,0    l143.412-143.412L156.728,291.442z"></path>
</g>
</g><g><g><path d="M490.253,85.249l-81.351,81.35l-21.223-21.222l81.351-81.351l-21.222-21.222l-81.35,81.35l-21.222-21.222l81.351-81.35    L405.366,0.361L299.256,106.471c-12.981,12.981-20.732,30.217-21.828,48.535c-0.277,4.641-1.329,9.206-3.074,13.548l68.929,68.929    c4.342-1.747,8.908-2.798,13.548-3.075c18.318-1.093,35.554-8.846,48.535-21.827l106.11-106.109L490.253,85.249z"></path>
</g>
</g></svg></span>
        <a href="tel:+94 703644626" class="u-active-none u-btn u-btn-rectangle u-button-style u-hover-none u-none u-radius-0 u-text-custom-color-1 u-text-hover-palette-2-base u-btn-1"><span class="u-icon"><svg class="u-svg-content" viewBox="0 0 405.333 405.333" x="0px" y="0px" style="width: 1em; height: 1em;"><path d="M373.333,266.88c-25.003,0-49.493-3.904-72.704-11.563c-11.328-3.904-24.192-0.896-31.637,6.699l-46.016,34.752    c-52.8-28.181-86.592-61.952-114.389-114.368l33.813-44.928c8.512-8.512,11.563-20.971,7.915-32.64    C142.592,81.472,138.667,56.96,138.667,32c0-17.643-14.357-32-32-32H32C14.357,0,0,14.357,0,32    c0,205.845,167.488,373.333,373.333,373.333c17.643,0,32-14.357,32-32V298.88C405.333,281.237,390.976,266.88,373.333,266.88z"></path></svg><img></span>
          <span style="font-size: 0.75rem;">&nbsp; +94 703644626</span>
        </a>
        <a href="tel:+94 777780071" class="u-active-none u-btn u-button-style u-hover-none u-none u-text-custom-color-1 u-text-hover-palette-2-base u-btn-2"><span class="u-icon u-text-palette-4-base u-icon-3"><svg class="u-svg-content" viewBox="0 0 512 512" x="0px" y="0px" style="width: 1em; height: 1em;"><path style="fill:currentColor;" d="M256,0C114.617,0,0,114.617,0,256c0,52.03,15.563,100.414,42.231,140.818L0,512l119.128-39.706  C158.72,497.399,205.639,512,256,512c141.383,0,256-114.617,256-256S397.383,0,256,0z"></path><path style="fill:#FFFFFF;" d="M397.233,335.078V377.6c0.062,15.66-12.606,28.398-28.292,28.469c-0.892,0-1.783-0.035-2.675-0.115  c-43.705-4.74-85.689-19.641-122.571-43.52c-34.313-21.76-63.409-50.803-85.222-85.054c-24.002-36.979-38.938-79.086-43.599-122.898  c-1.412-15.59,10.108-29.378,25.732-30.791c0.847-0.062,1.686-0.106,2.534-0.106h42.611c14.257-0.141,26.412,10.293,28.407,24.382  c1.801,13.612,5.138,26.968,9.94,39.83c3.902,10.364,1.404,22.042-6.391,29.908l-18.035,17.999  c20.215,35.487,49.664,64.874,85.221,85.054l18.035-17.999c7.883-7.786,19.588-10.275,29.97-6.382  c12.888,4.802,26.271,8.13,39.91,9.922C387.09,308.312,397.594,320.689,397.233,335.078z"></path></svg><img></span>&nbsp;+94 777<span style="font-size: 0.75rem;"></span>780071
        </a>
        <ul class="u-custom-list u-indent-0 u-spacing-0 u-text u-text-3">
          <li>
            <div class="class u-list-icon u-list-icon-1">
              <svg class="u-svg-content" viewBox="0 0 448.011 448.011" id="svg-e652"><path d="m438.731 209.463-416-192c-6.624-3.008-14.528-1.216-19.136 4.48-4.64 5.696-4.8 13.792-.384 19.648l136.8 182.4-136.8 182.4c-4.416 5.856-4.256 13.984.352 19.648 3.104 3.872 7.744 5.952 12.448 5.952 2.272 0 4.544-.48 6.688-1.472l416-192c5.696-2.624 9.312-8.288 9.312-14.528s-3.616-11.904-9.28-14.528z" fill="currentColor"></path></svg>
            </div>
            <span style="font-size: 0.75rem;">Terms of use</span>
          </li>
          <li>
            <div class="class u-list-icon u-list-icon-2">
              <svg class="u-svg-content" viewBox="0 0 448.011 448.011" id="svg-e652"><path d="m438.731 209.463-416-192c-6.624-3.008-14.528-1.216-19.136 4.48-4.64 5.696-4.8 13.792-.384 19.648l136.8 182.4-136.8 182.4c-4.416 5.856-4.256 13.984.352 19.648 3.104 3.872 7.744 5.952 12.448 5.952 2.272 0 4.544-.48 6.688-1.472l416-192c5.696-2.624 9.312-8.288 9.312-14.528s-3.616-11.904-9.28-14.528z" fill="currentColor"></path></svg>
            </div>
            <span style="font-size: 0.75rem;">Privacy policy</span>
          </li>
          <li>
            <div class="class u-list-icon u-list-icon-3">
              <svg class="u-svg-content" viewBox="0 0 448.011 448.011" id="svg-e652"><path d="m438.731 209.463-416-192c-6.624-3.008-14.528-1.216-19.136 4.48-4.64 5.696-4.8 13.792-.384 19.648l136.8 182.4-136.8 182.4c-4.416 5.856-4.256 13.984.352 19.648 3.104 3.872 7.744 5.952 12.448 5.952 2.272 0 4.544-.48 6.688-1.472l416-192c5.696-2.624 9.312-8.288 9.312-14.528s-3.616-11.904-9.28-14.528z" fill="currentColor"></path></svg>
            </div>
            <span style="font-size: 0.75rem;">Cookies</span>
          </li>
          <li>
            <div class="class u-list-icon u-list-icon-1">
              <svg class="u-svg-content" viewBox="0 0 448.011 448.011" id="svg-e652"><path d="m438.731 209.463-416-192c-6.624-3.008-14.528-1.216-19.136 4.48-4.64 5.696-4.8 13.792-.384 19.648l136.8 182.4-136.8 182.4c-4.416 5.856-4.256 13.984.352 19.648 3.104 3.872 7.744 5.952 12.448 5.952 2.272 0 4.544-.48 6.688-1.472l416-192c5.696-2.624 9.312-8.288 9.312-14.528s-3.616-11.904-9.28-14.528z" fill="currentColor"></path></svg>
            </div>
            <span style="font-size: 0.75rem;">Helps</span>
          </li>
        </ul><span class="u-icon u-icon-circle u-text-palette-1-base u-icon-4"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 512 512" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-3b60"></use></svg><svg class="u-svg-content" viewBox="0 0 512 512" x="0px" y="0px" id="svg-3b60" style="enable-background:new 0 0 512 512;"><rect x="64" y="64" style="fill:#ECEFF1;" width="384" height="384"></rect><polygon style="fill:#CFD8DC;" points="256,296.384 448,448 448,148.672 "></polygon><path style="fill:#F44336;" d="M464,64h-16L256,215.616L64,64H48C21.504,64,0,85.504,0,112v288c0,26.496,21.504,48,48,48h16V148.672  l192,147.68L448,148.64V448h16c26.496,0,48-21.504,48-48V112C512,85.504,490.496,64,464,64z"></path></svg></span>
        <a href="mailto:gihan.isharaka@gmail.com?subject=Comment" class="u-border-1 u-border-active-palette-2-base u-border-hover-palette-1-base u-btn u-button-style u-none u-text-palette-1-base u-btn-3" target="_blank">gihan.isharaka@gmail.com</a><span class="u-icon u-icon-circle u-icon-5"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 52 52" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-ea51"></use></svg><svg class="u-svg-content" viewBox="0 0 52 52" x="0px" y="0px" id="svg-ea51" style="enable-background:new 0 0 52 52;"><path style="fill:currentColor;" d="M38.853,5.324L38.853,5.324c-7.098-7.098-18.607-7.098-25.706,0h0
	C6.751,11.72,6.031,23.763,11.459,31L26,52l14.541-21C45.969,23.763,45.249,11.72,38.853,5.324z M26.177,24c-3.314,0-6-2.686-6-6
	s2.686-6,6-6s6,2.686,6,6S29.491,24,26.177,24z"></path></svg></span>
        <p class="u-text u-text-4"> NO 163,Mugulugam​pala,Mirigama</p>
        <div class="u-social-icons u-spacing-10 u-social-icons-1">
          <a class="u-social-url" title="facebook" target="_blank" href="https://www.facebook.com/Henry-Bakers-100880608799532/"><span class="u-icon u-social-facebook u-social-icon u-icon-6"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 112 112" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-154e"></use></svg><svg class="u-svg-content" viewBox="0 0 112 112" x="0" y="0" id="svg-154e"><path fill="currentColor" d="M75.5,28.8H65.4c-1.5,0-4,0.9-4,4.3v9.4h13.9l-1.5,15.8H61.4v45.1H42.8V58.3h-8.8V42.4h8.8V32.2
c0-7.4,3.4-18.8,18.8-18.8h13.8v15.4H75.5z"></path></svg></span>
          </a>
          <a class="u-social-url" title="twitter" target="_blank" href="https://twitter.com/name"><span class="u-icon u-social-icon u-social-twitter u-icon-7"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 112 112" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-28fc"></use></svg><svg class="u-svg-content" viewBox="0 0 112 112" x="0" y="0" id="svg-28fc"><path fill="currentColor" d="M92.2,38.2c0,0.8,0,1.6,0,2.3c0,24.3-18.6,52.4-52.6,52.4c-10.6,0.1-20.2-2.9-28.5-8.2
	c1.4,0.2,2.9,0.2,4.4,0.2c8.7,0,16.7-2.9,23-7.9c-8.1-0.2-14.9-5.5-17.3-12.8c1.1,0.2,2.4,0.2,3.4,0.2c1.6,0,3.3-0.2,4.8-0.7
	c-8.4-1.6-14.9-9.2-14.9-18c0-0.2,0-0.2,0-0.2c2.5,1.4,5.4,2.2,8.4,2.3c-5-3.3-8.3-8.9-8.3-15.4c0-3.4,1-6.5,2.5-9.2
	c9.1,11.1,22.7,18.5,38,19.2c-0.2-1.4-0.4-2.8-0.4-4.3c0.1-10,8.3-18.2,18.5-18.2c5.4,0,10.1,2.2,13.5,5.7c4.3-0.8,8.1-2.3,11.7-4.5
	c-1.4,4.3-4.3,7.9-8.1,10.1c3.7-0.4,7.3-1.4,10.6-2.9C98.9,32.3,95.7,35.5,92.2,38.2z"></path></svg></span>
          </a>
          <a class="u-social-url" title="instagram" target="_blank" href="https://instagram.com/name"><span class="u-icon u-social-icon u-social-instagram u-icon-8"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 112 112" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-4650"></use></svg><svg class="u-svg-content" viewBox="0 0 112 112" x="0" y="0" id="svg-4650"><path fill="currentColor" d="M55.9,32.9c-12.8,0-23.2,10.4-23.2,23.2s10.4,23.2,23.2,23.2s23.2-10.4,23.2-23.2S68.7,32.9,55.9,32.9z
	 M55.9,69.4c-7.4,0-13.3-6-13.3-13.3c-0.1-7.4,6-13.3,13.3-13.3s13.3,6,13.3,13.3C69.3,63.5,63.3,69.4,55.9,69.4z"></path><path fill="#FFFFFF" d="M79.7,26.8c-3,0-5.4,2.5-5.4,5.4s2.5,5.4,5.4,5.4c3,0,5.4-2.5,5.4-5.4S82.7,26.8,79.7,26.8z"></path><path fill="currentColor" d="M78.2,11H33.5C21,11,10.8,21.3,10.8,33.7v44.7c0,12.6,10.2,22.8,22.7,22.8h44.7c12.6,0,22.7-10.2,22.7-22.7
	V33.7C100.8,21.1,90.6,11,78.2,11z M91,78.4c0,7.1-5.8,12.8-12.8,12.8H33.5c-7.1,0-12.8-5.8-12.8-12.8V33.7
	c0-7.1,5.8-12.8,12.8-12.8h44.7c7.1,0,12.8,5.8,12.8,12.8V78.4z"></path></svg></span>
          </a>
        </div>
      </div></footer><span style="height: 64px; width: 64px; margin-left: 0px; margin-right: auto; margin-top: 0px; background-image: none; right: 10px; bottom: 10px;" class="u-back-to-top u-border-2 u-border-palette-2-base u-icon u-icon-circle u-opacity u-opacity-95 u-spacing-10 u-text-palette-2-base" data-href="#">
        <svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 551.13 551.13"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-1d98"></use></svg>
        <svg class="u-svg-content" enable-background="new 0 0 551.13 551.13" viewBox="0 0 551.13 551.13" xmlns="http://www.w3.org/2000/svg" id="svg-1d98" data-color="rgb(71, 138, 201)"><path d="m275.565 189.451 223.897 223.897h51.668l-275.565-275.565-275.565 275.565h51.668z"></path></svg>
    </span>
  </body>
</html>