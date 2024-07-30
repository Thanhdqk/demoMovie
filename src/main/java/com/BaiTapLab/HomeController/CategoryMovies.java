package com.BaiTapLab.HomeController;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.BaiTapLab.Entity.DanhMucPhim;
import com.BaiTapLab.Entity.Movie;
import com.BaiTapLab.Repository.MovieRepository;
import com.BaiTapLab.Repository.danhmucRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class CategoryMovies {

	@Autowired
	MovieRepository movieDao;
	
	@Autowired
	danhmucRepository danhmucDao;

	@Autowired
	HttpSession session;

	@GetMapping("cate/get")

	public String getIndex(Model model) { // liệt kê danh sách =0
		Pageable pageable = PageRequest.of(0, 6);
		Page<Movie> page = (Page<Movie>) movieDao.getThanhTienPage(pageable);
		model.addAttribute("listMovie", page);
		int totalPages = page.getTotalPages();
		if (totalPages > 0) {
			List<Integer> pageNumbers = IntStream.rangeClosed(1, totalPages).boxed().collect(Collectors.toList());
			model.addAttribute("pageNum", pageNumbers);
		}
//		if (pagenumber != -1) {
//			if (pagenumber >= page.getTotalPages()) {
//				return "redirect:/product2/search-and-page?p=0";
//			}
//		}
		return "category";
	}

	@ModelAttribute("danhmuc")// Liệt kê danh mục
	public List<DanhMucPhim> danhmuc() {
		List<DanhMucPhim> list = danhmucDao.findAll();
		return list;
	}

	@GetMapping("cate/sort2")
	public String sortDanhMuc(Model model,
			@RequestParam(name = "field", required = false, defaultValue = "free") String value,
			@RequestParam("p") Optional<Integer> p) {

		Pageable pageable = PageRequest.of(p.orElse(0), 6);
		Page<Movie> page = (Page<Movie>) movieDao.getThanhTienPage(pageable);

		model.addAttribute("path", value);

		if (!value.isEmpty()) {
			if (value.contains("free")) {

				page = (Page<Movie>) movieDao.getThanhTienPage(pageable);
				session.setAttribute("status", 0);
				model.addAttribute("status", "0");
			} else if (value.contains("pay")) {
				page = (Page<Movie>) movieDao.getThanhTienLonHonPage(pageable);
				model.addAttribute("status", "1");
				session.setAttribute("status", "1");
			} else if (value.contains("danhmuc")) {
				String[] words = value.split("_");
				page = (Page<Movie>) movieDao.getdanhmuc(words[1], pageable);
				model.addAttribute("status", words[1]);
				session.setAttribute("status", words[1]);

			}else if (value.contains("20")) {
			
				page = (Page<Movie>) movieDao.getByYear(value, pageable);
			
				session.setAttribute("status",value);

			}
		}

		model.addAttribute("listMovie", page);

		int totalPages = page.getTotalPages();
		if (totalPages > 0) {
			List<Integer> pageNumbers = IntStream.rangeClosed(1, totalPages).boxed().collect(Collectors.toList());
			model.addAttribute("pageNum", pageNumbers);
		}

		int pagenumber = p.orElse(0);
//		if (pagenumber != -1) {
//			if (pagenumber >= page.getTotalPages()) {
//				return "redirect:/product2/search-and-page?p=0";
//			}
//		}
		return "category";
	}
//
//	@GetMapping("cate/sort")
//	public String sort(Model model, @RequestParam(name = "field", required = false, defaultValue = "free") String value,
//			@RequestParam("p") Optional<Integer> p) {
//
//		Pageable pageable = PageRequest.of(p.orElse(0), 6);
//		Page<Movie> page = (Page<Movie>) movieDao.getThanhTienPage(pageable);
//
//		model.addAttribute("path", value);
//
//		if (!value.isEmpty()) {
//			if (value.contains("free")) {
//
//				page = (Page<Movie>) movieDao.getThanhTienPage(pageable);
//				session.setAttribute("status", 0);
//				model.addAttribute("status", "0");
//			} else if (value.contains("pay")) {
//				page = (Page<Movie>) movieDao.getThanhTienLonHonPage(pageable);
//				model.addAttribute("status", "1");
//				session.setAttribute("status", "1");
//			}
//		}
//
//		model.addAttribute("listMovie", page);
//		int totalPages = page.getTotalPages();
//		if (totalPages > 0) {
//			List<Integer> pageNumbers = IntStream.rangeClosed(1, totalPages).boxed().collect(Collectors.toList());
//			model.addAttribute("pageNum", pageNumbers);
//		}
//
//		int pagenumber = p.orElse(0);
////		if (pagenumber != -1) {
////			if (pagenumber >= page.getTotalPages()) {
////				return "redirect:/product2/search-and-page?p=0";
////			}
////		}
//		return "category";
//	}
//
//	@ResponseBody
//	@GetMapping("cate/cc")
//	public Page<Movie> get() {
//		Pageable pageable = PageRequest.of(0, 6);
//		Page<Movie> page = movieDao.getByYear("2024", pageable);
//		return page;
//
//	}

}
