package com.BaiTapLab.Entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

//@Data
//@Entity
//@Table(name = "ChiTietMovie")
//public class ChiTietMovie {
//    private String trangThai;
//    
//    @Id
//    @ManyToOne
//    @JoinColumn(name = "app_user_id")
//    private User user;
//    
//    @Id
//    @ManyToOne
//    @JoinColumn(name = "movie_id")
//    private Movie movie;
//	
//    
//}

@Data
@Entity
@Table(name = "ChiTietMovie")
@IdClass(ChiTietMovieId.class)
public class ChiTietMovie {
	private String trangThai;

	@Id
	@ManyToOne
	@JoinColumn(name = "app_user_id")
	public User user;

	@Id
	@ManyToOne
	@JoinColumn(name = "movie_id")
	public Movie movie;

}

