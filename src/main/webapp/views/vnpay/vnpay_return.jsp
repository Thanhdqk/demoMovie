<%@page import="java.net.URLEncoder"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="com.BaiTapLab.vnpay.Config"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<title>KẾT QUẢ THANH TOÁN</title>
<!-- Bootstrap core CSS -->
<link href="/vnpay_jsp/assets/bootstrap.min.css" rel="stylesheet" />
<!-- Custom styles for this template -->
<link href="/vnpay_jsp/assets/jumbotron-narrow.css" rel="stylesheet">
<script src="/vnpay_jsp/assets/jquery-1.11.3.min.js"></script>
<style type="text/css">
@import
	url("https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800&display=swap")
	;

body {
	background-color: #eee;
	font-family: "Poppins", sans-serif;
	font-weight: 300
}

.cart {
	height: 100vh
}

.progresses {
	display: flex;
	align-items: center
}

.line {
	width: 76px;
	height: 6px;
	background: #63d19e
}

.steps {
	display: flex;
	background-color: #63d19e;
	color: #fff;
	font-size: 12px;
	width: 30px;
	height: 30px;
	align-items: center;
	justify-content: center;
	border-radius: 50%
}

.check1 {
	display: flex;
	background-color: #63d19e;
	color: #fff;
	font-size: 17px;
	width: 60px;
	height: 60px;
	align-items: center;
	justify-content: center;
	border-radius: 50%;
	margin-bottom: 10px
}

.invoice-link {
	font-size: 15px
}

.order-button {
	height: 50px
}

.background-muted {
	background-color: #fafafc
}
</style>
</head>

<body
	style="background-image: linear-gradient(to right bottom, #6d94d0, #238cad, #1f7d7e, #3d6a53, #4c5537);">
	<%
	//Begin process return from VNPAY
	Map fields = new HashMap();
	for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
		String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
		String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
		if ((fieldValue != null) && (fieldValue.length() > 0)) {
			fields.put(fieldName, fieldValue);
		}
	}

	String vnp_SecureHash = request.getParameter("vnp_SecureHash");
	if (fields.containsKey("vnp_SecureHashType")) {
		fields.remove("vnp_SecureHashType");
	}
	if (fields.containsKey("vnp_SecureHash")) {
		fields.remove("vnp_SecureHash");
	}
	String signValue = Config.hashAllFields(fields);
	%>
	<!--Begin display -->
	<div class="container">

		<div class="container-fluid">
			<div class="row mt-1 align-items-start p-2 ">
				<div class="col-12">
					<main class="row justify-content-center">
						<div
							class="text-center col-12 col-sm-8 bg-light p-5 my-5 border border-0 rounded-5">
							<div class="card">

								<div class="card-body">

									<div class="header clearfix">
										<h3 class="text-muted">KẾT QUẢ THANH TOÁN</h3>
									</div>
									<div class="table-responsive">
										<div class="form-group">
											<label>Mã giao dịch thanh toán:</label> <label><%=request.getParameter("vnp_TxnRef")%></label>
										</div>
										<div class="form-group">
											<label>Số tiền:</label> <label><%=request.getParameter("vnp_Amount")%></label>
										</div>
										<div class="form-group">
											<label>Mô tả giao dịch:</label> <label><%=request.getParameter("vnp_OrderInfo")%></label>
										</div>
										<div class="form-group">
											<label>Mã lỗi thanh toán:</label> <label><%=request.getParameter("vnp_ResponseCode")%></label>
										</div>
										<div class="form-group">
											<label>Mã giao dịch tại CTT VNPAY-QR:</label> <label><%=request.getParameter("vnp_TransactionNo")%></label>
										</div>
										<div class="form-group">
											<label>Mã ngân hàng thanh toán:</label> <label><%=request.getParameter("vnp_BankCode")%></label>
										</div>
										<div class="form-group">
											<label>Thời gian thanh toán:</label> <label><%=request.getParameter("vnp_PayDate")%></label>
										</div>
										<div class="form-group">
											<label>Tình trạng giao dịch:</label> <label> <%
 if (signValue.equals(vnp_SecureHash)) {
 	if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
 		out.print("Thành công");
 	} else {
 		out.print("Không thành công");
 	}

 } else {
 	out.print("invalid signature");
 }
 %></label>
										</div>
									</div>
									<p>&nbsp;</p>

								</div>
							</div>
							<div class="card-footer">
								<footer class="footer">
									<p>&copy; VNPAY 2020</p>
								</footer>
							</div>
						</div>
					</main>
				</div>
			</div>

		</div>
	</div>
	<div class="container mt-4 mb-4">
		<div class="row d-flex cart align-items-center justify-content-center">
			<div class="col-md-10">
				<div class="card">
					<div class="d-flex justify-content-center border-bottom">
						<div class="p-3">
							<div class="progresses">
								<div class="steps">
									<span><i class="fa fa-check"></i></span>
								</div>
								<span class="line"></span>
								<div class="steps">
									<span><i class="fa fa-check"></i></span>
								</div>
								<span class="line"></span>
								<div class="steps">
									<span class="font-weight-bold">3</span>
								</div>
							</div>
						</div>
					</div>
					<div class="row g-0">
						<div class="col-md-6 border-right p-5">
							<div class="text-center order-details">
								<div
									class="d-flex justify-content-center mb-5 flex-column align-items-center">
									<span class="check1"><i class="fa fa-check"></i></span> <span
										class="font-weight-bold">Order Confirmed</span> <label>Tình
										trạng giao dịch:</label> <label> <%
 if (signValue.equals(vnp_SecureHash)) {
 	if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
 		out.print("Thành công");
 	} else {
 		out.print("Không thành công");
 	}

 } else {
 	out.print("invalid signature");
 }
 %></label>
	
								</div>
								<label>Số tiền:</label> <label><%=request.getParameter("vnp_Amount")%>VND</label>
							</div>
						</div>
						<div class="col-md-6 background-muted">
							<div class="p-3 border-bottom text-center">
								<div class="mt-3">
									<div class="form-group">
										<label>Mã giao dịch thanh toán:</label> <label><%=request.getParameter("vnp_TxnRef")%></label>
									</div>
								</div>
								<div class="mt-3">
									
									<div class="d-flex flex-column mt-3">
										<label>Mã ngân hàng thanh toán:</label> <label><%=request.getParameter("vnp_BankCode")%></label>
									</div>
								</div>
							</div>
							<div class="row g-0 border-bottom">
								<div class="col-md-6 border-right">
									<div
										class="p-3 d-flex justify-content-center align-items-center">
										<span>x3</span>
									</div>
								</div>
								<div class="col-md-6">
									<div
										class="p-3 d-flex justify-content-center align-items-center">
										<span>$20 per unit</span>
									</div>
								</div>
							</div>
							<div class="row g-0 border-bottom">
								<div class="col-md-6">
									<div
										class="p-3 d-flex justify-content-center align-items-center">
										<span>Subtotal</span>
									</div>
								</div>
								<div class="col-md-6">
									<div
										class="p-3 d-flex justify-content-center align-items-center">
										<span>$60</span>
									</div>
								</div>
							</div>
						
						</div>
					</div>
					<div></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
