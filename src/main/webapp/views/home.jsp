<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header text-center bg-primary text-white">
                    <c:if test="${not empty sessionScope.loggedInUser}">
						<div>
							<span style="color:white; margin-right:20px; font-weight: bold">Hi, ${sessionScope.loggedInUser.username}</span> 
						</div>
					</c:if>
                        <%-- <h2 class="card-title mb-0">Welcome, ${username}!</h2> --%>
                    </div>
                    <div class="card-body text-center">
                        <%-- <img src="/views/image/${photo}" alt="User Photo" class="img-fluid rounded-circle mb-3" style="width: 150px;"> --%>
                        <div class="d-grid gap-2 d-md-flex justify-content-md-center">
                            <c:if test="${not empty sessionScope.loggedInUser}">
								<div>
									<a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/logout">Logout</a>
							</div>
							</c:if>
                            <a href="/mailer" class="btn btn-primary btn-lg">Send Email</a>
                            <a href="/admin/user1" class="btn btn-primary btn-lg">User Management</a>
                            <a href="/choose/category" class="btn btn-primary btn-lg">Category Management</a>
                            <a href="/movie/choose/movie" class="btn btn-primary btn-lg">Movie Management</a>
                            <a href="/report" class="btn btn-primary btn-lg">Report</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
