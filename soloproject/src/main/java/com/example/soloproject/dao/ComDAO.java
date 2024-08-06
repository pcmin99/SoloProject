package com.example.soloproject.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.soloproject.domain.CommentsVO;

@Mapper
public interface ComDAO {

    public int deleteComment(CommentsVO commentsVO);

    public void insertComment(CommentsVO commentsVO);

    public int deletePostsid (CommentsVO commentsVO);
    
}
