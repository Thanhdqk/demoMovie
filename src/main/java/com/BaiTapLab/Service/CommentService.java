package com.BaiTapLab.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.BaiTapLab.Entity.Comment;
import com.BaiTapLab.Repository.CommentRepository;

@Service
public class CommentService {

    @Autowired
    private CommentRepository commentRepository;

    public List<Comment> getCommentsByMovieId(String movieId) {
        return commentRepository.findByMovieMaMV(movieId);
    }

    public Comment saveComment(Comment comment) {
        return commentRepository.save(comment);
    }
}
