package com.BaiTapLab.Entity;

import java.util.List;



import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
@Entity
@Table(name = "DanhMucPhim")
public class DanhMucPhim {
//	@Id
//	String MaLoai;
//	String TenLoai;
//	@OneToMany(mappedBy = "danhmucphim")
//	List<Movie> movies;
	 @Id
	 @NotBlank(message = "Please enter the id")
	    private String maLoai;
	 @NotBlank(message = "Please enter the name")
	    private String tenLoai;

	    @OneToMany(mappedBy = "danhmucphim")
	    private List<Movie> movies;

	    @Override
	    public String toString() {
	        return "DanhMucPhim{" +
	                "maLoai=" + maLoai +
	                ", tenLoai='" + tenLoai + '\'' +
	                '}';
	    }
	    
}
