package com.example.soloproject.dao;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface  MemberLoginDAO {
    
    // id 중복 확인 
    public int idChcek(String username);

}
