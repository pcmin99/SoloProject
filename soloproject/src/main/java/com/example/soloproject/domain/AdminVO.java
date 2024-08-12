package com.example.soloproject.domain;

import lombok.Data;

@Data
public class AdminVO {

    
    private Long id;

    private String username;
    
    private String password ;

    private String email ; 

    private String  role ;
    private String provider;
    private String providerId;


}
