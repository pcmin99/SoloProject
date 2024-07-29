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

    private String provider ; 
    private String providerId ;

    @Builder
    public MemberJoinRequestDto(String username , String password, String email, String providerId, String provider){
        this.username = username ; 
        this.password = password ; 
        this.email = email ;
        this.providerId = providerId ; 
        this.provider = provider ; 
        
    }

    public Member toEntity(PasswordEncoder passwordEncoder){
        return Member.builder()
                .username(username)
                .email(email)
                .provider(provider)
                .providerId(providerId)
                .password(passwordEncoder.encode(password))
                .role(Role.USER)
                .build();
    }
}