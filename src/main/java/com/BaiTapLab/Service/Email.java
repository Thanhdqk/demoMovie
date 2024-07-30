package com.BaiTapLab.Service;

import jakarta.validation.constraints.*;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
 
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Email {
	
	
	String to;
	
	String subject;
	
	String content;
}
