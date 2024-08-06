package com.example.soloproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.soloproject.dao.ImgDAO;
import com.example.soloproject.domain.ImgVO;
import com.example.soloproject.domain.PostsVO;

@Service
public class ImgServiceImpl implements  ImgService{
    
    @Autowired
    ImgDAO imgDAO ; 
    
    @Override
    public void postInsertImg(ImgVO vo){
        imgDAO.postInsertImg(vo);
    };
    

    @Override
    public int selectNum(){
        return imgDAO.selectNum();
    };
    
    public int deletePostsid(ImgVO imgVO){
        int result = imgDAO.deletePostsid(imgVO);
        return result ; 
        }
}
