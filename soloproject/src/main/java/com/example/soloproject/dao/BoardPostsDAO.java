package com.example.soloproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.soloproject.domain.PostsVO;

@Mapper
public interface  BoardPostsDAO {

    public List<PostsVO> postList() ;
    
}
