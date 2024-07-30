package com.BaiTapLab.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.BaiTapLab.Entity.DanhMucPhim;

public interface CategotyRipository extends JpaRepository<DanhMucPhim, String> {

}
