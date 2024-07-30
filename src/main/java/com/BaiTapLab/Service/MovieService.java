package com.BaiTapLab.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.BaiTapLab.Entity.Movie;

import com.BaiTapLab.Repository.MovieRepository;

@Service
public class MovieService {
	@Autowired
	MovieRepository movieRepository;
	
	public List<Movie> getAllMovie(){
		return movieRepository.findAll();
	}
	
	public List<Movie> getThanhTienBang0(){
		return movieRepository.getThanhTien();
	}
	
	public List<Movie> getThanhTienLonHon0(){
		return movieRepository.getThanhTienLonHon();
	}
	public Movie findByMovie(String movie) {
		 return movieRepository.findById(movie).orElse(null);
	}
	
	public List<Movie> findByTenMovie(String movie) {
		 return movieRepository.findByTenMV(movie);
	}
	
	public List<Movie> findByCategory(String maLoai) {
	    return movieRepository.findByCategory(maLoai);
	}
}
