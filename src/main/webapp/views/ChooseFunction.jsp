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
/* body {
	background: rgb(2, 0, 36);
	background: linear-gradient(90deg, rgba(2, 0, 36, 1) 0%,
		rgba(9, 9, 121, 1) 35%, rgba(0, 212, 255, 1) 100%);
}  */

</style>
</head>
<body>
				
	<div class="container">
		<div class="row mt-5">
			<div class="col-md-12 mt-5">
					
				<div class="mx-auto w-100">
					
					<div class="card-body row">
						<div class="col-md-4">
							<div class="card" style="width: 18rem;">
								<a href=""><img src="/img/user2.png" class="card-img-top" alt="..."></a>
								<div class="card-body mx-auto">
									<h5 class="card-title">Account-Manager</h5>
									
									<a href="/admin/user1" style="margin-left: 30px" class="btn btn-primary">Click here</a>
								</div>
							</div>
						</div>

						<div class="col-md-4">
							<div class="card" style="width: 18rem;">
							<a href=""><img src="/img/movie.png" class="card-img-top mb-2" alt="..."></a>
								<div class="card-body mx-auto">
									<h5 class="card-title">Movie Manager</h5>
									
									<a href="/movie/choose/movie" style="margin-left: 30px" class="btn btn-primary">Click here</a>
								</div>
							</div>
						</div>

						<div class="col-md-4">
							<div class="card" style="width: 18rem;">
								<a href=""><img src="/img/category.png" class="card-img-top" alt="..."></a>
								<div class="card-body mx-auto">
									<h5 class="card-title">Category Manager</h5>
									
									<a href="/choose/category" style="margin-left: 30px" class="btn btn-primary">Click here</a>
								</div>
							</div>
						</div>

                        <div class="col-md-4">
							<div class="card" style="width: 18rem;">
								<a href=""><img src="/img/email.png" class="card-img-top" alt="..." width="75"></a>
								<div class="card-body mx-auto">
									<h5 class="card-title">Send Mail</h5>
									
									<a href="/mailer" style="margin-left: -5px" class="btn btn-primary">Click here</a>
								</div>
							</div>
						</div>

                        <div class="col-md-4">
							<div class="card" style="width: 18rem;">
								<a href=""><img src="/img/report.png" class="card-img-top" alt="..."></a>
								<div class="card-body mx-auto">
									<h5 class="card-title">Report</h5>
									
									<a href="/report" style="margin-left: -10px" class="btn btn-primary">Click here</a>
								</div>
							</div>
						</div>

                        <!-- <div class="col-md-4">
							<div class="card" style="width: 18rem;">
								<a href=""><img src="/img/logut.png" class="card-img-top" alt="..."></a>
								<div class="card-body mx-auto">
									<h5 class="card-title">Logout</h5>
									
									<a href="/choose/category" style="margin-left: -10px" class="btn btn-primary">Click here</a>
								</div>
							</div>
						</div> -->
						
						<c:if test="${not empty sessionScope.loggedInUser}">
								<%-- <div>
									<a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/logout">Logout</a>
							</div> --%>
							
							<div class="col-md-4">
							<div class="card" style="width: 18rem;">
								<a href=""><img src="/img/logut.png" class="card-img-top" alt="..."></a>
								<div class="card-body mx-auto">
									<!-- <h5 class="card-title">Logout</h5> -->
									<c:if test="${not empty sessionScope.loggedInUser}">
										<div>
											<span style="font-weight: bold; font-size: x-large; color: orange;">Hi, ${sessionScope.loggedInUser.username}</span> 
										</div>
									</c:if>
									<a href="${pageContext.request.contextPath}/logout" style="margin-left: 10px" class="btn btn-primary">Logout</a>
								</div>
							</div>
						</div>
						</c:if>
						
					</div>
				</div>
			</div>
</body>
</html>