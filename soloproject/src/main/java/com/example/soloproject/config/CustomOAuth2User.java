package com.example.soloproject.config;

import java.util.ArrayList;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import com.example.soloproject.domain.member.Member;

import lombok.Data;

import java.util.Collection;
import java.util.Map;

/**
 * CustomOAuth2User는 OAuth2User 인터페이스를 구현하여
 * OAuth2 로그인 시 사용자 정보를 제공합니다.
 */
@Data   
public class CustomOAuth2User implements OAuth2User,UserDetails {
    
    // db에서 가져온 member 정보 포함
    private final Member member;
    
    private Map<String, Object> attributes;

     // 일반 로그인
    public CustomOAuth2User(Member member) {
        this.member = member;
    }
    // OAuth 로그인
    public CustomOAuth2User(Member member, Map<String, Object> attributes) {
        this.member = member;
        this.attributes = attributes;
    }


    // 해당 유저의 권한을 리턴하는 곳
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        Collection<GrantedAuthority> collect = new ArrayList<>();
        collect.add(new GrantedAuthority() {
            @Override
            public String getAuthority() {
                return member.getRole().name();
            }
        });

        return collect;
    }

    @Override
    public String getPassword() {
        return member.getPassword();
    }

    @Override
    public String getUsername() {
        return member.getUsername();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    @Override
    public String getName() {
        return null;
    }

    @Override
    public Map<String, Object> getAttributes() {
        return attributes;
    }
}
