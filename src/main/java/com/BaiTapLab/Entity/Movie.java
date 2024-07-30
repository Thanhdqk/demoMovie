package com.BaiTapLab.Entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Movie")
public class Movie{

	 @Id
	 @NotBlank(message = "Please enter the id")
	 private String maMV;
	 @NotBlank(message = "Please enter the name")
	    private String tenMV;
	 @NotNull(message = "Please enter total")
	    private Long thanhTien;
	 @NotNull(message = "Please enter the time")
	    private Integer thoiLuong;
	 @NotBlank(message = "Please enter content")
	    private String noiDung;
	    
	    @Temporal(TemporalType.DATE)
	    @Column(name = "Createdate")
	    @DateTimeFormat(pattern = "yyyy-MM-dd")
	    private Date ngaySanXuat = new Date();
	    @NotBlank(message = "Please enter the name author")
	    private String tacGia;
	    private String hinhAnh;
	    @NotBlank(message = "Please enter URL")
	    private String url;

	    @ManyToOne
	    @JoinColumn(name = "maLoai")
	    private DanhMucPhim danhmucphim;

	    @OneToMany(mappedBy = "movie")
	    private List<ChiTietMovie> chiTietMovies;
	    
	    @Override
	    public String toString() {
	        return "Movie{" +
	                "maMV='" + maMV + '\'' +
	                ", tenMV='" + tenMV + '\'' +
	                ", thanhTien=" + thanhTien +
	                ", thoiLuong=" + thoiLuong +
	                ", noiDung='" + noiDung + '\'' +
	                ", ngaySanXuat=" + ngaySanXuat +
	                ", tacGia='" + tacGia + '\'' +
	                ", hinhAnh='" + hinhAnh + '\'' +
	                ", url='" + url + '\'' +
	                ", danhmucphim=" + (danhmucphim != null ? danhmucphim.getMaLoai() : null) +
	                '}';
	    }
	    
}
