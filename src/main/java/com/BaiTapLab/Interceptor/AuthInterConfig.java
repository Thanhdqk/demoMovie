package com.BaiTapLab.Interceptor;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class AuthInterConfig implements WebMvcConfigurer {
//	@Autowired
//	AuthInterceptor auth;
//
//	@Override
//	public void addInterceptors(InterceptorRegistry registry) {
//		registry.addInterceptor(auth)
//				.addPathPatterns("/user1/**", "/order/**", "/admin/**", "/home/login") // Áp dụng Auth
//				.excludePathPatterns("/css/**", "/login", "/js/**",
//						"/fonts/**","/img/**","/sass/**","/Source/**","/videos/**"); // Không áp dụng Auth
//	}
	
	@Autowired
	AuthInterceptor auth;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(auth)
				.addPathPatterns("/admin/**", "/order/**","/movie/**", "/admin/user1/**", 
						"/home", "/admin/user1", "/report", "/choose/category", "/movie/choose/movie", "/mailer") // Áp dụng Auth
				.excludePathPatterns("/css/**", "/login", "/js/**",
						"/fonts/**","/img/**","/sass/**","/Source/**","/videos/**"); // Không áp dụng Auth
	}
	
}

