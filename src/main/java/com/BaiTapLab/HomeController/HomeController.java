package com.BaiTapLab.HomeController;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Optional;
import java.util.TimeZone;

import org.springframework.web.servlet.LocaleResolver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.BaiTapLab.Entity.ChiTietMovie;
import com.BaiTapLab.Entity.Comment;
import com.BaiTapLab.Entity.DanhMucPhim;
import com.BaiTapLab.Entity.FavoriteMovie;
import com.BaiTapLab.Entity.Movie;
import com.BaiTapLab.Entity.User;
import com.BaiTapLab.Repository.CategotyRipository;
import com.BaiTapLab.Repository.HoaDonRepository;
import com.BaiTapLab.Repository.MovieRepository;
import com.BaiTapLab.Service.ChiTietMovieService;
import com.BaiTapLab.Service.CommentService;
import com.BaiTapLab.Service.FavoriteMovieService;
import com.BaiTapLab.Service.MovieService;
import com.BaiTapLab.Service.SessionService;
import com.BaiTapLab.Service.UserService;


import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;


@Controller
public class HomeController {
	@Autowired
	UserService userService;
	
	@Autowired
    CommentService commentService;
	
	@Autowired
	MovieService movieService;
	
	@Autowired
	SessionService sessionService;
	
	@Autowired
	MovieRepository movieRepository;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	ServletContext context;
	
	@Autowired
	HoaDonRepository daoHoadonRepo;
	
	@Autowired
	ChiTietMovieService chiTietMovieService;
	
	@Autowired
    private LocaleResolver localeResolver;
	
	@Autowired
	FavoriteMovieService favoriteMovieService;
	
	@Autowired
	CategotyRipository categoryRepository;
	
	@GetMapping("/home")
	public String home(Model model, HttpServletRequest request) {
		model.addAttribute("movies", movieService.getThanhTienBang0());
		model.addAttribute("moviesLonHonKhong", movieService.getThanhTienLonHon0());
		
		Locale locale = localeResolver.resolveLocale(request);
        TimeZone timeZone = TimeZoneUtil.getTimeZone(locale);
        
        SimpleDateFormat dateFormat = new SimpleDateFormat("EEEE, dd MMMM yyyy HH:mm:ss z", locale);
        dateFormat.setTimeZone(timeZone);

        String currentTime = dateFormat.format(new Date());

        List<DanhMucPhim> categories = categoryRepository.findAll();
        model.addAttribute("categories", categories);
        model.addAttribute("currentTime", currentTime);
		return "index";
	}
	
	@GetMapping("/category/{maLoai}")
    public String moviesByCategory(@PathVariable("maLoai") String maLoai, Model model, HttpServletRequest request) {
        List<Movie> movies = movieService.findByCategory(maLoai);
        model.addAttribute("moviesByCategory", movies);

        Locale locale = localeResolver.resolveLocale(request);
        TimeZone timeZone = TimeZoneUtil.getTimeZone(locale);

        SimpleDateFormat dateFormat = new SimpleDateFormat("EEEE, dd MMMM yyyy HH:mm:ss z", locale);
        dateFormat.setTimeZone(timeZone);

        String currentTime = dateFormat.format(new Date());

        List<DanhMucPhim> categories = categoryRepository.findAll();
        model.addAttribute("categories", categories);
        model.addAttribute("currentTime", currentTime);
        return "indexCategory"; // return the same index view
    }
	
	@GetMapping("/free")
	public String phimfree(Model model, HttpServletRequest request) {
		model.addAttribute("movies", movieService.getThanhTienBang0());
		
		Locale locale = localeResolver.resolveLocale(request);
        TimeZone timeZone = TimeZoneUtil.getTimeZone(locale);
        
        SimpleDateFormat dateFormat = new SimpleDateFormat("EEEE, dd MMMM yyyy HH:mm:ss z", locale);
        dateFormat.setTimeZone(timeZone);

        String currentTime = dateFormat.format(new Date());

        List<DanhMucPhim> categories = categoryRepository.findAll();
        model.addAttribute("categories", categories);
        model.addAttribute("currentTime", currentTime);
		return "indexFree";
	}
	
