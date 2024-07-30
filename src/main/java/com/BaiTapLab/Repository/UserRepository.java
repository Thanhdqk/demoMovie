package com.BaiTapLab.Repository;



import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.BaiTapLab.Entity.User;


public interface UserRepository extends JpaRepository<User, Integer> {
	Optional<User> findByUsernameAndPassword(String taiKhoan, String matKhau);
	Optional<User> findByUsername(String taiKhoan);
	
	@Query("SELECT o FROM User o WHERE o.email = ?1")
	User findByEmail(String email);
}
