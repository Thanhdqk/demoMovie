package com.BaiTapLab.Entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "HoaDon")
public class HoaDon {	
	 @Id
	    private String maHD;
	    private String tenKhachHang;
	    private String tenPhim;
	    private Integer soLuongPhim;
	    private String phuongThucTT;
	    private Long thanhTien;

	    @ManyToOne
	    @JoinColumn(name = "app_user_id")
	    private User user;
	
	 // Avoid including the 'user' field in toString() to prevent circular reference
	    @Override
	    public String toString() {
	        return "HoaDon{" +
	                "maHD='" + maHD + '\'' +
	                ", tenKhachHang='" + tenKhachHang + '\'' +
	                ", tenPhim='" + tenPhim + '\'' +
	                ", soLuongPhim=" + soLuongPhim +
	                ", phuongThucTT='" + phuongThucTT + '\'' +
	                ", thanhTien=" + thanhTien +
	                '}';
	    }
}

