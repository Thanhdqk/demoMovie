package com.BaiTapLab.HomeController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.BaiTapLab.Entity.User;
import com.BaiTapLab.Service.UserService;

import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;



@Controller
@RequestMapping("/account")
public class CustomerController {
	@Autowired
	UserService userService;
	@Autowired
	HttpSession session;
	
	@GetMapping("/manage")
	public String postMethodName(@ModelAttribute("user") User user, Model model) {
		User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null) {
            model.addAttribute("user", loggedInUser);
        }else {
        	return "login";
        }
		return "manage";
	
	}
	
	@PostMapping("/update")
	public String update(@ModelAttribute("user") User user, Model model, HttpSession session) {
	    User loggedInUser = (User) session.getAttribute("loggedInUser");
	    if (loggedInUser != null) {
	        // Lấy đối tượng người dùng hiện tại từ cơ sở dữ liệu
	        User currentUser = userService.getUserById(loggedInUser.getId());
	        if (currentUser != null) {
	            // Cập nhật các thuộc tính
	            currentUser.setEmail(user.getEmail());
	            currentUser.setPassword(user.getPassword());
	            // Thêm các thuộc tính cần cập nhật khác ở đây
	            
	            userService.saveUser(currentUser);
	            session.setAttribute("loggedInUser", currentUser);
	            model.addAttribute("successMessage", "Account updated successfully");
	        }
	    }
	    return "manage";
	}
	
	@GetMapping("/change")
	public String change(Model model) {
		return "changepass";
	}
	
	@PostMapping("/changepass")
    public String changePassword(@ModelAttribute("user") User user, 
    						     @RequestParam("currentPassword") String currentPassword,
                                 @RequestParam("newPassword") String newPassword,
                                 Model model) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null) {
            User currentUser = userService.getUserById(loggedInUser.getId());
            if (currentUser != null && currentPassword.equalsIgnoreCase(currentUser.getPassword())) {
                currentUser.setPassword(newPassword);
                userService.saveUser(currentUser);
                model.addAttribute("successMessage", "Password changed successfully");
                session.setAttribute("loggedInUser", currentUser);
            } else {
                model.addAttribute("errorMessage", "Current Password is incorrect");
            }
        }
        //return "redirect:/account/change";
        return "changepass";
    }
}
    

