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
    

    // img table 관련 ( join 했음 )
    private int imgfile_id ; 
    private Integer posts_id ; 
    private String imgfile_name ; 
    private String imgfile_real_name ;
    private String img_path ; 
    

    // // comments table 관련 ( join했음 )
    // private String comment  ; 
    // private String created_date ; 
    // private String modified_date; 

    
    
}
