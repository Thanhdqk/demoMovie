package com.BaiTapLab.Entity;

import java.util.List;



import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
@Entity
@Table(name = "APPUser")
public class User {

	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
	
	@NotBlank(message = "Please enter Username")
	@Size(max = 10, message = "Username must be less than 10")
    private String username;
	
	@NotBlank(message = "Please enter Password")
    @Size(max = 10, message = "Password must be less than 10")
    private String password;
	
    private String vaiTro;
    
    @NotBlank(message = "Please enter Email")
	@Email(message = "Email Not Required")
    private String email;

    @OneToMany(mappedBy = "user")
    private List<HoaDon> hoadons;
    
    @OneToMany(mappedBy = "user")
    private List<ChiTietMovie> chiTietMovies;
    
    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", vaiTro='" + vaiTro + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
    

}

