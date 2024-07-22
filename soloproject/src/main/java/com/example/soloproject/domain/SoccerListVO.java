package com.example.soloproject.domain;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@JsonIgnoreProperties(ignoreUnknown = true)
@Data
public class SoccerListVO {
    private Api api;

    @JsonIgnoreProperties(ignoreUnknown = true)
    @Data
    public static class Api {
        private List<SoccerList> fixtures;
        private List<Teams> teams;
    }

    @JsonIgnoreProperties(ignoreUnknown = true)
    @Data
    public static class SoccerList {
        private int fixture_id;
        private int league_id;
        private League league;
        private String event_date;
        private String round;
        private String status;
        private String venue;
        private Team homeTeam;
        private Team awayTeam;
        private String goalsHomeTeam;
        private String goalsAwayTeam;
    }

    @JsonIgnoreProperties(ignoreUnknown = true)
    @Data
    public static class Teams {
        private int team_id;
        private String logo;
        private String name;
        private String code;
        private String country; // 해당 팀 나라
        private String venue_name; // 경기장 이름
        private int founded; // 창단 연도
        private int venue_capacity; // 경기장 수용인원
        private String venue_address; // 경기장 주소
    }

    @JsonIgnoreProperties(ignoreUnknown = true)
    @Data
    public static class League {
        private String name;
        private String country;
        private String logo;
        private String flag;
    }

    @JsonIgnoreProperties(ignoreUnknown = true)
    @Data
    public static class Team {
        private int team_id;
        private String team_name;
        private String logo;
    }

    // @JsonIgnoreProperties(ignoreUnknown = true)
    // @Data
    // public static class teams {
    //     private int team_id;
    //     private String logo;
    //     private String name;
    //     private String code;
    //     private String country; // 해당 팀 나라
    //     private String venue_name; // 경기장 이름
    //     private int founded; // 창단 연도
    //     private int venue_capacity; // 경기장 수용인원
    //     private String venue_address; // 경기장 주소
    // }
}
