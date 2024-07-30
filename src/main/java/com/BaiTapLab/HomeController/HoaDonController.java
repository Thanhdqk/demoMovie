package com.BaiTapLab.HomeController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.BaiTapLab.Entity.HoaDon;
import com.BaiTapLab.Entity.User;
import com.BaiTapLab.Repository.HoaDonRepository;
import com.BaiTapLab.Service.HoaDonService;
import com.BaiTapLab.Service.UserService;

import jakarta.servlet.http.HttpSession;


@RequestMapping("hoadon")
@Controller
public class HoaDonController {
	@Autowired
	HoaDonService hoaDonService;

	@Autowired
	HttpSession session;
	
	@Autowired
	HoaDonRepository dao;
	
	
	@GetMapping("")
	public String show(Model model, @ModelAttribute("user") User user) {
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		if(loggedInUser!=null) {
			List<HoaDon> maUser =  hoaDonService.getHoaDonsByUserId(loggedInUser.getId());
			model.addAttribute("listHoaDon", maUser);
			return "lichsumuahang";
		} 
		else {
			return "login";
		}
	}
	
	@ResponseBody
	@PostMapping("/hoadon/save")
	public String create() {
		HoaDon hoaDon = new HoaDon();

		dao.save(null);
		return "ok";
	}
}
