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


   /* CSS để định vị popup ở giữa màn hình */
        #popupCard {
            display: none; /* Ẩn popup mặc định */
            position: fixed; /* Định vị cố định để popup ở cùng vị trí khi cuộn trang */
            top: 50%; /* Đưa popup xuống giữa màn hình theo chiều dọc */
            left: 50%; /* Đưa popup vào giữa màn hình theo chiều ngang */
            transform: translate(-50%, -50%); /* Dịch chuyển popup về giữa theo cả hai chiều */
            background-color: white; /* Màu nền của popup */
            padding: 20px; /* Khoảng cách nội dung bên trong popup */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); /* Đổ bóng cho popup */
            z-index: 1000; /* Đảm bảo popup luôn ở trên cùng */
        }

        /* Đặt nền mờ khi popup hiện */
        .popup-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            display: none; /* Ẩn overlay mặc định */
            z-index: 999; /* Đảm bảo overlay luôn dưới popup nhưng trên các phần tử khác */
        }

        /* CSS cho nút đóng popup */
        .exitBtn {
            background: none;
            border: none;
            font-size: 1.5em;
            position: absolute;
            top: 10px;
            right: 10px;
            cursor: pointer;
        }
        
        .otp-Form {
  width: 230px;
  height: 300px;
  background-color: rgb(255, 255, 255);
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  padding: 20px 30px;
  gap: 20px;
  position: relative;
  box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.082);
  border-radius: 15px;
}

.mainHeading {
  font-size: 1.1em;
  color: rgb(15, 15, 15);
  font-weight: 700;
}

.otpSubheading {
  font-size: 0.7em;
  color: black;
  line-height: 17px;
  text-align: center;
}

.inputContainer {
  width: 100%;
  display: flex;
  flex-direction: row;
  gap: 10px;
  align-items: center;
  justify-content: center;
}

.otp-input {
  background-color: rgb(228, 228, 228);
  width: 30px;
  height: 30px;
  text-align: center;
  border: none;
  border-radius: 7px;
  caret-color: rgb(127, 129, 255);
  color: rgb(44, 44, 44);
  outline: none;
  font-weight: 600;
}

.otp-input:focus,
.otp-input:valid {
  background-color: rgba(127, 129, 255, 0.199);
  transition-duration: .3s;
}

.verifyButton {
  width: 100%;
  height: 30px;
  border: none;
  background-color: rgb(127, 129, 255);
  color: white;
  font-weight: 600;
  cursor: pointer;
  border-radius: 10px;
  transition-duration: .2s;
}

.verifyButton:hover {
  background-color: rgb(144, 145, 255);
  transition-duration: .2s;
}

.exitBtn {
  position: absolute;
  top: 5px;
  right: 5px;
  box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.171);
  background-color: rgb(255, 255, 255);
  border-radius: 50%;
  width: 25px;
  height: 25px;
  border: none;
  color: black;
  font-size: 1.1em;
  cursor: pointer;
}

.resendNote {
  font-size: 0.7em;
  color: black;
  width: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 5px;
}

.resendBtn {
  background-color: transparent;
  border: none;
  color: rgb(127, 129, 255);
  cursor: pointer;
  font-size: 1.1em;
  font-weight: 700;
}
</style>
<!-- <script>
        function validateLoginForm() {
            var taiKhoan = document.getElementById("taiKhoan").value;
            var matKhau = document.getElementById("matKhau").value;

            if (taiKhoan.trim() === '' || matKhau.trim() === '') {
                alert("Please enter both username and password");
                return false; // Prevent form submission
            }else if (taiKhoan.trim().length > 10 || matKhau.trim().length > 10) {
                alert("Please enter both username and password with at least 10 characters");
                return false; // Prevent form submission
            }
            return true; // Allow form submission
        }
</script>  -->
<body>
	<c:if test="${not empty signupSuccess}">
		<script>
			alert("${signupSuccess}");
		</script>
	</c:if>

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
				<div class="col-lg-6">
					<div class="login__form">
						<h3>Forgot Password</h3>

						<%--                         <form action="#">
                            <div class="input__item">
                                <input type="text" placeholder="Email address">
                                <span class="icon_mail"></span>
                            </div>
                            <div class="input__item">
                                <input type="text" placeholder="Password">
                                <span class="icon_lock"></span>
                            </div>
                            <button type="submit" class="site-btn">Login Now</button>
                        </form> --%>

						<%--                         <form:form method="post" modelAttribute="user">
                            <div class="input__item">
                                <form:input type="text" placeholder="Email address" path="taiKhoan"/>
                                <span class="icon_mail"></span>
                            </div>
                            <div class="input__item">
                                <form:input type="text" placeholder="Password" path="matKhau"/>
                                <span class="icon_lock"></span>
                            </div>
                            <form:button formaction="/login/save" type="submit" class="site-btn">Login Now</form:button>
                        </form:form> --%>

						<form:form method="post" modelAttribute="user"
							action="/quenmatkhau/send">
							<div class="input__item">
								<form:input type="text" placeholder="Email address" path="email" />
								<span class="icon_mail"></span>
								<form:errors
									style="margin-top:34px; font-size:17px; font-weight:900; color: red;"
									path="email"></form:errors>
							</div>

							<button type="submit"   class="site-btn">Send
								OTP</button>

						</form:form>
						
						
						

    



					</div>
				</div>
				<div class="col-lg-6">
					<div class="login__register">
						<h3>Don't Have An Account?</h3>
						<a href="/signup" class="primary-btn">Register Now</a>
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
