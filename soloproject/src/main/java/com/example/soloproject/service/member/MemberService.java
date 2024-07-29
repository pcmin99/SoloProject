package com.example.soloproject.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.example.soloproject.dao.MemberLoginDAO;
import com.example.soloproject.domain.member.MemberRepository;
import com.example.soloproject.dto.Member.MemberJoinRequestDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberService {
    
    @Autowired
    private MemberLoginDAO memberLoginDao;  

    private final MemberRepository memberRepository ;  
    private final PasswordEncoder passwordencoder ; 

    public String addUser(@ModelAttribute MemberJoinRequestDto requestDto){
        return memberRepository.save(requestDto.toEntity(passwordencoder)).getUsername();
    }

    public int idChcek(String username){
        int result = memberLoginDao.idChcek(username) ; 
        return result ; 
    }


}