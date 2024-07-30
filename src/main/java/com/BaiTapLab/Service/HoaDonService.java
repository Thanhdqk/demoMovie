package com.BaiTapLab.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.BaiTapLab.Entity.HoaDon;
import com.BaiTapLab.Repository.HoaDonRepository;

@Service
public class HoaDonService {
	@Autowired
	HoaDonRepository hoaDonRepository;
	
	public List<HoaDon> getHoaDonsByUserId(Integer userId) {
        return hoaDonRepository.findByUserId(userId);
    }
}
