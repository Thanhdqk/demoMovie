<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Favorite Movies</title>
</head>
<body>
    <h1>Your Favorite Movies</h1>
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
				<c:forEach var="favoriteMovie" items="${favoriteMovies}">
					<tr>
						<td>${counter}</td>
						<td><img src="/img/${favoriteMovie.movie.hinhAnh}.jpg" alt=""></td>
						<td>${favoriteMovie.movie.tenMV}</td>
						<td>${favoriteMovie.movie.noiDung}</td>
						<td style="display:flex">
							<form method="post" action="/movie/delete/favorites">
								<input type="hidden" name="id" value="${favoriteMovie.id}">
								<button class="btn btn-danger my-3 mx-3" type="submit">Remove</button>
							</form>
						</td>
					</tr>
					<c:set var="counter" value="${counter + 1}" />
				</c:forEach>
			</tbody>
		</table>
</body>
</html>