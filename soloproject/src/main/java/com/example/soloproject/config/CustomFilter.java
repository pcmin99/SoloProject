package com.example.soloproject.config;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@WebFilter(value = "/login/*")
public class CustomFilter implements Filter {
    

    public void init(FilterConfig filterConfig ) throws ServletException{
        log.info("asdasd");
        System.out.println("asd");
        Filter.super.init(filterConfig);
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException{
        response.setCharacterEncoding("UTF-8");

        HttpServletRequest req = (HttpServletRequest) request ;
        HttpServletResponse rep = (HttpServletResponse) response ;
        String requestURI = req.getRequestURI() ; 
        log.info("requestURI ::: {}",requestURI);
        
        chain.doFilter(request, response);
    }

    public void destroy(){
        log.info("::인스턴스 종료");
        Filter.super.destroy();    
    }

}