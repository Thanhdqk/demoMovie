<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send mail</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<style type="text/css">
*{
	--formWidth:460px;
	--btnWidth:70px;
	--btnCenter:195px;
}
.formMailer{
	width: var(--formWidth);
	margin: auto;
	margin-top: 1rem;
}
h2{
	color:#0000FF;
}
.btnSend{
	margin-top: 1.5rem;
	margin-left: var(--btnCenter);
	width: var(--btnWidth);
	font-size:25px;
}
.btnMore{
	margin-top:1rem;
}
.file-input-group {
    display: flex;
    align-items: center;
    margin-top: 0.5rem;
}
.file-input-group input {
    margin-right: 0.5rem;
}
.file-input-group button {
    background-color: red;
    color: white;
    border: none;
    border-radius: 5px;
    padding: 0.3rem 0.5rem;
}
</style>
</head>
<body>
	<c:if test="${not empty sendMailSuccess}">
		<script>
			alert("${sendMailSuccess}");
		</script>
	</c:if> 
	<c:if test="${not empty sendMailError}">
		<script>
			alert("${sendMailError}");
		</script>
	</c:if> 
	<form enctype="multipart/form-data" class="formMailer" action="/mailer/send"  method="post">
		<h2>Gửi email</h2>
		<div class="form-group">
			<label for="formControlInput">To</label> <input
				type="email" class="form-control" id="formControlInput" name="txtTo"
				placeholder="Nhập email người nhận...">
		</div>
		<div class="form-group">
			<label for="formControlInput2">CC</label> <input
				type="text" class="form-control" id="formControlInput2" name="txtCC"
				placeholder="Nhập email(cc) ngăn cách nhau bởi dấu ','">
		</div>
		<div class="form-group">
			<label for="formControlInput3">BCC</label> <input
				type="text" class="form-control" id="formControlInput3" name="txtBCC"
				placeholder="Nhập email(bcc) ngăn cách nhau bởi dấu ','">
		</div>
		<div class="form-group">
			<label for="formControlInput4">Tiêu đề</label> <input
				type="text" class="form-control" id="formControlInput4" name="txtSubject"
				placeholder="Nhập tiêu đề...">
		</div>
		<div class="form-group">
			<label for="formControlTextarea">Nội dung</label>
			<textarea class="form-control" id="formControlTextarea" name="txtContent"
				rows="4" placeholder="Nhập nội dung..."></textarea>
		</div>
		<div class="form-group">
			<label for="formControlInput4">File đính kèm</label> 
			<div id="fileInputs">
				<div class="file-input-group">
					<input type="file" class="form-control" name="files">
				</div>
			</div>
		</div>
		<div class="btn btn-info btnMore" id="btnMore">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
		  		<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
		  		<path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
			</svg>
		 Thêm tệp</div>
		<button class="btn btn-success btnSend">Gửi</button>
	</form>
	<script type="text/javascript">
		const btnMore = document.getElementById('btnMore');
		const fileInputs = document.getElementById("fileInputs");

		btnMore.addEventListener('click', () => {
			const div = document.createElement('div');
			div.classList.add('file-input-group');
			div.innerHTML = `
				<input type="file" class="form-control" name="files">
				<button type="button" class="btnRemove">-</button>
			`;
			fileInputs.appendChild(div);

			const btnRemove = div.querySelector('.btnRemove');
			btnRemove.addEventListener('click', () => {
				fileInputs.removeChild(div);
			});
		});
	</script>
</body>
</html>
