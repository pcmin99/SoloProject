package com.example.soloproject.config;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.example.soloproject.config.provider.GoogleUserInfo;
import com.example.soloproject.config.provider.NaverUserInfo;
import com.example.soloproject.config.provider.Oauth2UserInfo;
import com.example.soloproject.domain.member.Member;
import com.example.soloproject.domain.member.MemberRepository;
import com.example.soloproject.domain.member.Role;

@Service
public class    CustomOAuth2UserService extends DefaultOAuth2UserService {

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
    

    @SuppressWarnings("unchecked")
    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        System.out.println(userRequest+"::::::::::::::::::");
        OAuth2User oAuth2User = super.loadUser(userRequest);

        Oauth2UserInfo oAuth2UserInfo = null;

        if(userRequest.getClientRegistration().getRegistrationId().equals("google")){
            System.out.println("구글 로그인 요청");
            oAuth2UserInfo = new GoogleUserInfo(oAuth2User.getAttributes());

        } else if(userRequest.getClientRegistration().getRegistrationId().equals("naver")) {
            System.out.println("네이버 로그인 요청");
            oAuth2UserInfo = new NaverUserInfo((Map)oAuth2User.getAttributes().get("response"));

        } else {
            System.out.println("구글과 네이버 로그인만 가능합니다.");
        }
        

        String provider = oAuth2UserInfo.getProvider(); //"google"
        String providerId = oAuth2UserInfo.getProviderId();
        String username = oAuth2UserInfo.getEmail();
        String email = oAuth2UserInfo.getEmail();
        Member member = memberRepository.findByUsername(username)
                .orElseGet(() -> {
                    Member newMember = Member.builder()
                            .username(username)
                            .email(email)
                            .password(bCryptPasswordEncoder.encode("defaultpassword"))
                            .role(Role.USER)
                            .provider(provider)
                            .providerId(providerId)
                            .build();
                    Member savedMember = memberRepository.save(newMember);
                    //System.out.println("Saved Member: " + savedMember);
                    return savedMember;
                });
    
        //System.out.println("Loaded Member: " + member);
        return new CustomOAuth2User(member, oAuth2User.getAttributes());
    }
    


    
}
