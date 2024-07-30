package com.BaiTapLab.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.BaiTapLab.Entity.ChiTietMovie;
import com.BaiTapLab.Repository.ChitietMovieReposiritory;

@Service
public class ChiTietMovieService {
	@Autowired
	ChitietMovieReposiritory chiTietMovieRepository;
	
	public List<ChiTietMovie> getAll(){
		return chiTietMovieRepository.findAll();
	}
}
