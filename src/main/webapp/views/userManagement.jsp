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
   background: rgb(2,0,36);
    background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(9,9,121,1) 35%, rgba(0,212,255,1) 100%);
}
</style>
</head>
<body>
 	<c:if test="${not empty successMessage1}">
						        <script>
						            alert("${successMessage1}");
						        </script>
	</c:if> 
<div class="container">
	<div class="row mt-5">
	<div class="col-md-12 mt-2">
	<div class="card   mx-auto w-75">
		<div class="card-body row">
		<div class="col-md-12">
		<h1>User Management</h1>
		<form:form method="post" modelAttribute="user">
			<label for="username" class="text-primary fw-bold mt-3 mb-1">Username:</label>
			<form:input type="hidden" path="id" />
			<form:input type="text" id="username" path="username" cssClass="form-control"/>
			<form:errors cssClass="text-danger fw-bold" path="username"></form:errors>
			<br>
			<label class="text-primary fw-bold mt-2 mb-1" for="password">Password:</label>
			<form:input cssClass="form-control" type="password" id="password" path="password" />
			<form:errors cssClass="text-danger fw-bold" path="password"></form:errors>
			<br>
			<label for="role" class="text-primary fw-bold mt-2 mb-1">Role:</label>
			<form:radiobutton cssClass="ms-3" path="vaiTro" value="Admin" label="Admin" />
			<form:radiobutton cssClass="ms-3" path="vaiTro" value="Customer" label="Customer" />
			<form:radiobutton cssClass="ms-3" path="vaiTro" value="Staff" label="Staff" />
			<br>
			<label for="email" class="text-primary fw-bold mt-3 mb-1">Email:</label>
			<form:input type="text" id="email" path="email" cssClass="form-control mb-2" />
			<form:errors cssClass="text-danger fw-bold" path="email"></form:errors>
			<br>
			<form:button formaction="/admin/user1/save" type="submit" class="btn btn-primary mt-3">Save</form:button>
			<form:button formaction="/admin/user1/update" type="submit" class="btn btn-success mt-3">Update</form:button>
			<form:button formaction="/admin/user1/delete" type="submit" class="btn btn-light mt-3">Delete</form:button>
			<form:button formaction="/admin/user1/clear" type="submit" class="btn btn-danger mt-3">Clear</form:button>
		</form:form>
	</div>
	
	<div class="col-12 mt-3">
		<table class="table-bordered text-center">
			<thead style="width=100px; background-color:orange;">
				<tr>
	                <th style="width: 100px;">ID</th>
	                <th style="width: 150px;">Username</th>
	                <th style="width: 150px;">Password</th>
	                <th style="width: 100px;">Role</th>
	                <th style="width: 200px;">Email</th>
	                <th style="width: 100px;">Action</th>
	            </tr>
			</thead>
			<tbody>
				<c:set var="counter" value="1" />
				<c:forEach var="user" items="${users}">
					<tr>
						<td>${counter}</td>
						<td>${user.username}</td>
						<td>${user.password}</td>
						<td>${user.vaiTro}</td>
						<td>${user.email}</td>
						<td style="display:flex">
							<form method="get" action="/admin/user1/edit">
								<input type="hidden" name="id" value="${user.id}">
								<button type="submit" class="btn btn-success my-3 mx-3" style="width:80px">Edit</button>
							</form>
							<form method="post" action="/admin/user1/delete">
								<input type="hidden" name="id" value="${user.id}">
								<button class="btn btn-danger my-3 mx-3" type="submit">Remove</button>
							</form>
						</td>
					</tr>
					<c:set var="counter" value="${counter + 1}" />
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