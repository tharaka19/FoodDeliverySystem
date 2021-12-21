<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import= "com.Entity.ShoppingCart" import= "com.Entity.Customer" import="java.util.List"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>        
<!DOCTYPE html>
<html style="font-size: 16px;">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="HENRY BAKERS">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <title>About</title>
    
    <link rel="stylesheet" href="resources/admin/css/nicepage.css" media="screen">
    <link rel="stylesheet" href="resources/admin/css/About.css" media="screen">
    
    <script class="u-script" type="text/javascript" src="resources/admin/js/jquery.js" ></script>
    <script class="u-script" type="text/javascript" src="resources/admin/js/nicepage.js" ></script>
    
    <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">
    
    
    
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
    <meta name="twitter:title" content="About">
    <meta name="twitter:description" content="Site4">
    <meta property="og:title" content="About">
    <meta property="og:description" content="">
    <meta property="og:type" content="website">
    
    <% 
        float foodItemSubTotal = 0;
        int foodItemCount = 0;
     	if(session.getAttribute("foodItemCart") == null) {

     	}else{
     		 List<ShoppingCart> foodItemCartList = (List<ShoppingCart>) session.getAttribute("foodItemCart");
        
             for(int a = 0; a < foodItemCartList.size(); a++){
            	 foodItemSubTotal = foodItemSubTotal + foodItemCartList.get(a).getFoodItemTotal();
            	 foodItemCount = foodItemCount + 1;
             }
     	}
     %>
     
     <% 
        float promoSubTotal = 0;
     	float totalDiscount = 0;
     	int promoCount = 0;
     	if(session.getAttribute("promoCart") == null) {

     	}else{
     		 List<ShoppingCart> promoCartList = (List<ShoppingCart>) session.getAttribute("promoCart");
        
             for(int a = 0; a < promoCartList.size(); a++){
            	 promoSubTotal = promoSubTotal + promoCartList.get(a).getPromoTotal();
            	 totalDiscount = totalDiscount + promoCartList.get(a).getPromoTotalDiscount();
            	 promoCount = promoCount +1;
             }
     	}
     %>
    
  </head>
  <body class="u-body u-overlap"><header class=" u-clearfix u-header u-section-row-container" id="sec-8947"><div class="u-section-rows" style="margin-bottom: 0px;">
        
        
        
        
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
        <span class="u-icon-circle u-palette-1-base u-shopping-cart-count" style="font-size: 0.75rem;"><!--shopping_cart_count--><%out.print(foodItemCount + promoCount);%><!--/shopping_cart_count--></span>
    </span>
            </a><!--/shopping_cart-->
          </div>
          
          
          
          
          
        </div>
      </div></header>
    <section class="u-clearfix u-image u-parallax u-section-1" id="carousel_165a" data-image-width="1280" data-image-height="853">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-clearfix u-expanded-width u-gutter-30 u-layout-wrap u-layout-wrap-1">
          <div class="u-layout">
            <div class="u-layout-row">
              <div class="u-align-left u-container-style u-layout-cell u-left-cell u-size-22 u-layout-cell-1">
                <div class="u-container-layout u-container-layout-1">
                  <h1 class="u-text u-text-custom-color-2 u-text-default u-text-1"> About Us</h1>
                  <h2 class="u-text u-text-custom-color-1 u-text-default u-text-2">HOME / ABOUT US</h2>
                </div>
              </div>
              <div class="u-container-style u-layout-cell u-right-cell u-size-38 u-layout-cell-2">
                <div class="u-container-layout">
                  <div class="u-container-style u-effect-hover-zoomOut u-group u-image-tiles u-group-1">
                    <div class="u-background-effect u-expanded">
                      <div class="u-background-effect-image u-expanded u-image u-image-tiles u-image-1"></div>
                    </div>
                    <div class="u-container-layout u-container-layout-3">
                      <img class="u-image u-image-2" src="<spring:url value="/resources/admin/css/images/cvvv.jpg"/>" data-image-width="800" data-image-height="533" data-animation-name="zoomIn" data-animation-duration="1000" data-animation-delay="0" data-animation-direction="">
                    </div>
                  </div>
                </div>
              </div>
            </div>
        </div>
      </div>
    </section>
    <section class="u-black u-clearfix u-section-2" id="sec-488a">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-clearfix u-expanded-width u-gutter-0 u-layout-spacing-vertical u-layout-wrap u-layout-wrap-1">
          <div class="u-layout">
            <div class="u-layout-row">
              <div class="u-align-left u-container-style u-custom-color-1 u-layout-cell u-left-cell u-size-60 u-layout-cell-1">
                <div class="u-container-layout u-container-layout-1">
                  <h2 class="u-text u-text-black u-text-1">About Us</h2>
                  <p class="u-text u-text-2"> Cooking Since <span class="u-text-custom-color-2">2009</span>
                  </p>
                  <p class="u-text u-text-3"> Henry Bakers is  a cafe and a retail bakery located in Meerigama Sri Lanka.The plan of Henry Bakers is to attain and maintin the intrest of its customers with the broad vaeiety of snacks,cakes ,pastry,submarine buns ,burger  and pizza.It will build strong position in the city by offering its products at a competitive price and quality products.<br>
                    <br>Our range delivered to your door and can be purchased online! Purchase our delicious Cakes and snacks and we will make offers on your demand. We also provide some of celebration meal and our uniqueness designs to-order online..<br>
                    <br>Thank you <br>Henry bakers
                  </p>
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
      </div></footer>
  </body>
</html>