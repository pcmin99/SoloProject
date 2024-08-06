package com.example.soloproject.service;

import com.example.soloproject.domain.CommentsVO;

public interface CommentsService {


    public int deleteComment(CommentsVO commentsVO);

    public void insertComment(CommentsVO commentsVO);

    public int deletePostsid(CommentsVO commentsVO);
    
}
