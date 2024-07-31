package com.example.soloproject.domain;

import lombok.Data;

@Data
public class PostsVO {

    private int id ; 
    private String content ; 
    private String title ; 
    private int view ;
    private String writer ; 
    private String user_id ; 
    
    private String email ; 
    private String username ; 
    
    
}
