package com.BaiTapLab.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.BaiTapLab.Entity.ChiTietMovie;
import com.BaiTapLab.Entity.ChiTietMovieId;
import com.BaiTapLab.Entity.User;

public interface ChitietMovieReposiritory extends JpaRepository<ChiTietMovie, ChiTietMovieId> {
	@Query("Select p from ChiTietMovie p where p.user.id=?1 and p.movie.maMV=?2" )
	List<ChiTietMovie> searchByIdAndName(int id,String mamv);
	
}
