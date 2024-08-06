package com.example.soloproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.soloproject.domain.CommentsVO;
import com.example.soloproject.domain.PostsVO;

@Mapper
public interface  BoardPostsDAO {

    // main page List
    public List<PostsVO> postList() ;

    // boardList page 
    public List<PostsVO> postListId(); 

    public  PostsVO postDetail(PostsVO postvo);

    public int deletePost(PostsVO postvo) ; 

    // post insert 
    public void postInsert(PostsVO postvo);

    public int clickPosts(PostsVO postsvo) ; 

    public List<CommentsVO> comment(CommentsVO commentsvo ); 

}
