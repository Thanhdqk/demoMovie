package com.BaiTapLab.vnpay;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.method.HandlerMethod;

import com.BaiTapLab.Repository.ChitietMovieReposiritory;
import com.BaiTapLab.Repository.HoaDonRepository;
import com.BaiTapLab.Repository.MovieRepository;

import com.BaiTapLab.Service.UserService;
import com.BaiTapLab.Entity.ChiTietMovie;
import com.BaiTapLab.Entity.HoaDon;
import com.BaiTapLab.Entity.Movie;
import com.BaiTapLab.Entity.User;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class ajaxServlet {

	public String createPayment(@RequestParam("payment_method") String bankcode, HttpServletRequest req,
			ServletContext context, HoaDonRepository daoHoadonRepo, UserService userService1, HttpSession session,
			MovieRepository movieRepository, ChitietMovieReposiritory daoChitietMovie) throws UnsupportedEncodingException {
		String maMVString = (String) session.getAttribute("maMVPay");
		Optional<Movie> movie = movieRepository.findById(maMVString);
		String orderType = "other";
		//long amount = Integer.parseInt(req.getParameter("amount")) * 100;
		//String bankCode = req.getParameter("bankCode");

		String vnp_TxnRef = Config.getRandomNumber(8);
		String vnp_IpAddr = "0:0:0:0:0:0:0:1";

		System.out.println(vnp_IpAddr);
		String vnp_TmnCode = Config.vnp_TmnCode;

		//long amount = movie.get().getThanhTien();
		long amount = (long) (movie.get().getThanhTien() * 100);
 

		Map<String, String> vnp_Params = new HashMap<>();
		vnp_Params.put("vnp_Version", Config.vnp_Version);
		vnp_Params.put("vnp_Command", Config.vnp_Command);
		vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
		vnp_Params.put("vnp_Amount", String.valueOf(amount));
		vnp_Params.put("vnp_CurrCode", "VND");
		vnp_Params.put("vnp_BankCode", bankcode);
		vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
		vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
		vnp_Params.put("vnp_Locale", "vn");
		vnp_Params.put("vnp_OrderType", orderType);
		vnp_Params.put("vnp_IpAddr", vnp_IpAddr);
		vnp_Params.put("vnp_ReturnUrl", Config.vnp_ReturnUrl);

		Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String vnp_CreateDate = formatter.format(cld.getTime());
		vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

		cld.add(Calendar.MINUTE, 15);
		String vnp_ExpireDate = formatter.format(cld.getTime());
		vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

		List fieldNames = new ArrayList(vnp_Params.keySet());
		Collections.sort(fieldNames);
		StringBuilder hashData = new StringBuilder();
		StringBuilder query = new StringBuilder();
		Iterator itr = fieldNames.iterator();
		while (itr.hasNext()) {
			String fieldName = (String) itr.next();
			String fieldValue = (String) vnp_Params.get(fieldName);
			if ((fieldValue != null) && (fieldValue.length() > 0)) {
				// Build hash data
				hashData.append(fieldName);
				hashData.append('=');
				hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
				// Build query
				query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
				query.append('=');
				query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
				if (itr.hasNext()) {
					query.append('&');
					hashData.append('&');
				}
			}
		}
		String queryUrl = query.toString();
		String vnp_SecureHash = Config.hmacSHA512(Config.secretKey, hashData.toString());
		queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
		String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;

		User user = (User) context.getAttribute("loggedInUser2");

		System.out.println(movie.get().getTenMV());
		HoaDon hd = new HoaDon();
		ChiTietMovie chiTietMovie = new ChiTietMovie();

		hd.setMaHD(vnp_TxnRef);
		hd.setThanhTien(movie.get().getThanhTien());
		hd.setTenKhachHang(user.getUsername());
		hd.setSoLuongPhim(2);
		hd.setTenPhim(movie.get().getTenMV());
		hd.setPhuongThucTT(bankcode);
		hd.setUser(user);
		context.setAttribute("hoadon", hd);

		chiTietMovie.setTrangThai("Đã thanh toán");
		chiTietMovie.setUser(user);
		chiTietMovie.setMovie(movie.get());
		context.setAttribute("chitietMoive", chiTietMovie);
//		try {
//
//			daoHoadonRepo.save(hd);
//			daoChitietMovie.save(chiTietMovie);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}

		payMent pay = new payMent();
		pay.setStatus("OK");
		pay.setMessage("successfully");
		pay.setUrl(paymentUrl);
//		context.setAttribute("vnpay_url", pay.getUrl());

//		com.google.gson.JsonObject job = new JsonObject();
//		job.addProperty("code", "00");
//		job.addProperty("message", "success");
//		job.addProperty("data", paymentUrl);
//		Gson gson = new Gson();
//		resp.getWriter().write(gson.toJson(job));

		return pay.getUrl();
	}

}



