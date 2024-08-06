package com.example.soloproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.soloproject.dao.ComDAO;
import com.example.soloproject.domain.CommentsVO;
import com.example.soloproject.domain.ImgVO;

@Service
public class CommentsServiceImpl implements CommentsService {

    @Autowired
    private ComDAO comDAO ; 

       public int deleteComment(CommentsVO commentsVO){
        int result = comDAO.deleteComment(commentsVO);
        return result ; 
        }
    
        public void insertComment(CommentsVO commentsVO){
            comDAO.insertComment(commentsVO);
        }

        public int deletePostsid(CommentsVO commentsVO){
        int result = comDAO.deletePostsid(commentsVO);
        return result ; 
        }
}
