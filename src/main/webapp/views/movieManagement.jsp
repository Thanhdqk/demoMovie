<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="style.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
<script src="https://code.angularjs.org/1.8.2/angular-route.min.js"></script>
<style>
body {
	background: rgb(2, 0, 36);
	background: linear-gradient(90deg, rgba(2, 0, 36, 1) 0%,
		rgba(9, 9, 121, 1) 35%, rgba(0, 212, 255, 1) 100%);
}

button {
	position: relative;
	display: inline-block;
	margin: 15px;
	padding: 10px 20px;
	text-align: center;
	font-size: 18px;
	width: 120px;
	height: 50px;
	letter-spacing: 1px;
	text-decoration: none;
	color: #725AC1;
	background: transparent;
	cursor: pointer;
	transition: ease-out 0.5s;
	border: 2px solid #725AC1;
	border-radius: 10px;
	box-shadow: inset 0 0 0 0 #725AC1;
}

button:hover {
	color: white;
	box-shadow: inset 0 -100px 0 0 #725AC1;
}

button:active {
	transform: scale(0.9);
}
</style>
</head>
<body>

	<div class="container-fluid">
		<div class="row mt-5">
			<div class="col-md-12 mt-2">
				<div class="card   mx-auto ">

					<div class="card-body row">
						<form:form method="post" modelAttribute="movie"
							enctype="multipart/form-data">
							<div class=" row">
								<div class="col-md-12">

									<h1>Movie Management</h1>

								</div>
								<div class="col-md-6">


									<label for="username" class="text-primary fw-bold mt-3 mb-1">Mã
										Movie</label>

									<form:input type="text" name="idne"  path="maMV"
										cssClass="form-control" />
									<form:errors cssClass="text-danger fw-bold" path="maMV"></form:errors>
									<br> <label class="text-primary fw-bold mt-2 mb-1"
										for="password">Tên Movie</label>
									<form:input type="text" id="username" path="tenMV"
										cssClass="form-control" />
									<form:errors cssClass="text-danger fw-bold" path="tenMV"></form:errors>
									<br> <label for="role"
										class="text-primary fw-bold mt-2 mb-1">Thời Lượng</label>
									<form:input type="text" id="username" path="thoiLuong"
										cssClass="form-control" />
									<form:errors cssClass="text-danger fw-bold" path="thoiLuong"></form:errors>
									<br> <label for="email"
										class="text-primary fw-bold mt-3 mb-1">Tác Giả</label>
									<form:input type="text" id="email" path="tacGia"
										cssClass="form-control mb-2" />
									<form:errors cssClass="text-danger fw-bold" path="tacGia"></form:errors>
									<br>
									<label for="email"
										class="text-primary fw-bold mt-3 mb-1">Thành Tiền</label>
									<form:input type="text" id="email" path="thanhTien"
										cssClass="form-control mb-2" />
									<form:errors cssClass="text-danger fw-bold" path="thanhTien"></form:errors>
									<br>


								</div>
								<div class="col-md-6">
									

									<label for="username" class="text-primary fw-bold mt-3 mb-1">Ngày
										Sản Xuất</label>

									<form:input type="text" id="username" path="ngaySanXuat"
										cssClass="form-control" />
									<form:errors cssClass="text-danger fw-bold" path="ngaySanXuat"></form:errors>
									<br> <label class="text-primary fw-bold mt-2 mb-1"
										for="password">Hình Ảnh</label> <input class="form-control"
										name="file" type="file" />
									<form:errors path="hinhAnh"
										cssClass="error text-danger fw-bold" />
									<br> <label for="role"
										class="text-primary fw-bold mt-2 mb-1">URL</label>
									<form:input type="text" id="username" path="url"
										cssClass="form-control" />
									<form:errors cssClass="text-danger fw-bold" path="url"></form:errors>
									<br> <label for="email"
										class="text-primary fw-bold mt-3 mb-1">Loại phim</label>
									<form:select class="form-select" path="danhmucphim.maLoai">
									    <form:options items="${namecategory}" itemValue="maLoai" itemLabel="tenLoai" />
									</form:select>
									<br>
									<label for="email"
										class="text-primary fw-bold mt-3 mb-1">Nội Dung</label>
										<form:textarea cssClass="form-control mb-2"  path="noiDung"/>
									
										
									<form:errors cssClass="text-danger fw-bold" path="noiDung"></form:errors>
									<br>


								</div>

								<div class="col-md-12 mt-3 mx-auto">

									<form:button formaction="/movie/choose/movie/save" type="submit"
										class="button  mt-3">Save</form:button>
									<form:button formaction="/movie/choose/movie/update" type="submit"
										class="button mt-3 ms-3">Update</form:button>
									<form:button formaction="/movie/choose/movie/delete" type="submit"
										class="button  mt-3 ms-3">Delete</form:button>
									<form:button formaction="/movie/choose/movie/clear" type="submit"
										class="button  mt-3 ms-3">Clear</form:button>

								</div>


							</div>
						</form:form>

						<div class="col-12 mt-3">
							<table class="table-bordered text-center">
								<thead style="background-color: orange;">
									<tr>
										<th>Mã Movie</th>
										<th>Tên Movie</th>
										<th>Thời Lượng</th>
										<th>Hình Ảnh</th>
										<th>Tác giả</th>
										<th>NSS</th>

										<th>Loại</th>
										<th>Thành Tiền</th>
										<th>Url</th>
										<th>Nút</th>
									</tr>
								</thead>
								<tbody>


									<c:forEach var="movie" items="${movies}">

										<tr>
											<td>${movie.maMV}</td>
											<td>${movie.tenMV}</td>
											<td>${movie.thoiLuong} Hours</td>
											<td><img style="width: 200px; height: 295px" alt=""
												src="/img/${movie.hinhAnh}.jpg"></td>
											<td style="width: 90px">${movie.ngaySanXuat}</td>
											<td>${movie.tacGia}</td>

											<td style="width: 130px">${movie.thanhTien}</td>
											<td style="width: 130px">${movie.url}</td>
											<td>${movie.danhmucphim.tenLoai}</td>
											<td><a href="/movie/choose/movie/delete1/${movie.maMV}">
													<img alt="" src="/img/icons8-delete-40.png">
											</a> <a href="/movie/choose/movie/edit1/${movie.maMV}"> <img alt=""
													src="/img/icons8-up-40.png">
											</a></td>
										</tr>

									</c:forEach>


								</tbody>
							</table>
							
							<!-- Phân trang -->
							 <ul class="pagination justify-content-center">
							    <c:choose>
							        <c:when test="${currentPage == 0}">
							            <li class="page-item disabled">
							                <a class="page-link">First</a>
							            </li>
							            <li class="page-item disabled">
							                <a class="page-link">Previous</a>
							            </li>
							        </c:when>
							        <c:otherwise>
							            <li class="page-item">
							                <a class="page-link" href="<c:url value='/movie/choose/movie'/>?page=0">First</a>
							            </li>
							            <li class="page-item">
							                <a class="page-link" href="<c:url value='/movie/choose/movie'/>?page=${currentPage - 1}">Previous</a>
							            </li>
							        </c:otherwise>
							    </c:choose>
							    <c:forEach var="i" begin="0" end="${totalPages - 1}">
							        <c:choose>
							            <c:when test="${currentPage == i}">
							                <li class="page-item active">
							                    <a class="page-link" href="<c:url value='/movie/choose/movie'/>?page=${i}">${i + 1}</a>
							                </li>
							            </c:when>
							            <c:otherwise>
							                <li class="page-item">
							                    <a class="page-link" href="<c:url value='/movie/choose/movie'/>?page=${i}">${i + 1}</a>
							                </li>
							            </c:otherwise>
							        </c:choose>
							    </c:forEach>
							    <c:choose>
							        <c:when test="${currentPage + 1 == totalPages}">
							            <li class="page-item disabled">
							                <a class="page-link">Next</a>
							            </li>
							            <li class="page-item disabled">
							                <a class="page-link">Last</a>
							            </li>
							        </c:when>
							        <c:otherwise>
							            <li class="page-item">
							                <a class="page-link" href="<c:url value='/movie/choose/movie'/>?page=${currentPage + 1}">Next</a>
							            </li>
							            <li class="page-item">
							                <a class="page-link" href="<c:url value='/movie/choose/movie'/>?page=${totalPages - 1}">Last</a>
							            </li>
							        </c:otherwise>
							    </c:choose>
							</ul>

						</div>



					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>