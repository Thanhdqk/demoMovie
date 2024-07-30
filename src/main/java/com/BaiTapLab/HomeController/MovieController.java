package com.BaiTapLab.HomeController;


import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.BaiTapLab.Entity.ChiTietMovie;
import com.BaiTapLab.Entity.Comment;
import com.BaiTapLab.Entity.DanhMucPhim;
import com.BaiTapLab.Entity.FavoriteMovie;
import com.BaiTapLab.Entity.Movie;
import com.BaiTapLab.Entity.User;
import com.BaiTapLab.Repository.CategotyRipository;
import com.BaiTapLab.Repository.ChitietMovieReposiritory;
import com.BaiTapLab.Repository.FavoriteMovieRepository;
import com.BaiTapLab.Repository.HoaDonRepository;
import com.BaiTapLab.Repository.MovieRepository;
import com.BaiTapLab.Service.ChiTietMovieService;
import com.BaiTapLab.Service.CommentService;
import com.BaiTapLab.Service.FavoriteMovieService;
import com.BaiTapLab.Service.MovieService;
import com.BaiTapLab.Service.UserService;

import com.BaiTapLab.vnpay.ajaxServlet;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RequestMapping("movie")
@Controller
public class MovieController {
	@Autowired
	MovieService movieService;
	
	@Autowired
    CommentService commentService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	FavoriteMovieService favoriteMovieService;
	
	@Autowired
	FavoriteMovieRepository favoriteRepository;
	
	@Autowired
	HttpServletRequest req;
	
	@Autowired
	ServletContext context;
	
	@Autowired
	MovieRepository movieRepository;
	
	@Autowired
	CategotyRipository catedao;
	
	@Autowired
	HoaDonRepository daoHoadonRepo;
	
	@Autowired
	ChitietMovieReposiritory daoChitietMovie;
	
	@Autowired
	ChiTietMovieService chiTietMovieService;
	
	ajaxServlet ajaxServlet = new ajaxServlet();
	@GetMapping("/{maMV}")
	public String findMaMV(Model model, @PathVariable("maMV") String maMV) {
		 Movie movieFindId = movieService.findByMovie(maMV);
		 model.addAttribute("movieFindId", movieFindId);
		 
		 List<Comment> comments = commentService.getCommentsByMovieId(maMV);
		 model.addAttribute("comments", comments);
		 
		 List<FavoriteMovie> favorite = favoriteMovieService.getAll();
		 model.addAttribute("favoriteMovie", favorite);
		 
		 List<ChiTietMovie> chitiets = chiTietMovieService.getAll();
		 model.addAttribute("chiTiets", chitiets);
		 
		 User user = (User) context.getAttribute("loggedInUser2");
		 List<ChiTietMovie> list = daoChitietMovie.searchByIdAndName(user.getId(), maMV);
		 model.addAttribute("payStatus", 1);
		return "anime-details";
	}
	
