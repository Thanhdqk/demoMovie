<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@page import="java.net.URL"%>
<%@page import="org.springframework.data.domain.Page"%>

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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<!-- Css Styles -->
<link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="/css/plyr.css" type="text/css">

<link rel="stylesheet" href="/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="/css/style.css" type="text/css">
</head>
<style>
.listMenu {
	list-style: none;
	padding: 0;
	margin: 0;
}

.listMenu>.list {
	position: relative;
}

.listMenu .taga {
	display: block;
	padding: 10px;
	text-decoration: none;
	color: #000;
}

.listMenu .dropdown1 {
	display: none;
	position: absolute;
	top: 100%;
	left: 0;
	background-color: #fff;
	list-style: none;
	padding: 0;
	margin: 0;
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

.listMenu .dropdown1 li {
	padding: 0;
}

.listMenu .dropdown1 li a {
	padding: 10px;
	display: block;
	text-decoration: none;
	color: #000;
}

.listMenu .dropdown1 li a:hover {
	background-color: #f1f1f1;
}

.listMenu>.list:hover .dropdown1 {
	display: block;
}
</style>
<body>
	<c:if test="${not empty successMessage}">
		<script>
			alert("${successMessage}");
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
						<a href="./index.html"> <img src="/img/logo.png" alt="">
						</a>
					</div>
				</div>
				<div class="col-lg-7">
					<div class="header__nav">
						<nav class="header__menu mobile-menu">
							<ul>
								<li fclass="active"><a><s:message code="home.homepage" /></a></li>
								<!-- <li class="active"><a href="./index.html">Homepage</a></li> -->
								<%-- <li><a href="./categories.html">Categories <span
										class="arrow_carrot-down"></span></a>
									<ul class="dropdown">
										<li><a href="./categories.html">Categories</a></li>
										<li><a href="./anime-details.html">Anime Details</a></li>
										<li><a href="./anime-watching.html">Anime Watching</a></li>
										<li><a href="./blog-details.html">Blog Details</a></li>
										<li><a href="./signup.html">Sign Up</a></li>
										<li><a href="./login.html">Login</a></li>
									</ul></li> --%>
								<!-- <li><a href="./blog.html">Our Blog</a></li> -->
								<li><a href="./categories.html"><s:message
											code="home.categories" /> <span class="arrow_carrot-down"></span></a>
									<ul class="dropdown">
										<li><a href="./categories.html">Categories</a></li>
										<li><a href="./anime-details.html">Anime Details</a></li>
										<li><a href="./anime-watching.html">Anime Watching</a></li>
										<li><a href="./blog-details.html">Blog Details</a></li>
										<li><a href="./signup.html">Sign Up</a></li>
										<li><a href="./login.html">Login</a></li>
									</ul></li>
								<li><a href="./blog.html"><s:message
											code="home.ourblog" /></a></li>
								<!-- <li><a href="#">Contacts</a></li> -->
								<h1 style="color: yellow;">${currentTime}dsgfsdf</h1>
								<li><a href="#"><s:message code="home.language" /><span
										class="arrow_carrot-down"></span></a>
									<ul class="dropdown">
										<li><a href="?lang=vi">Tiếng Việt</a></li>
										<li><a href="?lang=en">English</a></li>
										<li><a href="?lang=zh">中文</a></li>
										<li><a href="?lang=th">ภาษาไทย</a></li>
									</ul></li>

							</ul>
						</nav>
					</div>
				</div>
				<div class="header__right d-flex align-items-center">
					<%-- <a href="" class="search-switch"><span class="icon_search"></span></a> --%>
					<form action="/search/find" method="get">
						<input name="findName" placeholder="Enter movie name">
						<button type="submit">Search</button>
					</form>
					<div class="header__menu mobile-menu">
						<ul>
							<li><a href="/login"> <span class="icon_profile"></span>
									<span class="arrow_carrot-down"></span>
							</a>
								<ul class="dropdown">
									<li><a href="/account/manage">Quản lý tài khoản</a></li>
									<li><a href="/hoadon">Lịch sử mua hàng</a></li>
									<li><a href="/movie/favorites">Danh sách phim yêu
											thích</a></li>
								</ul></li>
						</ul>
					</div>


					<%-- <a href="/login"><span class="icon_profile"></span></a> --%>
					<c:if test="${not empty sessionScope.loggedInUser}">
						<div>

							<span style="color: white; margin-right: 20px; font-weight: bold">Hi,
								${sessionScope.loggedInUser.username}</span> <a
								style="font-size: 15px; font-weight: bold;"
								href="${pageContext.request.contextPath}/logout">Logout</a>
						</div>
					</c:if>
				</div>

			</div>
			<div id="mobile-menu-wrap"></div>
		</div>
	</header>
	<!-- Header End -->

	<!-- Hero Section Begin -->
	<section class="hero">
		<div class="container">
			<div class="hero__slider owl-carousel">
				<div class="hero__items set-bg" data-setbg="/img/hero/hero-1.jpg">
					<div class="row">
						<div class="col-lg-6">
							<div class="hero__text">
								<div class="label">Adventure</div>
								<h2>Fate / Stay Night: Unlimited Blade Works</h2>
								<p>After 30 days of travel across the world...</p>
								<a href="#"><span>Watch Now</span> <i
									class="fa fa-angle-right"></i></a>
							</div>
						</div>
					</div>
				</div>
				<div class="hero__items set-bg" data-setbg="/img/hero/hero-1.jpg">
					<div class="row">
						<div class="col-lg-6">
							<div class="hero__text">
								<div class="label">Adventure</div>
								<h2>Fate / Stay Night: Unlimited Blade Works</h2>
								<p>After 30 days of travel across the world...</p>
								<a href="#"><span>Watch Now</span> <i
									class="fa fa-angle-right"></i></a>
							</div>
						</div>
					</div>
				</div>
				<div class="hero__items set-bg" data-setbg="/img/hero/hero-1.jpg">
					<div class="row">
						<div class="col-lg-6">
							<div class="hero__text">
								<div class="label">Adventure</div>
								<h2>Fate / Stay Night: Unlimited Blade Works</h2>
								<p>After 30 days of travel across the world...</p>
								<a href="#"><span>Watch Now</span> <i
									class="fa fa-angle-right"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->

	<!-- Product Section Begin -->
	<section class="product spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="trending__product">
						<div class="row">
							<div class="col-lg-8 col-md-8 col-sm-8">
								<div class="section-title">
									<h4>Movies</h4>
								</div>
							</div>

						</div>
						<div class="row">

							<c:forEach var="movie" items="${listMovie.content}">
								<div class="col-lg-4 col-md-6 col-sm-6">
									<div class="product__item">
										<div class="product__item__pic set-bg"
											data-setbg="/img/${movie.hinhAnh}.jpg">
											<div class="ep">18 / 18</div>
											<div class="comment">
												<i class="fa fa-comments"></i> 11
											</div>
											<div class="view">
												<i class="fa fa-eye"></i> 9141
											</div>
										</div>
										<div class="product__item__text">
											<ul>
												<li>Active</li>
												<li>Movie</li>
											</ul>
											<h5>
												<a href="/movie/${movie.maMV}"> ${movie.tenMV} </a>
											</h5>
										</div>
									</div>
								</div>
							</c:forEach>

						</div>
						<div
							class="card-footer d-flex justify-content-center align-items-center w-100 h-100 ">
							<nav aria-label="Page navigation example">
								<ul class="pagination">

									<li class="page-item"><a class="page-link"
										href="/cate/sort?p=0">First</a></li>
									<li class="page-item"><a class="page-link"
										href="/cate/sort?p=${page.number+1}">Next</a></li>


									<c:forEach items="${pageNum}" var="pageNums">
										<li class="page-item"><a class="page-link"
											href="/cate/sort?p=${pageNums-1	} &field=${path}">${pageNums	}</a></li>
									</c:forEach>
									<li class="page-item"><a class="page-link"
										href="/cate/sort?p=${page.number-1}">Previous</a></li>
									<li class="page-item"><a class="page-link"
										href="/cate/sort?p=${page.totalPages-1}">Last</a></li>
								</ul>
							</nav>
						</div>
					</div>


				</div>
				<div class="col-lg-4 col-md-6 col-sm-8">
					<div class="product__sidebar">
						<div class="product__sidebar__view">
							<div class="section-title">
								<h5>Sort by</h5>
							</div>

							<div class="form-check">
								<input type="checkbox" name="field" value="free"
									class="btn-check" id="btn-check-2"
									<%=request.getAttribute("status") == "1" ? "checked" : "cc"%>
									autocomplete="off"> <label class="btn btn-primary"
									for="btn-check-2"><a
									class="text-decoration-none text-light"
									href="/cate/sort?field=free"> Free </a> </label> <input
									<%=request.getAttribute("status") == "1" ? "cc" : "checked"%>
									name="field" value="pay" type="checkbox" class="btn-check"
									id="btn-check-2" autocomplete="off"> <label
									class="btn btn-primary" for="btn-check-2"> <a
									class="text-decoration-none text-light"
									href="/cate/sort?field=pay"> Pay </a>
								</label>
							</div>
							
							<div class="form-check">
								<select id="select1" name="danhmucname"
									style="min-width: 300px;" class="form-select "
									aria-label="Default select example">
									<option selected>Theo danh mục</option>
									<c:forEach var="category" items="${danhmuc}">
										<option <%=request.getAttribute("status") == "ML001" ? "selected" : "cc"%>  value="danhmuc_${category.maLoai}">${category.tenLoai}</option>
									</c:forEach>
								</select>
							</div>
							
							<div class="form-check">
								<select id="select2"  name="year" class="form-select"
									style="min-width: 300px;" Defaultselectexample">
									<option selected>Theo năm ra mắt</option>
									<option value="2024">2024</option>
									<option value="2023">2023</option>
									<option value="2022">2022</option>
									<option value="2021">2021</option>
								</select>
							</div>


						</div>

					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Section End -->

	<!-- Footer Section Begin -->
	<footer class="footer">
		<div class="page-up">
			<a href="#" id="scrollToTopButton"><span class="arrow_carrot-up"></span></a>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="footer__logo">
						<a href="./index.html"><img src="/img/logo.png" alt=""></a>
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
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			var listItems = document.querySelectorAll('.listMenu > .list');
			listItems.forEach(function(item) {
				item.addEventListener('mouseenter', function() {
					var dropdown = this.querySelector('.dropdown');
					dropdown.style.display = 'block';
					dropdown.style.opacity = 0;
					setTimeout(function() {
						dropdown.style.opacity = 1;
					}, 10);
				});
				item.addEventListener('mouseleave', function() {
					var dropdown = this.querySelector('.dropdown');
					dropdown.style.opacity = 0;
					setTimeout(function() {
						dropdown.style.display = 'none';
					}, 300);
				});
			});
		});
	</script>


	<!-- Js Plugins -->
	<script src="/js/jquery-3.3.1.min.js"></script>

	<script src="/js/player.js"></script>

	<script src="/js/mixitup.min.js"></script>
	<script src="/js/jquery.slicknav.js"></script>
	<script src="/js/owl.carousel.min.js"></script>
	<script src="/js/main.js"></script>


</body>

</html>
<script>
	document.getElementById('select1').onchange = function() {
		var e = document.getElementById("select1");
		var value = e.value;
		window.location = "/cate/sort2?field=" + value;

	};
	document.getElementById('select2').onchange = function() {
		var e = document.getElementById("select2");
		var value = e.value;
		window.location = "/cate/sort2?field=" + value;

	};

	
</script>