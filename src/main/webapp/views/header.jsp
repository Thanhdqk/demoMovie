<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    .box {
        width: 150px; /* Adjust the width as needed */
        height: 30px;
        background-color: white;
        border-radius: 30px;
        display: flex;
        align-items: center;
        padding: 10px; /* Adjust padding as needed */
    }

    .box > i {
        font-size: 20px;
        color: #777;
    }

    .box > input {
        /* flex: 1; */
        width: 100px;
        height: 30px; /* Adjust height as needed */
        border: none;
        outline: none;
        font-size: 14px; /* Adjust font-size as needed */
        padding-left: 10px;
    }
</style>
<body>
	<div class="container">
			<div class="row">
				<div class="col-lg-2">
					<div class="header__logo">
						<a href="/home"> <img src="/img/logo.png" alt="">
						</a>
					</div>
				</div>
				<div class="col-lg-7">
					<div class="header__nav">
						<nav class="header__menu mobile-menu">
							<ul>
								<li class="active"><a><s:message code="home.homepage"/></a></li>
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
								<li>
								    <a href="#">Categories <span class="arrow_carrot-down"></span></a>
								    <ul class="dropdown">
								        <c:forEach var="category" items="${categories}">
								            <li>
								                <a href="<c:url value='/category/${category.maLoai}'/>">
								                    ${category.tenLoai}
								                </a>
								            </li>
								            
								        </c:forEach>
								        <li>
								                <a href="/free">
								                   Free
								                </a>
								            </li>
								            <li>
								                <a href="/charge">
								                    Charge
								                </a>
								            </li>
								    </ul>
								</li>
							<%-- <div class="form-check">
								<select id="select1" name="danhmucname"
									style="min-width: 300px;" class="form-select "
									aria-label="Default select example">
									<option selected>Theo danh mục</option>
									<c:forEach var="category" items="${danhmuc}">
										<option <%=request.getAttribute("status") == "ML001" ? "selected" : "cc"%>  value="danhmuc_${category.maLoai}">${category.tenLoai}</option>
									</c:forEach>
								</select>
							</div> --%>
							
								<!-- <li><a href="./blog.html"><s:message code="home.ourblog"/></a></li> -->
								<!-- <li><a href="#">Contacts</a></li> -->
								<%-- <p style="color: yellow;">${currentTime}</p> --%>
								<li><a href="#"><s:message code="home.language"/><span class="arrow_carrot-down"></span></a>
                                    <ul class="dropdown">
                                        <li><a href="?lang=vi">Tiếng Việt</a></li>
                                        <li><a href="?lang=en">English</a></li>
                                        <li><a href="?lang=zh">中文</a></li>
                                        <li><a href="?lang=th">ภาษาไทย</a></li>
                                    </ul>
                                </li>
                              
                              	<li>
						            <a href="/login" style="margin-right: 50px">
						            	<s:message code="home.account"/>
						                <!-- <span class="icon_profile"></span> -->
						                <span class="arrow_carrot-down"></span>
						            </a>
						            <ul class="dropdown">
						                <li><a href="/account/manage">Quản lý tài khoản</a></li>
						                <li><a href="/hoadon">Lịch sử mua hàng</a></li>
						                <li><a href="/movie/favorites">Danh sách phim yêu thích</a></li>
						            </ul>
					        	</li>
                              
							</ul>
						</nav>
					</div>
				</div>
				<div class="header__right d-flex align-items-center">
					 <%-- <a href="" class="search-switch"><span class="icon_search"></span></a> --%>
					 
					<!-- <div class="header__menu mobile-menu">
						<ul>
				        	<li>
				            <a href="/login" style="margin-right: 50px">
				                <span class="icon_profile"></span>
				                <span class="arrow_carrot-down"></span>
				            </a>
				            <ul class="dropdown">
				                <li><a href="/account/manage">Quản lý tài khoản</a></li>
				                <li><a href="/hoadon">Lịch sử mua hàng</a></li>
				                <li><a href="/movie/favorites">Danh sách phim yêu thích</a></li>
				            </ul>
				        	</li>
				        </ul>
					</div> -->
				        
				    <form action="/search/find" method="get">
					    <!-- <div class="input-group">
					        <input type="text" class="form-control" name="findName" placeholder="Find" style="width: 120px;">
					        <button type="submit" class="btn btn-primary">
					            <span class="icon_search"></span>
					        </button>
					    </div> -->
					    <div class="box">
							<i class="fa fa-search" aria-hidden="true"></i>						
							<input type="text" name="findName">
						</div>
					</form>
					<%-- <a href="/login"><span class="icon_profile"></span></a> --%>
					<c:if test="${not empty sessionScope.loggedInUser}">
						<div>
							<span style="color:white; margin-left: 10px; font-weight: bold">Hi, ${sessionScope.loggedInUser.username}</span>
							<a style="font-size:15px; font-weight: bold;" href="${pageContext.request.contextPath}/logout">Logout</a>
						</div>
					</c:if>
				</div>

			</div>
			<div id="mobile-menu-wrap"></div>
		</div>
</body>
</html>