<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <c:if test="${not empty message}">
        <p>${message}</p>
    </c:if>
	<h1>Search</h1>
	
	<table>
		<tr>
			<th>Mã movie</th>
			<th>Tên movie</th>

		</tr>
		
		<c:forEach var="movie" items="${findNameMovies}">
			<tr>
				<td>${movie.maMV}</td>
				<td>${movie.tenMV}</td>
				<td><img alt="" src="/img/${movie.hinhAnh}.jpg"></td>
			</tr>
		</c:forEach>
	</table>
	
	
</body>
</html>