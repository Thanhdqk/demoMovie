package com.BaiTapLab.HomeController;

import java.net.http.HttpRequest;
import java.util.Optional;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.BaiTapLab.Entity.User;
import com.BaiTapLab.Repository.UserRepository;

import com.BaiTapLab.Service.*;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class QuenMKController {
	@Autowired
	HttpServletRequest req;
	
	@Autowired
	HttpServletResponse rep;
	
	 @Autowired
	    private JavaMailSender mailSender;
	@Autowired
	Cookies cookie;
	
	@Autowired
	UserRepository dao;
	@GetMapping("/quenmatkhau")
	public String getMethodName(Model model,@ModelAttribute("user")User user) {
		
		return "QuenPass";
	}
	
	@PostMapping("/quenmatkhau/send")
	public String getMethodName1(Model model,@ModelAttribute("user")User user,BindingResult error) {
		Random random = new Random();
		int so = random.nextInt(999999);
		String otp = String.valueOf(so);
		if(user.getEmail().isEmpty())
		{	
			error.rejectValue("email", "email.empty", "Please enter Email");
			return "QuenPass";
		}
		Optional<User> newuser = Optional.ofNullable(dao.findByEmail(user.getEmail()));
		if(!newuser.isPresent())
		{
			System.out.println("khong ton tai");
			return "QuenPass";
		}
		System.out.println(user.getEmail());
		Email email = new Email();
		SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(user.getEmail());
        message.setSubject("Thông báo từ hệ thống");
        message.setText(otp);
        mailSender.send(message);
        cookie.add("otp", otp, 1, rep);
        cookie.add("mail",user.getEmail() , 1, rep);
        System.out.println("gui thanh cong");
       return "redirect:/xacthuc";
	}
	
	@RequestMapping("/xacthuc")
	public String getMethodName() {
		
		return "xacthuc";
	}
	
	
	@PostMapping("/xacthuc/do")
	public String postMethodName2(
			
			@RequestParam("so1") String so1,
			@RequestParam("so2") String so2,
			@RequestParam("so3")String so3,
			@RequestParam("so4") String so4,
			@RequestParam("so5") String so5,
			@RequestParam("so6") String so6
			
			) {
		String otp = so1+so2+so3+so4+so5+so6;
		String NewOtp = cookie.get("otp", req);
		System.out.println(otp);
		System.out.println(NewOtp);
		if(!otp.equals(NewOtp))
		{
			System.out.println("sai otp");
			return "xacthuc";
		}
		return "redirect:/resetpass";
	}
	
	@RequestMapping("/resetpass")
	public String postMethodName1(@ModelAttribute("user") User user) {
		
		
		
		
		return "ResetPass";
	}
	@PostMapping("/resetpass/reset")
	public String postMethodName12(@ModelAttribute("user") User user,BindingResult error , Model model) {
		String email = cookie.get("mail", req);
		if(user.getPassword().isEmpty())
		{
			error.rejectValue("password", "password.empty", "Please enter Mật Khẩu");
			return "ResetPass";
		}
		
		User newuser = dao.findByEmail(email);
		
		newuser.setPassword(user.getPassword());
		dao.save(newuser);
		System.out.println("thanh cong");
		
		return "ResetPass";
	}
	

}
