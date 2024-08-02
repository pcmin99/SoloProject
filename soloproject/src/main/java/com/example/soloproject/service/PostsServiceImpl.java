package com.example.soloproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.soloproject.dao.BoardPostsDAO;
import com.example.soloproject.dao.ImgDAO;
import com.example.soloproject.domain.ImgVO;
import com.example.soloproject.domain.PostsVO;

@Service
public class PostsServiceImpl implements PostsService {

    @Autowired
    private BoardPostsDAO boardPostsDAO ; 

    @Autowired
    private ImgDAO imgDAO ; 


        // post 전체 리스트
        public List<PostsVO> allpost() {
            List<PostsVO> postList = boardPostsDAO.postList();
            System.out.println("확인: " + postList.size());
            return postList;
            }

        public List<PostsVO> postListId() {
            List<PostsVO> postListId = boardPostsDAO.postListId();
            return postListId;
        }

        public PostsVO postDetail(PostsVO postvo) {
            return boardPostsDAO.postDetail(postvo);
        }

        public int deletePost(PostsVO postsvo){
            int result = boardPostsDAO.deletePost(postsvo);
            return result ; 
        }

        // img까지 같이
        public void postInsert(PostsVO postvo){
                boardPostsDAO.postInsert(postvo);
        
        }

    
}
