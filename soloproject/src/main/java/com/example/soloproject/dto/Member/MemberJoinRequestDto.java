package com.example.soloproject.dto.Member;

import org.springframework.security.crypto.password.PasswordEncoder;

import com.example.soloproject.domain.member.Member;
import com.example.soloproject.domain.member.Role;

import lombok.Builder;
import lombok.Data;

@Data
public class MemberJoinRequestDto {
    
    private String username ; 
    private String password ; 
    private String email ; 

    @Builder
    public MemberJoinRequestDto(String username , String password, String email){
        this.username = username ; 
        this.password = password ; 
        this.email = email ;
    }

    public Member toEntity(PasswordEncoder passwordEncoder){
        return Member.builder()
                .username(username)
                .email(email)
                .password(passwordEncoder.encode(password))
                .role(Role.USER)
                .build();
    }
}