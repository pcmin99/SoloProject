package com.example.soloproject.domain.member;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor(access= AccessLevel.PROTECTED)
public class Member {

    @Id
    @Column(unique=true)
    private String username;
    
    @Column(nullable = false)
    private String password ;

    @Column(nullable = false)
    private String email ; 

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Role role ;

    @Builder
    public Member(String username, String password, Role role, String email){
        this.username = username;
        this.password = password;
        this.role = role;
        this.email = email ; 
    }

    public String getRoleKey(){
        return this.role.getKey();
    }


}
