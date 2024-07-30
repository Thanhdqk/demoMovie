package com.BaiTapLab.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.BaiTapLab.Entity.DanhMucPhim;

public interface danhmucRepository extends JpaRepository<DanhMucPhim, String> {
	@Query("select d from DanhMucPhim d where d.tenLoai like ?1")
	List<DanhMucPhim> findByTenLoai();
}
