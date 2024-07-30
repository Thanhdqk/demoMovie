<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
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

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
    <header class="header">
        <%@ include file="header.jsp" %>
    </header>
    <!-- Header End -->

    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                        <a href="./categories.html">Categories</a>
                        <span>Romance</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Anime Section Begin -->
    <section class="anime-details spad">
        <div class="container">
            <div class="anime__details__content">
                <div class="row">
                <c:if test="${not empty message}">
			        <p style="font-weight: bold; font-size: xx-large; 
			        color: white; margin-left: 400px; margin-bottom: 180px;">${message}</p>
			    </c:if>
                <c:forEach var="movie" items="${findNameMovies}">
                    <div class="col-lg-3">
                        <div class="anime__details__pic set-bg" data-setbg="/img/${movie.hinhAnh}.jpg">

                        </div>
                    </div>
                    <div class="col-lg-9">
                        <div class="anime__details__text">
                        
                            <div class="anime__details__title">
                                <h3>${movie.tenMV}</h3>
                            </div>
                            <div class="anime__details__rating">
                                <div class="rating">
                                    <a href="#"><i class="fa fa-star"></i></a>
                                    <a href="#"><i class="fa fa-star"></i></a>
                                    <a href="#"><i class="fa fa-star"></i></a>
                                    <a href="#"><i class="fa fa-star"></i></a>
                                    <a href="#"><i class="fa fa-star-half-o"></i></a>
                                </div>
                                <span>1.029 Votes</span>
                            </div>
                            <p>${movie.noiDung}</p>
                            <div class="anime__details__widget">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6">
                                        <ul>
                                            <li><span>Type:</span> Movie</li>
                                            <li><span>Author:</span> ${movie.tacGia}</li>
                                            <li><span>Date:</span> <fmt:formatDate value="${movie.ngaySanXuat}" pattern="dd/MM/yyyy" /></li>
                                            <li><span>Status:</span> Airing</li>
                                            <li><span>Genre:</span>${movie.danhmucphim.tenLoai}</li>
                                        </ul>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                        <ul>
                                            <li><span>Scores:</span> 7.31 / 1,515</li>
                                            <li><span>Rating:</span> 8.5 / 161 times</li>
                                            <li><span>Duration:</span> 24 min/ep</li>
                                            <li><span>Quality:</span> HD</li>
                                            <li><span>Views:</span> 131,541</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            
                            
                            <div class="anime__details__btn">
							    <div style="display: flex;">
							        
							            <%-- <form action="/movie/${movie.maMV}/favorite" method="post">
							                <c:set var="isFavorite" value="false" />
							                <c:forEach var="favMovie" items="${favoriteMovie}">
							                    <c:if test="${favMovie.user.id == loggedInUser.id && favMovie.movie.maMV == movie.maMV}">
							                        <c:set var="isFavorite" value="true" />
							                    </c:if>
							                </c:forEach>
							                <c:choose>
							                    <c:when test="${isFavorite}">
							                        <button type="submit" class="follow-btn"><i class="fa fa-heart"></i> Unfollow</button>
							                    </c:when>
							                    <c:otherwise>
							                        <button type="submit" class="follow-btn"><i class="fa fa-heart-o"></i> Follow</button>
							                    </c:otherwise>
							                </c:choose>
							            </form> --%>
							            
							            <c:set var="isFavorites" value="false" />
							            <c:forEach var="chiTiet" items="${chiTiets}">
							                <c:if test="${chiTiet.user.id == loggedInUser.id && chiTiet.movie.maMV == movie.maMV}">
							                    <c:set var="isFavorites" value="true" />
							                </c:if>
							            </c:forEach>
							            <c:choose>
							                <c:when test="${isFavorites || movie.thanhTien == 0}">
							                    <a href="/movie/watching/${movie.maMV}" class="watch-btn"><span>Watch Now</span> <i class="fa fa-angle-right"></i></a>
							                </c:when>
							                <c:otherwise>
							                    <a href="/movie/pay/${movie.maMV}" class="watch-btn"><span><fmt:formatNumber value="${movie.thanhTien}" type="currency" currencySymbol="VND" pattern="#,###"/> VND</span></a>
							                </c:otherwise>
							            </c:choose>
							        
							    </div>
							</div>
							
                            </div>
                        </div>
                        
					</c:forEach>
                    </div>
                </div>
                
            </div>
        </section>
        <!-- Anime Section End -->

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
                        <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                          Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                          <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>

                      </div>
                  </div>
              </div>
          </footer>
          <!-- Footer Section End -->

          <!-- Search model Begin -->
          <div class="search-model">
            <div class="h-100 d-flex align-items-center justify-content-center">
                <div class="search-close-switch"><i class="icon_close"></i></div>
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