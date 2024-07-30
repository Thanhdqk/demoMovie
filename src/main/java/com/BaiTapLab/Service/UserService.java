package com.BaiTapLab.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.BaiTapLab.Entity.User;
import com.BaiTapLab.Repository.UserRepository;




@Service
public class UserService {
	@Autowired
	UserRepository userreponsitory1;

	
	public List<User> getAll(){
		return userreponsitory1.findAll();
	}
	
	public User saveUser(User user1) {
		return userreponsitory1.save(user1);
	}
	
	public void deleteUser(Integer id) {
		userreponsitory1.deleteById(id);
	}
	
	public User getUserById(Integer id) {
		Optional<User> optionalUser = userreponsitory1.findById(id);
		return optionalUser.orElse(null);
	}
	
	public Optional<User> findByUsernameAndPassword(String taiKhoan, String matKhau) {
        return userreponsitory1.findByUsernameAndPassword(taiKhoan, matKhau);
    }
	
	public Optional<User> findByUsername(String taiKhoan){
		return userreponsitory1.findByUsername(taiKhoan);
	}
	

}
