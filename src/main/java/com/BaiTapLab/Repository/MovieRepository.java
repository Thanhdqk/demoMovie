package com.BaiTapLab.Repository;


import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.BaiTapLab.Entity.Movie;



public interface MovieRepository extends JpaRepository<Movie, String> {
	@Query("select o from Movie o where o.thanhTien = 0")
	List<Movie> getThanhTien();

	@Query("select o from Movie o where o.thanhTien > 0")
	List<Movie> getThanhTienLonHon();
	
	List<Movie> findByTenMV(String tenMV);
	
	@Query("SELECT o FROM Movie o WHERE o.danhmucphim.maLoai = :maLoai")
    List<Movie> findByCategory(@Param("maLoai") String maLoai);
	
	Page<Movie> findAll(Pageable pageable);
	
	@Query("select o from Movie o where o.thanhTien = 0")
	Page<Movie> getThanhTienPage(Pageable pageable);
	@Query("select o from Movie o where o.thanhTien > 0")
	Page<Movie> getThanhTienLonHonPage(Pageable pageable);
	
	@Query("select o from Movie o where o.danhmucphim.maLoai like ?1")
	Page<Movie> getdanhmuc(String tenloai, Pageable pageable);
	
	@Query(value = "SELECT * FROM Movie WHERE year(Createdate) Like %?1%", nativeQuery = true)
	Page<Movie> getByYear(String year,Pageable pageable);
}
