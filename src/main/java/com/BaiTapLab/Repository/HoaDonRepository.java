package com.BaiTapLab.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.BaiTapLab.Entity.HoaDon;
import java.util.List;


public interface HoaDonRepository extends JpaRepository<HoaDon, String>{
	List<HoaDon> findByUserId(int id);
}