	@GetMapping("/charge")
	public String phimcharge(Model model, HttpServletRequest request) {
		model.addAttribute("moviesLonHonKhong", movieService.getThanhTienLonHon0());
		
		Locale locale = localeResolver.resolveLocale(request);
        TimeZone timeZone = TimeZoneUtil.getTimeZone(locale);
        
        SimpleDateFormat dateFormat = new SimpleDateFormat("EEEE, dd MMMM yyyy HH:mm:ss z", locale);
        dateFormat.setTimeZone(timeZone);

        String currentTime = dateFormat.format(new Date());

        List<DanhMucPhim> categories = categoryRepository.findAll();
        model.addAttribute("categories", categories);
        model.addAttribute("currentTime", currentTime);
		return "indexCharge";
	}
//	@GetMapping("/home")
//    public String home(Model model, HttpServletRequest request) {
//        Locale locale = localeResolver.resolveLocale(request);
//        TimeZone timeZone = TimeZoneUtil.getTimeZone(locale);
//        
//        SimpleDateFormat dateFormat = new SimpleDateFormat("EEEE, dd MMMM yyyy HH:mm:ss z", locale);
//        dateFormat.setTimeZone(timeZone);
//
//        String currentTime = dateFormat.format(new Date());
//
//        model.addAttribute("currentTime", currentTime);
//        return "index";
//    }
	
	@GetMapping("/search/find")
	public String search(Model model, @RequestParam("findName") Optional<String> findName) {
	    if (findName.isPresent() && !findName.get().isEmpty()) {
	        List<Movie> findMovie = movieService.findByTenMovie(findName.get());
	        if (findMovie.isEmpty()) {
	            model.addAttribute("message", "Tên phim không tồn tại.");
	        } else {
	            model.addAttribute("findNameMovies", findMovie);
	            
	            List<ChiTietMovie> chitiets = chiTietMovieService.getAll();
	            model.addAttribute("chiTiets", chitiets);
	            
	            List<FavoriteMovie> favorite = favoriteMovieService.getAll();
	            model.addAttribute("favoriteMovie", favorite);
	        }
	    } else {
	        model.addAttribute("message", "Không tìm thấy phim nào.");
	    }
	    return "anime-search1";
	}
	
	@GetMapping("/login")
	public String login(Model model) {
		model.addAttribute("user", new User());
		return "login";
	}
	
	@GetMapping("/admin/home")
	public String homeLogin(){
		return "ChooseFunction";
	}
	
	//Login của Thành
//	@PostMapping("/login/save")
//	public String loginSave(@Valid @ModelAttribute("user") User user, BindingResult result, Model model) {
//	    Optional<User> optionalUser = userService.findByUsernameAndPassword(user.getUsername(), user.getPassword());
//	    if (optionalUser.isPresent()) {
//	        User loggedInUser = optionalUser.get();
//	        session.setAttribute("loggedInUser", loggedInUser);
//	        
//	        sessionService.set("user", user);
//			String uri = (String) sessionService.get("security-uri");
//			if (uri!=null && loggedInUser.getUsername().equalsIgnoreCase("")) {
//				return "redirect:" + uri;
//			}
//			else if ("Admin".equals(loggedInUser.getVaiTro())) {
//	        	model.addAttribute("successMessage1", "Login successful as Admin.");
//	            //return "userManagement";
//	            return "redirect:/home/login";
//	        } else if ("User".equals(loggedInUser.getVaiTro())) {
//	        	model.addAttribute("successMessage", "Login successful as User.");
//	            //return "redirect:/home";
//	            return "index";
//	        }else if ("Customer".equals(loggedInUser.getVaiTro())) {
//	        	model.addAttribute("successMessage", "Login successful as Customer.");
//	            return "redirect:/home";
//	            //return "index";
//	        }
//	    } else {
//	        model.addAttribute("loginError", "Invalid username or password");
//	        return "login";
//	    }
//	    if(result.hasErrors()) {
//	    	return "login";
//	    }
//	    
//	    return "login";
//	}
	
	//Login của Phát
	@PostMapping("/login/save")
	public String loginSave(@Valid @ModelAttribute("user") User user, BindingResult result, Model model, HttpServletRequest req) {
		String loginError1 = (String) session.getAttribute("loginError1");
	    if (loginError1 != null) {
	        model.addAttribute("loginError1", loginError1);
	        session.removeAttribute("loginError1"); // Xóa thông báo lỗi khỏi session sau khi đã lấy
	    }
		Optional<User> optionalUser = userService.findByUsernameAndPassword(user.getUsername(), user.getPassword());
	    if (optionalUser.isPresent()) {
	        User loggedInUser = optionalUser.get();
	        session.setAttribute("loggedInUser", loggedInUser);
	        context.setAttribute("loggedInUser2", loggedInUser);
	        sessionService.set("user", user);
			String uri = (String) sessionService.get("security-uri");
			
			if (uri!=null && loggedInUser.getUsername().equalsIgnoreCase("")) {
				return "redirect:" + uri;
			}
			else if ("Admin".equalsIgnoreCase(loggedInUser.getVaiTro())) {
	        	model.addAttribute("successMessage1", "Login successful as Admin.");
	            //return "userManagement";
	            //return "ChooseFunction";
	            return "ChooseFunction";
	        } else if ("Staff".equalsIgnoreCase(loggedInUser.getVaiTro())) {
	        	model.addAttribute("successMessage", "Login successful as User.");
	            //return "redirect:/home";
	        	return "ChooseFunction";
	        }else if ("Customer".equals(loggedInUser.getVaiTro())) {
	        	model.addAttribute("successMessage", "Login successful as User.");
	            return "redirect:/home";
	            //return "index";
	        }
	    } else {
	        model.addAttribute("loginError", "Invalid username or password");
	        return "login";
	    }
	    if(result.hasErrors()) {
	    	return "login";
	    }
	    
	    return "login";
	}
	

