package com.example.soloproject.config;

import java.io.PrintWriter;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.AccessDeniedHandler;

import com.example.soloproject.domain.member.Role;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig {
    
    // @RequiredArgsConstructor : Lombok을 사용하여 필수 인자를 가진 생성자를 자동으로 생성
    // @Configuration : 이 클래스를 설정 클래스로 지정합니다.

    private final MyUserDetailsService myUserDetailsService ; 

    // db에 사용자, 관리자 비밀번호 랜덤텍스트로 저장 
    @Bean
    PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder() ; 
    }

    // 기본 url, 권한 설정 
    @SuppressWarnings("removal")
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

        http
                .csrf(csrfConfig ->
                        csrfConfig.disable()
                ) // CSRF 보호 비활성화
                .authorizeHttpRequests(authorizeRequests ->
                        authorizeRequests
                                .requestMatchers("/","/WEB-INF/views/login/**","/login/**").permitAll() // /,login 관련 url에 대한 접근 허용
                                .requestMatchers("/js/**","/css/**","/images/**","/fonts/**","/favicon.ico").permitAll() // js 전체 권한 
                                .requestMatchers("/WEB-INF/views/main.jsp","/main/**").permitAll() // main 페이지
                                .requestMatchers("/WEB-INF/views/footer/**","/footer/**").permitAll() // footer 페이지
                                .requestMatchers("/posts/**", "/WEB-INF/views/posts/**").hasRole(Role.USER.name()) // 사용자 권한이 필요한 url
                                .requestMatchers("/admins/**", "/api/v1/admins/**").hasRole(Role.ADMIN.name()) // 관리자 권한이 필요한 url
                                .anyRequest().authenticated() // 그외의 모든 요청은 인증 권한 필요
                )// 3번
                .exceptionHandling((exceptionConfig) ->
                        exceptionConfig.authenticationEntryPoint(unauthorizedEntryPoint).accessDeniedHandler(accessDeniedHandler)
                ) // 401 403 관련 예외처리 -> json 형식의 오류 응답을 설정
                .formLogin(formLogin ->
                        formLogin
                                .loginPage("/login") // 1번 -> 사용자 정의 로그인 페이지 
                                .usernameParameter("username") // 2번-> 로그인시 사용자 이름 파라미터 
                                .passwordParameter("password") // 3번-> 로그인시 사용자 패스워드 파라미터 
                                .loginProcessingUrl("/loginonlyLogin") // 4번 로그인 폼 처리 url
                                .defaultSuccessUrl("/main", true) // 5번 로그인 성공시 갈 url
                )
                .logout(logoutConfig ->
                        logoutConfig
                        .logoutUrl("/login/logout") // 로그아웃을 처리할 url 
                        .logoutSuccessUrl("/main") // 6번 로그아웃 성공시 이동할 url 
                )
                .userDetailsService(myUserDetailsService); // 7번 사용자 정의 myUserDetailsService
        http.sessionManagement()
                .maximumSessions(1) //세션 최대 허용 수 
                .maxSessionsPreventsLogin(false); // false이면 중복 로그인하면 이전 로그인이 풀린다.

           

        return http.build();
    }
    

    public final AuthenticationEntryPoint unauthorizedEntryPoint =
            (request,response, authException) -> {
                ErrorResponse fail = new ErrorResponse(HttpStatus.UNAUTHORIZED, "Spring security unauthorized...");
                response.setStatus(HttpStatus.UNAUTHORIZED.value());
                String json = new ObjectMapper().writeValueAsString(fail);
                response.setContentType(MediaType.APPLICATION_JSON_VALUE);
                PrintWriter writer = response.getWriter();
                writer.write(json);
                writer.flush();
            };

    public  final AccessDeniedHandler accessDeniedHandler =
            (request, response, accessDeniedException) -> {
                ErrorResponse fail = new ErrorResponse(HttpStatus.FORBIDDEN, "Spring security forbidden...");
                response.setStatus(HttpStatus.FORBIDDEN.value());
                String json = new ObjectMapper().writeValueAsString(fail);
                response.setContentType(MediaType.APPLICATION_JSON_VALUE);
                PrintWriter writer = response.getWriter();
                writer.write(json);
                writer.flush();
            };


            //  Full authentication is required to access this resource 로 인해 권한 해결 안됌

    @Getter
    @RequiredArgsConstructor
    public class ErrorResponse {

        private final HttpStatus status;
        private final String message;
    }
}
