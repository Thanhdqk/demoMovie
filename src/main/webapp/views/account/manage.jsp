<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <title>Manage Account</title>
</head>
<body>
	<h1>Quản lý tài khoản</h1>
	<img alt="" src="/img/user.jsp">
	<form:form modelAttribute="user" method="post">
		Username:
		<form:input path="username" value="${user.username}"/>
		Password:
		<form:input path="password" value="${user.password}"/>
		Email:
		<form:input path="email" value="${user.email}"/>
		Vai trò:
		<form:radiobutton path="vaiTro" value="${user.vaiTro}" label="Customer"/>
		
		<form:button formaction="/account/update" type="submit">Update</form:button>
		
	</form:form>
	
	<form:form action="/account/change" method="get">
		<button>Change Password</button>
	</form:form>
	
<%-- 	 <h3>Change Password</h3>
    
    <form action="/account/change" method="post">
        <label for="currentPassword">Current Password:</label>
        <input type="password" id="currentPassword" name="currentPassword" required /><br/>
        
        <label for="newPassword">New Password:</label>
        <input type="password" id="newPassword" name="newPassword" required /><br/>
        
        <button type="submit">Change Password</button>
    </form> --%>

    

	<c:if test="${not empty successMessage}">
        <div style="color: green;">${successMessage}</div>
    </c:if>
    
    <c:if test="${not empty errorMessage}">
        <div style="color: red;">${errorMessage}</div>
    </c:if>
</body>
</html>
