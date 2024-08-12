package com.example.soloproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.soloproject.domain.AdminVO;


@Mapper
public interface  MemberLoginDAO {
    
    // id 중복 확인 
    public int idChcek(String username);
    public List<AdminVO> adminAll() ;


}
