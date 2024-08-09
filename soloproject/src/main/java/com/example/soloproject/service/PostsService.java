package com.example.soloproject.service;

import java.util.List;

import com.example.soloproject.domain.CommentsVO;
import com.example.soloproject.domain.PostsVO;

public interface  PostsService {
    

    // 전체 select posts
    List<PostsVO> allpost() ; 

    // 
    List<PostsVO> postListId() ; 
    
    // detail id 기준 
    PostsVO postDetail(PostsVO postvo) ;
    
    // post 삭제
    public int deletePost(PostsVO id);

    public void postInsert(PostsVO vo);
    
    public int clickPosts(PostsVO id);

    List<CommentsVO> comment(CommentsVO commentsvo) ;

    List<PostsVO> topViewPosts() ; 
}
