//package com.BaiTapLab.Service;
//
//import java.util.List;
//import java.util.Optional;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//
//import com.BaiTapLab.Model.User1;
//import com.BaiTapLab.Repository.UserRepository1;
//
//@Service
//public class UserService1 {
//	@Autowired
//	public UserRepository1 userreponsitory1;
//	
//	public List<User1> getAll(){
//		return userreponsitory1.findAll();
//	}
//	
//	public User1 saveUser(User1 user1) {
//		return userreponsitory1.save(user1);
//	}
//	
//	public void deleteUser(Integer id) {
//		userreponsitory1.deleteById(id);
//	}
//	
//	public User1 getUserById(Integer id) {
//		Optional<User1> optionalUser = userreponsitory1.findById(id);
//		return optionalUser.orElse(null);
//	}
//	
//	public Optional<User1> findByTaiKhoanAndMatKhau(String taiKhoan, String matKhau) {
//        return userreponsitory1.findByTaiKhoanAndMatKhau(taiKhoan, matKhau);
//    }
//	
//	public Optional<User1> findByTaiKhoan(String taiKhoan){
//		return userreponsitory1.findByTaiKhoan(taiKhoan);
//	}
//}
