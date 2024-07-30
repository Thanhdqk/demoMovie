package com.BaiTapLab.HomeController;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.BaiTapLab.Entity.DanhMucPhim;
import com.BaiTapLab.Repository.CategotyRipository;


@Controller
public class CategoryController {

	@Autowired
	CategotyRipository dao;

	@GetMapping("/choose/category")
	public String get1(Model model,@ModelAttribute("category") DanhMucPhim category)
	{
		
		List<DanhMucPhim> list = dao.findAll();
		model.addAttribute("category1", list);
		
		
		return "categoryManagement";
	}
	
	@PostMapping("/choose/category/save")
	public String postMethodName(Model model,@Validated @ModelAttribute("category")DanhMucPhim category,BindingResult error) {
		List<DanhMucPhim> list = dao.findAll();
		model.addAttribute("category1", list);
		if(error.hasErrors())
		{
			return "categoryManagement";
		}
		
		dao.save(category);
		System.out.println("them thanh cong");
		
		return "redirect:/choose/category";
	}
	
	@PostMapping("/choose/category/delete")
	public String postMethodName1(Model model,@ModelAttribute("category")DanhMucPhim category,BindingResult bindingResult
) {
		List<DanhMucPhim> list = dao.findAll();
		model.addAttribute("category1", list);
		
		if(category.getMaLoai().isEmpty())
		{
			bindingResult.rejectValue("maLoai", "maLoai.empty", "Please enter Mã Loại");
			return "categoryManagement";
		}
		
		
		dao.deleteById(category.getMaLoai());
		System.out.println("xóa thàn công");
		
		return "redirect:/choose/category";
	}
	
	@PostMapping("/choose/category/update")
	public String postMethodName2(Model model,@Validated @ModelAttribute("category")DanhMucPhim category,BindingResult error) {
		
		List<DanhMucPhim> list = dao.findAll();
		model.addAttribute("category1", list);
		if(error.hasErrors())
		{
			return "categoryManagement";
		}
		
		dao.save(category);
		System.out.println("them thanh cong");
		
		return "redirect:/choose/category";
	}
	
	@PostMapping("/choose/category/clear")
	public String postMethodName3(Model model) {
		
		
		return "redirect:/choose/category";
	}
	
	@GetMapping("/choose/category/delete1/{value}")
	public String getMethodName22(Model model,@PathVariable("value")String value) {
		
		dao.deleteById(value);
		System.out.println("xóa thành công");
		
		return "redirect:/choose/category";
	}
	
	
	@GetMapping("/choose/category/edit1/{value}")
	public String getMethodName23(Model model,@PathVariable("value")String value) {
		
		Optional<DanhMucPhim> ob = dao.findById(value);
		model.addAttribute("category", ob);
		List<DanhMucPhim> list = dao.findAll();
		model.addAttribute("category1", list);
		return "categoryManagement";
	}

}

