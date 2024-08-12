package com.example.soloproject.config;

import java.io.PrintWriter;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpSession;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig {
    
    // @RequiredArgsConstructor : Lombok을 사용하여 필수 인자를 가진 생성자를 자동으로 생성
    // @Configuration : 이 클래스를 설정 클래스로 지정합니다.

    private final MyUserDetailsService myUserDetailsService ; 

    private final CustomOAuth2UserService customOAuth2UserService;

    private final AuthenticationFailureHandler userLoginFailHandler;

    // db에 사용자, 관리자 비밀번호 랜덤텍스트로 저장 
    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    
    

    // 기본 url, 권한 설정 
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

        http
                .csrf(csrfConfig ->
                        csrfConfig.disable()
                ) // CSRF 보호 비활성화
                .authorizeHttpRequests(authorizeRequests ->
                        authorizeRequests
                                .requestMatchers("/","/WEB-INF/views/login/**","/login/**","/oauth2/**").permitAll() // /,login 관련 url에 대한 접근 허용
                                .requestMatchers("/js/**","/css/**","/images/**","/fonts/**","/favicon.ico").permitAll() // js 전체 권한 
                                .requestMatchers("/WEB-INF/views/main.jsp","/main/**").permitAll() // main 페이지
                                .requestMatchers("/WEB-INF/views/footer/**","/footer/**").permitAll() // footer 페이지
                                .requestMatchers("/WEB-INF/views/header/**","/header/**").permitAll() // header 페이지
                                .requestMatchers("/posts/**", "/WEB-INF/views/posts/**").hasAnyRole("USER","ADMIN") // 사용자 권한이 필요한 url
                                .requestMatchers("/admins/**", "/WEB-INF/views//admins/**").hasRole("ADMIN") // 관리자 권한이 필요한 url
                                .anyRequest().authenticated() // 그외의 모든 요청은 인증 권한 필요
                )// 3번
                .exceptionHandling((exceptionConfig) ->
                        exceptionConfig.authenticationEntryPoint(unauthorizedEntryPoint).accessDeniedHandler(accessDeniedHandler)
                ) // 401 403 관련 예외처리 -> json 형식의 오류 응답을 설정
                .formLogin(formLogin -> 
                                {
                                formLogin
                                .loginPage("/login") // 1번 -> 사용자 정의 로그인 페이지 
                                .usernameParameter("username") // 2번-> 로그인시 사용자 이름 파라미터 
                                .passwordParameter("password") // 3번-> 로그인시 사용자 패스워드 파라미터 
                                .loginProcessingUrl("/loginonlyLogin") // 4번 로그인 폼 처리 url
                                .failureHandler(userLoginFailHandler) // 로그인 실패 핸들러
                                .defaultSuccessUrl("/main", true); // 5번 로그인 성공시 갈 url
                            }
                ).oauth2Login(oauth2  ->
                    oauth2
                        .loginPage("/login") // 페이지
                        .defaultSuccessUrl("/main", true) //로그인 성공시 갈 url
                        .userInfoEndpoint()
                        .userService(customOAuth2UserService)
                ) // 소셜 로그인 
                .logout(logoutConfig ->
                        logoutConfig    
                        .logoutUrl("/login/logout") // 로그아웃을 처리할 url 
                        .addLogoutHandler(((request, response, authentication) -> {
                            HttpSession session = request.getSession();
                            if (session != null) {
                                session.invalidate();   // 세션 삭제
                            }
                        }))
                        .logoutSuccessUrl("/main") // 6번 로그아웃 성공시 이동할 url
                )
                .userDetailsService(myUserDetailsService); // 7번 사용자 정의 myUserDetailsService
    //     http.sessionManagement(session -> {
    //             session
    //             .sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED) // 필요할때만 생성
    //             .maximumSessions(1) //세션 최대 허용 수 
    //             .maxSessionsPreventsLogin(true) // 동시 로그인 차단
    //             .expiredUrl("/login/login");
    // }); 
           

        return http.build();
    }
    
    // 소셜 로그인 URL은 Spring Security가 자동으로 처리하며
    // oauth2/authorization/{provider} 형식의 URL을 사용
    // 스프링 시큐리티에서 로그아웃시 자동 세션 삭제 이지만 소셜 로그인시 자동 로그인이 계속 되는 문제 때문에 .invalidate~~ 설정

        public final AuthenticationEntryPoint unauthorizedEntryPoint = (request, response, authException) -> {
            response.sendRedirect("/login/login");
            //response.sendRedirect("/login/login"); // 권한 없을시 보낼 url
        };
        
        public final AccessDeniedHandler accessDeniedHandler = (request, response, accessDeniedException) -> {
            response.sendRedirect("/login/login");
            //response.sendRedirect("/login/login"); // 권한 없을시 보낼 url
        };
        

        
    @Getter
    @RequiredArgsConstructor
    public class ErrorResponse {

        private final HttpStatus status;
        private final String message;
    }
}
