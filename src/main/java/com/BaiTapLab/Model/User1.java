//package com.BaiTapLab.Model;
//
//import jakarta.persistence.Column;
//import jakarta.persistence.Entity;
//import jakarta.persistence.GeneratedValue;
//import jakarta.persistence.GenerationType;
//import jakarta.persistence.Id;
//import jakarta.persistence.Table;
//import jakarta.validation.constraints.Email;
//import jakarta.validation.constraints.NotBlank;
//import jakarta.validation.constraints.Size;
//import lombok.AllArgsConstructor;
//import lombok.Data;
//import lombok.NoArgsConstructor;
//
//@Data
//@AllArgsConstructor
//@NoArgsConstructor
//@Entity
//@Table(name = "user1")
//public class User1 {
//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	Integer id;
//	
//	@Column(name = "tai_khoan", nullable = false, length = 50)
//	@NotBlank(message = "Please enter Username")
//	@Size(max = 10, message = "Username must be less than 10")
//	String taiKhoan;
//	
//	@Column(name = "mat_khau", nullable = false, length = 255)
//	@NotBlank(message = "Please enter Password")
//	@Size(max = 10, message = "Password must be less than 10")
//	String matKhau;
//	
//	@Column(name = "vai_tro", nullable = false, length = 100)
//	String vaiTro;
//	
//	@Column(name="email", nullable = false, length = 100)
//	@NotBlank(message = "Please enter Email")
//	@Email(message = "Email Not Required")
//	String email;
//}