	@PostMapping("/{maMV}/comment")
    public String postComment(@PathVariable("maMV") String maMV, @RequestParam("content") String content) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null) {
        	User currentUser = userService.getUserById(loggedInUser.getId());
            Movie movie = movieService.findByMovie(maMV);

            Comment comment = new Comment();
            comment.setUser(currentUser);
            comment.setMovie(movie);
            comment.setContent(content);

            commentService.saveComment(comment);
        }
        return "redirect:/movie/" + maMV;
    }

	
	@PostMapping("/{maMV}/favorite")
	public String addFavoriteMovie(@PathVariable("maMV") String maMV, Model model) {
	    User loggedInUser = (User) session.getAttribute("loggedInUser");
	    if (loggedInUser != null) {
	        User user = userService.getUserById(loggedInUser.getId());
	        Movie movie = movieService.findByMovie(maMV);

	        FavoriteMovie existingFavorite = favoriteMovieService.findByUserIdAndMovieId(user.getId(), maMV);
	        
	        if (existingFavorite != null) {
	            // Bản ghi đã tồn tại, xóa nó đi
	            favoriteMovieService.deleteByUserIdAndMovieId(user.getId(), maMV);
	        } else {
//	        	model.addAttribute("existingFavorite", null);
	            // Bản ghi chưa tồn tại, thêm vào
	            FavoriteMovie favoriteMovie = new FavoriteMovie();
	            favoriteMovie.setUser(user);
	            favoriteMovie.setMovie(movie);
	            favoriteMovie.setTenMovie(movie.getTenMV());
	            favoriteMovie.setHinhAnh(movie.getHinhAnh());

	            favoriteMovieService.saveFavoriteMovie(favoriteMovie);
	            existingFavorite = favoriteMovie; // Thiết lập existingFavorite là bản ghi mới được thêm vào để hiển thị nút Unfollow
	        }
	         // Truyền existingFavorite vào model
	    }
	    return "redirect:/movie/" + maMV;
	}

    @GetMapping("/favorites")
    public String getFavoriteMovies(Model model, HttpServletRequest request) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null) {
        	User user = userService.getUserById(loggedInUser.getId());
            List<FavoriteMovie> favoriteMovies = favoriteMovieService.getFavoriteMoviesByUserId(user.getId());
            model.addAttribute("favoriteMovies", favoriteMovies);
        }
        return "favoriteMovie";
    }
    
    @PostMapping("/delete/favorites")
    public String deleteFavo(Model model, @RequestParam("id") Integer favoriteMovieId) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        favoriteMovieService.deleteFavo(favoriteMovieId);
        if (loggedInUser != null) {
        	User user = userService.getUserById(loggedInUser.getId());
            List<FavoriteMovie> favoriteMovies = favoriteMovieService.getFavoriteMoviesByUserId(user.getId());
            model.addAttribute("favoriteMovies", favoriteMovies);
        }
        return "favorite/index";
    }
	
	@GetMapping("/watching/{maMV}")
	public String findWatching(Model model, @PathVariable("maMV") String maMV) {
		 Movie movieFindId = movieService.findByMovie(maMV);
		 model.addAttribute("movieFindId", movieFindId);
		 List<Comment> comments = commentService.getCommentsByMovieId(maMV);
		 model.addAttribute("comments", comments);
		return "anime-watching";
	}
	
	@PostMapping("/watching/{maMV}")
	public String commentWatching(Model model, @PathVariable("maMV") String maMV, @RequestParam("content") String content) {
		User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null) {
        	User currentUser = userService.getUserById(loggedInUser.getId());
            Movie movie = movieService.findByMovie(maMV);

            Comment comment = new Comment();
            comment.setUser(currentUser);
            comment.setMovie(movie);
            comment.setContent(content);

            commentService.saveComment(comment);
        }
        return "redirect:/movie/watching/" + maMV;
	}
	
	@GetMapping("/pay/{maMV}")
	public String payment(@PathVariable("maMV") String maMV, Model model) throws UnsupportedEncodingException {

		System.out.println(maMV);
		session.setAttribute("maMVPay", maMV);
		User user = (User) context.getAttribute("loggedInUser2");
		System.out.println(user.getUsername());

		return "/vnpay/payment_select";
	}

	@GetMapping("/pay2")
	public String paymen2(@RequestParam("payment_method") String value, Model model)
			throws UnsupportedEncodingException {
		String maMVString = (String) session.getAttribute("maMVPay");

		System.out.println(maMVString);
		return "redirect:" + ajaxServlet.createPayment(value, req, context, daoHoadonRepo, userService, session,
				movieRepository, daoChitietMovie);

	}

	@GetMapping("/vnpay/result")
	public String vnpayResult() {
		return "/vnpay/vnpay_return";
	}

	@ResponseBody
	@GetMapping("/pay5")
	public String paymen3(Model model) {
		User user = (User) context.getAttribute("loggedInUser2");
		List<ChiTietMovie> list = daoChitietMovie.searchByIdAndName(1, "MV002");
		System.out.println(list.get(0).getTrangThai());
		return "ok";
	}
	
	// Movie Management
