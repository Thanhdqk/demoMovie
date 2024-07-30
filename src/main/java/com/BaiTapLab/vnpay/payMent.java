package com.BaiTapLab.vnpay;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class payMent implements Serializable {
	private String status;
	private String message;
	private String url;
	
}
