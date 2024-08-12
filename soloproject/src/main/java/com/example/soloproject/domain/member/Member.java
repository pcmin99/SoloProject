package com.example.soloproject.domain.member;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor(access= AccessLevel.PROTECTED)
public class Member {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // ID 자동 생성
    private Long id;

    @Column(unique=true)
    private String username;
    
    @Column(nullable = false)
    private String password ;

    @Column(nullable = false)
    private String email ; 

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Role role ;

    // provider : 소셜 로그인
    @Column
    private String provider;

    // providerId : 소셜 로그인 한 유저의 고유 ID가 들어감
    @Column
    private String providerId;

    @Builder
    public Member(String username, String password, Role role, String email, String providerId, String provider){
        this.username = username;
        this.password = password;
        this.role = role;
        this.email = email ; 
        this.providerId = providerId ; 
        this.provider = provider ; 
        
    }

    public String getRoleKey(){
        return this.role.getKey();
    }


}