	@GetMapping("/signup")
	public String signup(@ModelAttribute("user") User user, Model model) {
		model.addAttribute("user", new User());
		return "signup";
	}
	
//	@PostMapping("/signup/register")
//	public String register(@ModelAttribute("user") User1 user, Model model) {
//		userService1.saveUser(user);
//		model.addAttribute("loginSucces", "Login Success !");
//		return "redirect:/login";
//	}
	@PostMapping("/signup/register")
	public String register(@Valid @ModelAttribute("user") User user, BindingResult error, Model model) {
	    if (error.hasErrors()) {
	        return "signup";
	    }

	    Optional<User> option = userService.findByUsername(user.getUsername());
	    if (option.isPresent()) {
	        User logged = option.get();
	        if (logged.getUsername().equalsIgnoreCase(user.getUsername()) 
	                || logged.getEmail().equalsIgnoreCase(user.getEmail())) {
	            model.addAttribute("exist", "Username or Email is exist");
	            return "signup";
	        } else {
	            userService.saveUser(user);
	            return "login";
	        }
	    } else {
	    	model.addAttribute("signupSuccess", "SignUp Success !");
	        userService.saveUser(user);
	        return "login";
	    }
	}
	
	@GetMapping("/admin/user1")
	public String getUser(Model model) {
		List<User> listAll = userService.getAll();
		model.addAttribute("users", listAll);
		//model.addAttribute("user", new User1());
		User user = new User();
	    user.setVaiTro("Admin"); // Đặt giá trị mặc định cho vaiTro là "Admin"
	    model.addAttribute("user", user);
		return "userManagement";
	}
	
//	@PostMapping("/user1/save")
//	public String save(@ModelAttribute("user") User1 user, Model model) {
//		userService1.saveUser(user);
//	    List<User1> listAll = userService1.getAll();
//	    model.addAttribute("users1", listAll);
//	    return "userManagement";
//	}
	@PostMapping("/admin/user1/save")
	public String Save(@Validated @ModelAttribute("user") User user,BindingResult result , Model model)
	{
		if(result.hasErrors())
		{
			System.out.println("co loi");
			List<User> listAll = userService.getAll();
		    model.addAttribute("users1", listAll);
			return "userManagement";
		}
		model.addAttribute("user", new User());
		userService.saveUser(user);
		List<User> listAll = userService.getAll();
	    model.addAttribute("users", listAll);
		return "userManagement";
	}
	
	@PostMapping("/admin/user1/update")
	public String update(@ModelAttribute("user") User user, Model model) {
		userService.saveUser(user);
	    List<User> listAll = userService.getAll();
	    model.addAttribute("users", listAll);
	    return "userManagement";
	}
	
	@PostMapping("/admin/user1/delete")
	public String save(@ModelAttribute("user") User user, @RequestParam Integer id, Model model) {
		model.addAttribute("user", new User());
		User user1 = new User();
	    user1.setVaiTro("Admin"); // Đặt giá trị mặc định cho vaiTro là "Admin"
	    model.addAttribute("user", user);
		userService.deleteUser(id);
	    List<User> listAll = userService.getAll();
	    model.addAttribute("users", listAll);
	    return "userManagement";
	}
	
	@PostMapping("/admin/user1/clear")
	public String clear(Model model) {
	    model.addAttribute("user", new User()); // Khởi tạo một user mới để xóa các trường nhập liệu trên form
	    List<User> listAll = userService.getAll();
	    model.addAttribute("users", listAll);
	    User user = new User();
	    user.setVaiTro("Admin"); // Đặt giá trị mặc định cho vaiTro là "Admin"
	    model.addAttribute("user", user);
	    return "userManagement";
	}
	
	@GetMapping("/admin/user1/edit")
    public String editUser(@RequestParam Integer id, Model model) {
        User user = userService.getUserById(id);
        model.addAttribute("user", user);
        List<User> listAll = userService.getAll();
	    model.addAttribute("users", listAll);
        return "userManagement";
    }
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		User accountLogin = (User) sessionService.get("user");
		if(accountLogin != null)
			sessionService.set("user", null);
	    	
	    return "redirect:/login";
	}
	

}
