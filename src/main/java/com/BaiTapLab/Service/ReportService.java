package com.BaiTapLab.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.BaiTapLab.Entity.HoaDon;
import com.BaiTapLab.Entity.User;
import com.BaiTapLab.Repository.HoaDonRepository;
import com.BaiTapLab.Repository.UserRepository;

@Service
public class ReportService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private HoaDonRepository hoaDonRepository;

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    public List<HoaDon> getAllHoaDons() {
        return hoaDonRepository.findAll();
    }
}