//	@GetMapping("/choose/movie")
//	public String get1(Model model, @ModelAttribute("movie") Movie movie)
//	{
//		List<Movie> list= movieRepository.findAll();
//		model.addAttribute("movies", list);
//		return "movieManagement";
//	}
	
	@GetMapping("/choose/movie")
	public String get1(Model model, @ModelAttribute("movie") Movie movie,
	                   @RequestParam(defaultValue = "0") int page) {
	    int pageSize = 3; // Số phần tử trên mỗi trang
	    Pageable pageable = PageRequest.of(page, pageSize);
	    Page<Movie> moviePage = movieRepository.findAll(pageable);

	    model.addAttribute("movies", moviePage.getContent());
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", moviePage.getTotalPages());

	    return "movieManagement";
	}
	
	@PostMapping("/choose/movie/save")
	public String get12(Model model,@Validated @ModelAttribute("movie") Movie movie, BindingResult error,@RequestParam("file") MultipartFile photo)
	{
		List<Movie> list= movieRepository.findAll();
		model.addAttribute("movies", list);
		System.out.println(photo);
		if (photo.isEmpty()) {
			error.rejectValue("hinhAnh", "hinhAnh.emptyFile", "Photo is required");
			System.out.println(photo.getOriginalFilename());
		}
		
		if (error.hasErrors()) {
			return "movieManagement";
		}
		
		movie.setHinhAnh(photo.getOriginalFilename());
		movieRepository.save(movie);
		 System.out.println("thêm thành công");
		return "redirect:/choose/movie";
	}
	
	@PostMapping("/choose/movie/delete")
	public String get133(Model model, @ModelAttribute("movie") Movie movie, BindingResult error)
	{
		List<Movie> list= movieRepository.findAll();
		model.addAttribute("movies", list);
		if(movie.getMaMV().isEmpty())
		{
			error.rejectValue("maMV", "maMV.empty", "Please enter Mã Movie");
			
			return "movieManagement";
		}
		
		movieRepository.deleteById(movie.getMaMV());
		System.out.println("xóa thành công");
		
		return "redirect:/choose/movie";
	}
	
	@PostMapping("/choose/movie/update")
	public String get14(Model model,@Validated @ModelAttribute("movie") Movie movie, BindingResult error,
			@RequestParam("file") MultipartFile photo)
	{
		List<Movie> list= movieRepository.findAll();
		model.addAttribute("movies", list);
		System.out.println(photo);
		if (photo.isEmpty()) {
			error.rejectValue("hinhAnh", "hinhAnh.emptyFile", "Photo is required");
			System.out.println(photo.getOriginalFilename());
		}
		
		if (error.hasErrors()) {
			return "movieManagement";
		}
		
		movie.setHinhAnh(photo.getOriginalFilename());
		movieRepository.save(movie);
		 System.out.println("cập nhật thành công");
		return "redirect:/choose/movie";
	}
	
	@PostMapping("/choose/movie/clear")
	public String get15()
	{
		
		return "redirect:/choose/movie";
	}
	
	@GetMapping("/choose/movie/delete1/{value}")
	public String get122(Model model, @PathVariable("value") String value)
	{
		movieRepository.deleteById(value);
		return "redirect:/choose/movie";
	}
	
	@GetMapping("/choose/movie/edit1/{value}")
	public String get1223(Model model, @PathVariable("value") String value)
	{
		
		Optional<Movie> movie = movieRepository.findById(value);
		model.addAttribute("movie", movie);
		List<Movie> list= movieRepository.findAll();
		model.addAttribute("movies", list);
		return "movieManagement";
	}
	
	@ModelAttribute("namecategory")
	public List<DanhMucPhim> listcategory()
	{
		List<DanhMucPhim> list = catedao.findAll();
		  return catedao.findAll();
	}
}
