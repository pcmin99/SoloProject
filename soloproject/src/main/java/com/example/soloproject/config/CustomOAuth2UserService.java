package com.example.soloproject.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.example.soloproject.domain.member.Member;
import com.example.soloproject.domain.member.MemberRepository;
import com.example.soloproject.domain.member.Role;

@Service
public class CustomOAuth2UserService extends DefaultOAuth2UserService {

    private BCryptPasswordEncoder bCryptPasswordEncoder;
    
    private MemberRepository memberRepository;


    /* @Lazy 순환 참조 문제 이기에 
     * Lazy 어노테이션은 초기화를 지연시키는 어노테이션입니다.
     * 지연 초기화보다 기본적인 즉시 초기화를 선호한다고 합니다.
     * 즉시 초기화는 어플리케이션 구성 단계에서부터 오류가 발생하면 잡아낼 수 있기 때문입니다.
     * ( 유지 보수 생각하면 즉시 초기화 )
     */
    @Autowired
    public CustomOAuth2UserService(@Lazy MemberRepository memberRepository, @Lazy BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.memberRepository = memberRepository;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }
    

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        OAuth2User oAuth2User = super.loadUser(userRequest);
        String provider = userRequest.getClientRegistration().getRegistrationId(); // "google"
        String providerId = oAuth2User.getAttribute("sub");
        String username = provider + "_" + providerId;
        String email = oAuth2User.getAttribute("email");

        Member member = memberRepository.findByUsername(username)
                .orElseGet(() -> {
                    Member newMember = Member.builder()
                            .username(username)
                            .email(email)
                            .password(bCryptPasswordEncoder.encode("defaultpassword")) // 기본 비밀번호 제공
                            .role(Role.USER)
                            .provider(provider)
                            .providerId(providerId)
                            .build();
                            System.out.println(":::::::::::::::"+newMember);
                    return memberRepository.save(newMember);
                });
        return new CustomOAuth2User(member, oAuth2User.getAttributes());
    };


    
}
