package com.BaiTapLab.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.BaiTapLab.Entity.FavoriteMovie;
import com.BaiTapLab.Entity.Movie;
import com.BaiTapLab.Entity.User;

import jakarta.transaction.Transactional;

public interface FavoriteMovieRepository extends JpaRepository<FavoriteMovie, Integer> {
    List<FavoriteMovie> findByUserId(int id);
//    FavoriteMovie findByUserIdAndMovieId(int id, String maMV);
    
    @Modifying
    @Transactional
    @Query("delete from FavoriteMovie fm where fm.user.id = :userId and fm.movie.maMV = :movieId")
    void deleteByUserIdAndMovieId(int userId, String movieId);
    
    @Query("select fm from FavoriteMovie fm where fm.user.id = :userId and fm.movie.maMV = :movieId")
    FavoriteMovie findByUserIdAndMovieId(int userId, String movieId);

}
