package com.example.soloproject.domain;

import lombok.Data;

@Data
public class CommentsVO {

    private int id ; 
    private String user_id ; // 댓글 단 사람 id
    private Integer posts_id ; // 해당 게시글 번호
    private String comment  ; // 댓글
    private String created_date ; 
    private String modified_date; 

    private int comsid ; // 댓글 번호
    
}
