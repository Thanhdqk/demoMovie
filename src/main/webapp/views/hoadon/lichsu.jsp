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
	<h1>HISTORY</h1>
	<table>
		<tr>
			<th>ID</th>
			<th>Payment Method</th>
			<th>Customer</th>
			<th>Movie name</th>
			<th>Total</th>
		</tr>
		
		<c:forEach var="hoadon" items="${listHoaDon}">
			<tr>
				<td>${hoadon.maHD}</td>
				<td>${hoadon.phuongThucTT}</td>
				<td>${hoadon.tenKhachHang}</td>
				<td>${hoadon.tenPhim}</td>
				<td>${hoadon.thanhTien}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>