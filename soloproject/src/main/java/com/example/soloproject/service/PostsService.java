package com.example.soloproject.service;

import java.util.List;

import com.example.soloproject.domain.ImgVO;
import com.example.soloproject.domain.PostsVO;

public interface  PostsService {
    

    // 전체 select posts
    List<PostsVO> allpost() ; 

    List<PostsVO> postListId() ; 
    
    // detail id 기준 
    PostsVO postDetail(PostsVO id) ;
    
    // post 삭제
    public int deletePost(PostsVO id);

    public void postInsert(PostsVO vo);
    
}
