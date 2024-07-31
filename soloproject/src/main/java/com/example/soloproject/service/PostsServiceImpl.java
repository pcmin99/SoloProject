package com.example.soloproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.soloproject.dao.BoardPostsDAO;
import com.example.soloproject.domain.PostsVO;

@Service
public class PostsServiceImpl implements PostsService {

    @Autowired
    private BoardPostsDAO boardPostsDAO ; 

        // post 전체 리스트
        public List<PostsVO> allpost() {
            List<PostsVO> postList = boardPostsDAO.postList();
            System.out.println("확인: " + postList.size());
            return postList;
            }
    
}
