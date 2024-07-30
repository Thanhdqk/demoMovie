package com.BaiTapLab.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.BaiTapLab.Entity.FavoriteMovie;
import com.BaiTapLab.Repository.FavoriteMovieRepository;

import jakarta.transaction.Transactional;

@Service
public class FavoriteMovieService {

    @Autowired
    private FavoriteMovieRepository favoriteMovieRepository;

    public List<FavoriteMovie> getFavoriteMoviesByUserId(int userId) {
        return favoriteMovieRepository.findByUserId(userId);
    }

    public List<FavoriteMovie> getAll(){
    	return favoriteMovieRepository.findAll();
    }
    public FavoriteMovie saveFavoriteMovie(FavoriteMovie favoriteMovie) {
        return favoriteMovieRepository.save(favoriteMovie);
    }

    public void deleteFavo(Integer id) {
    	favoriteMovieRepository.deleteById(id);
	}
    
//    public void deleteFavoriteMovie(int userId, String movieId) {
//        FavoriteMovie favoriteMovie = favoriteMovieRepository.findByUserIdAndMovieId(userId, movieId);
//        if (favoriteMovie != null) {
//            favoriteMovieRepository.delete(favoriteMovie);
//        }
//    }
    
    @Transactional
    public void deleteByUserIdAndMovieId(int userId, String movieId) {
        favoriteMovieRepository.deleteByUserIdAndMovieId(userId, movieId);
    }

    public FavoriteMovie findByUserIdAndMovieId(int userId, String movieId) {
        return favoriteMovieRepository.findByUserIdAndMovieId(userId, movieId);
    }
}
