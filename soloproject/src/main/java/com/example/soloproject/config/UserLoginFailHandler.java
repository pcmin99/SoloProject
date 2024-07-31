package com.example.soloproject.config;

import java.io.IOException;
import java.net.URLEncoder;

import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// 로그인 실패시 핸들러
@Component
public class UserLoginFailHandler extends SimpleUrlAuthenticationFailureHandler  {

    
    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
                AuthenticationException exception ) throws IOException, ServletException{

            String errorMessage ; 
            
            if(exception instanceof  BadCredentialsException){
                errorMessage ="아이디 또는 비밀번호가 맞지 않습니다. 다시 확인해 주세요." ;
            }else if(exception instanceof InternalAuthenticationServiceException) {
                errorMessage = "내부적으로 발생한 시스템 문제로 인해 요청을 처리할 수 없습니다. 관리자에 문의 하세요. " ;
            }else if (exception instanceof UsernameNotFoundException) {
                errorMessage = "계정이 존재하지 않습니다. 회원가입 진행 후 로그인 해주세요" ;
            }else if (exception instanceof AuthenticationCredentialsNotFoundException) {
                errorMessage = "인증 요청이 거부되었습니다. 관리자에 문의하세요" ;
            }else{
                errorMessage = "알 수 없는 이유로 로그인에 실패했습니다. 관리자에게 문의하세요." ;
            }
            /*
            BadCredentialsException : 자격 증명이 잘못되어 인증 요청이 거부된 경우 throw... id or password 잘못 입력시 발생
            InternalAuthenticationServiceException : 내부적으로 발생한 시스템 문제로 인해 인증 요청을 처리 할수 없을 때 발생
            UsernameNotFoundException : username으로 사용자명을 찾을 수 없을때 발생
            AuthenticationCredentialsNotFoundException : 어떤 이유로든 유효하지 않은 인증 개체와 관련된 모든 예외에 대한 추상 슈퍼 클래스 이다. 
            setDefaultFailureUrl : 실패 대상으로 사용할 URL입니다. 매개변수: defaultFailureUrl – 실패 URL(예: "/loginFailed.jsp").
            */ 
            errorMessage =URLEncoder.encode(errorMessage, "UTF-8");
            setDefaultFailureUrl("/login/login?error=true&exception=" + errorMessage);
            super.onAuthenticationFailure(request, response, exception);


    }
    
}
