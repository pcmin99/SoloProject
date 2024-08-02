package com.example.soloproject.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.soloproject.domain.ImgVO;

@Mapper
public interface  ImgDAO {

    // img insert 인데 
    public void postInsertImg(ImgVO vo);

    public int  selectNum();
    
}
