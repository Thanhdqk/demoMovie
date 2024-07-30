
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

</head>
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
  width:120px;
  height:50px;
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
<body>

	<div class="container">

		<div class="row mt-5">

			<div class="col-md-12 mt-2">



				<div class="card   mx-auto ">

					<div class="card-body row">

						<div class="col-md-12">

							<h1>Category Management</h1>
							<form:form method="POST" action="account"
								modelAttribute="category" enctype="multipart/form-data">
								<div>
									<h6 class="fw-bold mt-3 text-primary">Mã Category</h6>
									<form:input name="maloai" cssClass="form-control" path="maLoai" />
									<form:errors path="maLoai" cssClass="error text-danger fw-bold" />
								</div>
								<div>
									<h6 class="fw-bold mt-3 text-primary">Tên Category</h6>
									<form:input cssClass="form-control" path="tenLoai" type="Text" />
									<form:errors path="tenLoai" cssClass="error text-danger fw-bold" />
								</div>
								<div>
								
								<button class="button mt-3 "  formaction="/choose/category/save" type="submit">Save</button>
								<button class="button mt-3 ms-3"  formaction="/choose/category/update" type="submit">Update</button>
								<button class="button mt-3 ms-3"  formaction="/choose/category/delete" type="submit">Delete</button>
								<button class="button mt-3 ms-3"  formaction="/choose/category/clear" type="submit">Clear</button>
							</form:form>



						</div>

						<div class="col-md-12 mt-3">

							<table class="table text-center ">
								<thead class="table-danger">
									<tr>
										<th>Mã Loại</th>
										<th>Tên Loại</th>
										<th>ACTION</th>
									</tr>
								</thead>
								<tbody>
							 <c:forEach var="ca" items="${category1}">
									<tr>
									<td class="align-middle"> ${ca.maLoai}</td>
									<td class="align-middle"> ${ca.tenLoai}</td>
									
									<td class="align-middle"> 
									
									<a href="/choose/category/delete1/${ca.maLoai}">   <img alt="" src="/img/icons8-delete-40.png">  </a>
									
									<a href="/choose/category/edit1/${ca.maLoai}"> <img alt="" src="/img/icons8-up-40.png">  </a>
									
									 </td>
									</tr>
								
									</c:forEach> 
								</tbody>
							</table>


						</div>



					</div>

				</div>

			</div>

		</div>

	</div>





</body>
</html>



