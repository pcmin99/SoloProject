package com.example.soloproject.config;

import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.soloproject.domain.member.Member;
import com.example.soloproject.domain.member.MemberRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MyUserDetailsService implements UserDetailsService {

    private final MemberRepository memberRepository ;
    
    // UserDetails 객체를 반환하여 일반 로그인 상황에 사용
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException{
        Member member = memberRepository.findByUsername(username)
                .orElseThrow(() -> new UsernameNotFoundException("없는 회원"));
        if (member == null) {
            throw new UsernameNotFoundException("User not found");
        }
        return User.builder()
        .username(member.getUsername())
        .password(member.getPassword())
        .roles(member.getRole().name())
        .build() ;
    }
    
}