package com.example.soloproject.domain;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@JsonIgnoreProperties(ignoreUnknown = true)
@Data
public class NewsVO {

    private String lastBuildDate ; 
    private int total ; 
    private int start ; 
    private int display ; 

    private List<Items> items ; 
    
    @JsonIgnoreProperties(ignoreUnknown = true)
    @Data
    public static class Items {
        private String title ;
        private String originallink;
        private String link;
        private String description;
    }


}
