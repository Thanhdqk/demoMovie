package com.BaiTapLab.Interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import com.BaiTapLab.Entity.ChiTietMovie;
import com.BaiTapLab.Entity.HoaDon;
import com.BaiTapLab.Entity.User;
import com.BaiTapLab.Repository.ChitietMovieReposiritory;
import com.BaiTapLab.Repository.HoaDonRepository;
import com.BaiTapLab.Service.SessionService;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


//@Service
//public class AuthInterceptor implements HandlerInterceptor {
//	@Autowired
//	SessionService session;
//
//	@Override
//    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
//            throws Exception {
//        String uri = request.getRequestURI();
//        User user = (User) session.get("user"); // lấy từ session
//        String error = "";
//        if (user == null) { // chưa đăng nhập
//            error = "Please login!";
//        } else if (!user.equals("Admin") && uri.startsWith("/admin/")) {
//            error = "Access denied!";
//        }
//        if (error.length() > 0) { // có lỗi
//            session.set("security-uri", uri);
//            response.sendRedirect("/login?error=" + error);
//            return false;
//        }
//        return true;
//    }
//}

@Service
public class AuthInterceptor implements HandlerInterceptor {
	@Autowired
	SessionService session;
	
	@Autowired
    private HttpSession session1;
	
	@Autowired
	ServletContext context;
	@Autowired
	ChitietMovieReposiritory daoChitietMovie;

	@Autowired
	HoaDonRepository daoHoadonRepo;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	    String uri = request.getRequestURI();
	    User user = (User) session1.getAttribute("loggedInUser"); // lấy từ session
	    String error = "";

	    // Logging để kiểm tra giá trị
	    System.out.println("Request URI: " + uri);
	    if (user != null) {
	        System.out.println("User role: " + user.getVaiTro());
	    }

	    if (user == null) { // chưa đăng nhập
	        error = "Please login!";
	    } else if ("Admin".equalsIgnoreCase(user.getVaiTro()) && 
	               (uri.startsWith("/home") || uri.startsWith("/choose/category") || uri.startsWith("/movie/choose/movie") || uri.startsWith("/mailer"))) {
	        error = "Admin do not have this authority !";
	    } else if ("Customer".equalsIgnoreCase(user.getVaiTro()) && uri.startsWith("/admin")) {
	        error = "Customer do not have this authority !";
	    } else if ("Staff".equalsIgnoreCase(user.getVaiTro()) && 
	               (uri.startsWith("/admin/user1") || uri.startsWith("/report"))) {
	        error = "Staff do not have this authority !";
	    } else if (uri.contains("/movie/vnpay/result")) {
	        if ("00".equals(request.getParameter("vnp_ResponseCode"))) {
	            HoaDon hoaDon = (HoaDon) context.getAttribute("hoadon");
	            ChiTietMovie chiTietMovie = (ChiTietMovie) context.getAttribute("chitietMoive");
	            daoChitietMovie.save(chiTietMovie);
	            daoHoadonRepo.save(hoaDon);
	        }
	    } else if (uri.contains("/paymentv2/Ncb/Transaction/Confirm.html")) {
	        System.out.println("mailsend");
	    }

	    if (!error.isEmpty()) { // có lỗi
	        session1.setAttribute("security-uri", uri);
	        session1.setAttribute("loginError1", error);
	        response.sendRedirect("/login?error=" + error);
	        return false;
	    }
	    return true;
	}

}


