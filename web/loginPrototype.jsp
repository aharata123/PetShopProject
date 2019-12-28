<%-- 
    Document   : login
    Created on : Jun 8, 2019, 1:58:35 AM
    Author     : LEGION
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
     <link href="myfolder/user/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="myfolder/user/js/jquery.min.js"></script>
<!-- Custom Theme files -->
<link href="myfolder/user/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="myfolder/user/css/demo1.css" rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--webfont-->
<link href='http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz:400,200,300,700' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900,200italic,300italic,400italic,600italic,700italic,900italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Karla:400,400italic,700,700italic' rel='stylesheet' type='text/css'>



    <link rel="icon" type="image/png" href="myfolder/login/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="myfolder/login/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="myfolder/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="myfolder/login/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="myfolder/login/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="myfolder/login/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="myfolder/login/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="myfolder/login/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="myfolder/login/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="myfolder/login/css/util.css">
	<link rel="stylesheet" type="text/css" href="myfolder/login/css/main.css">


		<!-- JavaScript includes -->
		<script src="myfolder/user/js/ipresenter.packed.js"></script>
		<script>
			$(document).ready(function(){
				$('#ipresenter').iPresenter({
					timerPadding: -1,
					controlNav: true,
					controlNavThumbs: true,
					controlNavNextPrev: false
				});
			});
		</script>
		    <script type="text/javascript" src="myfolder/user/js/move-top.js"></script>
<script type="text/javascript" src="myfolder/user/js/easing.js"></script>
<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
				});
			});
		</script>
    </head>
    <body>
       <!-- header-section-starts -->
	<div class="user-desc">
		<div class="container">
			<ul>
				<li><a href="checkout.html">Checkout</a></li>
				<li><i class="user"></i><a href="account.html">My Account</a></li>
				<li><i class="cart"></i><a href="#">Cart (3)</a></li>
			</ul>
		</div>
		</div>
		<div class="header">
		<div class="header-top">
			<div class="container">
				<div class="logo">
                                    <a href="index.html"><img src="myfolder/user/images/logo.jpg" alt="" /></a>
				</div>
				<div class="top-menu">
				 <span class="menu"> </span>
					<ul class="cl-effect-15">
						<li><a href="index.html" data-hover="HOME">HOME</a></li>
						<li><a href="404.html" data-hover="NEWS">NEWS</a></li>
						<li><a href="products.html" data-hover="PRODUCTS">PRODUCTS</a></li>
						<li><a href="404.html" data-hover="FEATURES">FEATURES</a></li>
					
					</ul>
				</div>
				<!--script-nav-->
				<script>
				$("span.menu").click(function(){
				$(".top-menu ul").slideToggle("slow" , function(){
				});
				});
				</script>
				<!--script-nav-->
				<div class="clearfix"></div>
			</div>
		</div>
		</div>
<!-- header-section-ends -->
<!-- content-section-starts -->
	<!-- start registration -->
        <div class="limiter">
		<div class="container-login100" style="background-image: url('myfolder/login/images/background.jpg');">
			<div class="wrap-login100">
                            <form class="login100-form validate-form" action="MainController" method="POST">
					<span class="login100-form-logo">
						<i class="zmdi zmdi-landscape"></i>
					</span>

					<span class="login100-form-title p-b-34 p-t-27">
						Log in
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Enter username">
						<input class="input100" type="text" name="username" placeholder="Username">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input class="input100" type="password" name="password" placeholder="Password">
						<span class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>
                                        <c:if test="${not empty requestScope.INVALID}">
                                             <div class="alert alert-danger">
                                                 <strong>Login failed !</strong> ${requestScope.INVALID.message}
                                             </div>
                                        </c:if>
                               

					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							Login
						</button>
					</div>
                                <input type="hidden" name="action" value="Login"/>
					<div class="text-center p-t-90">
						<a class="txt1" href="#">
							Create new account
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
        
        
	
        
</div>
   <!-- content-section-ends -->	
   <!-- contact-section-starts -->
	<div class="content-section">
		<div class="container">
			<div class="col-md-6 about-us">
				<h4>LITTLE ABOUT US</h4>
				<p><span>Sed posuere</span> consectetur  est at. Nulla vitae elit libero, a pharetra. Lorem ipsum <span>dolor sit</span> amet, consectetuer adipiscing elit.</p>
				
			</div>
			
			<div class="col-md-6 contact-us">
				<h4>CONTACT US</h4>
				<ul>
					<li><i class="message"></i></li>
					<li><a href="mail-to:info@premiumcoding.com">info@premiumcoding.com</a></li>
				</ul>
				<ul>
					<li><i class="land-phone"></i></li>
					<li>800 756 156</li>
				</ul>
				<ul>
					<li><i class="smart-phone"></i></li>
					<li>+386408007561</li>
				</ul>
			</div>
			
		</div>
	</div>
	<!-- contact-section-ends -->
	<!-- footer-section-starts -->
	
	<!-- footer-section-ends -->
        <script src="myfolder/login/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="myfolder/login/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="myfolder/login/vendor/bootstrap/js/popper.js"></script>
	<script src="myfolder/login/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="myfolder/login/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="myfolder/login/vendor/daterangepicker/moment.min.js"></script>
	<script src="myfolder/login/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="myfolder/login/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="myfolder/login/js/main.js"></script>
    </body>
</html>
