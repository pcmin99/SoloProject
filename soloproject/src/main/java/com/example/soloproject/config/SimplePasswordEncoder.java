package com.example.soloproject.config;

import org.springframework.security.crypto.password.PasswordEncoder;

public class SimplePasswordEncoder implements PasswordEncoder {

    public String encode(CharSequence rawPassword){
        
        return rawPassword.toString();
    }

    public boolean matches(CharSequence rawPassword, String encodedPassword){
        
        return encodedPassword.equals(encode(rawPassword)); 
    }
    
}
