package com.example.soloproject.dao;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface  MemberLoginDAO {
    
    public int idChcek(String username);

}
