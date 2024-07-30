package com.BaiTapLab.Entity;

import java.io.Serializable;

import jakarta.persistence.Embeddable;
import lombok.Data;
@Data
@Embeddable
public class ChiTietMovieId implements Serializable {
    private static final long serialVersionUID = 1L;

    private int user;
    private String movie;


}