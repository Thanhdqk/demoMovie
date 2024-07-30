<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Anime Template">
<meta name="keywords" content="Anime, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Anime | Template</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="/css/plyr.css" type="text/css">
<link rel="stylesheet" href="/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="/css/style.css" type="text/css">
</head>
<style>
.form {
  display: flex;
  align-items: center;
  flex-direction: column;
  justify-content: space-around;
  width: 400px;
  background-color: white;
  border-radius: 12px;
  padding: 20px;
}

.title {
  font-size: 20px;
  font-weight: bold;
  color: black
}

.message {
  color: #a3a3a3;
  font-size: 14px;
  margin-top: 4px;
  text-align: center
}

.inputs {
  margin-top: 10px
}

.inputs input {
  width: 32px;
  height: 32px;
  text-align: center;
  border: none;
  border-bottom: 1.5px solid #d2d2d2;
  margin: 0 10px;
}

.inputs input:focus {
  border-bottom: 1.5px solid royalblue;
  outline: none;
}

.action {
  margin-top: 24px;
  padding: 12px 16px;
  border-radius: 8px;
  border: none;
  background-color: royalblue;
  color: white;
  cursor: pointer;
  align-self: end;
}
</style>

<body>
	

	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<header class="header">
		<div class="container">
			<div class="row">
				<div class="col-lg-2">
					<div class="header__logo">
						<a href="./index.html"> <img src="img/logo.png" alt="">
						</a>
					</div>
				</div>
				<div class="col-lg-8">
					<div class="header__nav">
						<nav class="header__menu mobile-menu">
							<ul>
								<li><a href="./index.html">Homepage</a></li>
								<li><a href="./categories.html">Categories <span
										class="arrow_carrot-down"></span></a>
									<ul class="dropdown">
										<li><a href="./categories.html">Categories</a></li>
										<li><a href="./anime-details.html">Anime Details</a></li>
										<li><a href="./anime-watching.html">Anime Watching</a></li>
										<li><a href="./blog-details.html">Blog Details</a></li>
										<li><a href="./signup.html">Sign Up</a></li>
										<li><a href="./login.html">Login</a></li>
									</ul></li>
								<li><a href="./blog.html">Our Blog</a></li>
								<li><a href="#">Contacts</a></li>
							</ul>
						</nav>
					</div>
				</div>
				<div class="col-lg-2">
					<div class="header__right">
						<a href="#" class="search-switch"><span class="icon_search"></span></a>
						<a href="./login.html"><span class="icon_profile"></span></a>
					</div>
				</div>
			</div>
			<div id="mobile-menu-wrap"></div>
		</div>
	</header>
	<!-- Header End -->

	<!-- Normal Breadcrumb Begin -->
	<section class="normal-breadcrumb set-bg"
		data-setbg="/img/normal-breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="normal__breadcrumb__text">
						<h2>Login</h2>
						<p>Welcome to the official AnimeÂ blog.</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Normal Breadcrumb End -->

	<!-- Login Section Begin -->
	<section class="login spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 ">
					<div class="login__form">


						<form action="/xacthuc/do" method="POST" class="form mx-auto">
							<div class="title">OTP</div>
							<div class="title">Verification Code</div>
							<p class="message">We have sent a verification code to your
								mobile number</p>
							<div class="inputs">
								<input id="input1" name="so1" type="text" maxlength="1"> 
								<input id="input2" name="so2" type="text" maxlength="1"> 
								<input id="input3" name="so3" type="text" maxlength="1"> 
								<input id="input4" name="so4" type="text" maxlength="1">
								<input id="input3" name="so5" type="text" maxlength="1"> 
								<input id="input4" name="so6" type="text" maxlength="1">
							</div>
							<button type="submit" class="action">verify me</button>
						</form>


						<%-- <div class="popup-overlay" id="popupOverlay"></div>

    <div id="popupCard">
        <form class="otp-Form">
            <button type="button" class="exitBtn">×</button>
            <span class="mainHeading">Enter OTP</span>
            <p class="otpSubheading">We have sent a verification code to your mobile number</p>
            <div class="inputContainer">
                <input required="required" maxlength="1" type="text" class="otp-input" id="otp-input1">
                <input required="required" maxlength="1" type="text" class="otp-input" id="otp-input2">
                <input required="required" maxlength="1" type="text" class="otp-input" id="otp-input3">
                <input required="required" maxlength="1" type="text" class="otp-input" id="otp-input4">
                <input required="required" maxlength="1" type="text" class="otp-input" id="otp-input5">
                 <input required="required" maxlength="1" type="text" class="otp-input" id="otp-input6">
            </div>
            <button class="verifyButton" type="submit">Verify</button>
            <p class="resendNote">Didn't receive the code? <button class="resendBtn">Resend Code</button></p>
        </form>
    </div> --%>



					</div>
				</div>

			</div>

		</div>
	</section>
	<!-- Login Section End -->

	<!-- Footer Section Begin -->
	<footer class="footer">
		<div class="page-up">
			<a href="#" id="scrollToTopButton"><span class="arrow_carrot-up"></span></a>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="footer__logo">
						<a href="./index.html"><img src="img/logo.png" alt=""></a>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="footer__nav">
						<ul>
							<li class="active"><a href="./index.html">Homepage</a></li>
							<li><a href="./categories.html">Categories</a></li>
							<li><a href="./blog.html">Our Blog</a></li>
							<li><a href="#">Contacts</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3">
					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="fa fa-heart" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>

				</div>
			</div>
		</div>
	</footer>
	<!-- Footer Section End -->

	<!-- Search model Begin -->
	<div class="search-model">
		<div class="h-100 d-flex align-items-center justify-content-center">
			<div class="search-close-switch">
				<i class="icon_close"></i>
			</div>
			<form class="search-model-form">
				<input type="text" id="search-input" placeholder="Search here.....">
			</form>
		</div>
	</div>
	<!-- Search model end -->

	<!-- Js Plugins -->
	<script src="/js/jquery-3.3.1.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/player.js"></script>
	<script src="/js/jquery.nice-select.min.js"></script>
	<script src="/js/mixitup.min.js"></script>
	<script src="/js/jquery.slicknav.js"></script>
	<script src="/js/owl.carousel.min.js"></script>
	<script src="/js/main.js"></script>


</body>

</html>
