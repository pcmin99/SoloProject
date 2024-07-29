package com.example.soloproject.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URL;
import java.net.URLEncoder;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.soloproject.domain.NewsVO;
import com.example.soloproject.domain.SearchResultVO;
import com.example.soloproject.domain.SoccerListVO;
import com.example.soloproject.dto.Member.MemberJoinRequestDto;
import com.example.soloproject.service.member.MemberService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpSession;

@Controller
public class SoccerListController {

    // @Autowired
    //private FootballDataService footballDataService;
    
    @Autowired
    private MemberService memberService ;

    private final ObjectMapper objectMapper = new ObjectMapper();

    // @RequestMapping("/{step}")
    // public String viewPage(@PathVariable String step) {
    //     return step;
    // }

    // 로그인
    @RequestMapping("/login/login")
    public String loginPage(Model model){

        return "login/login" ; 
    }

    // @PostMapping("/main")
    // public String home(HttpSession session, Model model) {
    //     SecurityContext securityContext = (SecurityContext) session.getAttribute("SPRING_SECURITY_CONTEXT");
    //     Authentication authentication = securityContext.getAuthentication();
    //     UserDetails userDetails = (UserDetails) authentication.getPrincipal();
    //     System.out.println("seconCon:::"+securityContext);
    //     System.out.println("authenti:::"+authentication);
    //     System.out.println("userdet:::"+userDetails);
    //     model.addAttribute("user", userDetails);

    //     return "home"; // 뷰 이름 반환
    // }


    // 회원 가입
    @PostMapping("/login/join")
    public String joinPage(MemberJoinRequestDto memberJoinRequestDto){
        memberService.addUser(memberJoinRequestDto);
        return "redirect:login";
    }

    // 회원 가입 -> id 중복 체크
    @RequestMapping("/login/idCheck")
    @ResponseBody
    public String IdChcek(String username){
        int response = memberService.idChcek(username);
        return ""+response ; 
    }

    // // 로그 아웃 
    @PostMapping("/login/logout")
    public String logout() {
        return "main";
    }


    // // defaultValue 검색 값이 없을시 기본으로 프리미어리그 
    @PostMapping("/searchImg")
    @ResponseBody
    public ResponseEntity<SearchResultVO> searchText(Model model, @RequestParam(value = "searchImg" , defaultValue = "프리미어리그") String searchImg  ) throws JsonMappingException, JsonProcessingException {

        // 네이버 뉴스 api
        String clientId = "VThSYhofsxKXIWAvv9Wx";
        String clientSecret = "WRmau6BH7U" ; 
        try {
            searchImg = URLEncoder.encode(searchImg, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("검색어 인코딩 실패",e);
        }

        String apiURL = "https://openapi.naver.com/v1/search/image?query=" + searchImg;    // JSON 결과
        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        String responseBody = get(apiURL,requestHeaders);    
        // JSON 응답을 NewsVO로 변환 후 모델에 추가
        SearchResultVO searchResultVO = objectMapper.readValue(responseBody, SearchResultVO.class);
        return  ResponseEntity.ok(searchResultVO); 
    }

    // main 페이지 오픈 api 
    // 프리미어리그 관련한 개발을 하기에 defaultValue = 프리미어리그로 
    @GetMapping("/main")
    public String main ( HttpSession session,Model model, @RequestParam(value = "query", defaultValue = "프리미어리그") String query ) throws IOException, InterruptedException {
        HttpRequest request = HttpRequest.newBuilder()
        .uri(URI.create("https://api-football-v1.p.rapidapi.com/v2/fixtures/league/6280?timezone=Europe/London"))
        .header("x-rapidapi-key", "6e1b55783bmsh96a786c871fd0d6p1660d6jsn4ac2f3db547f")
        .header("x-rapidapi-host", "api-football-v1.p.rapidapi.com")
        .method("GET", HttpRequest.BodyPublishers.noBody())
        .build();
        HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
        ObjectMapper objectMapper = new ObjectMapper();
        SoccerListVO soccerList = null ;
        soccerList = objectMapper.readValue(response.body(), SoccerListVO.class);
        model.addAttribute("soccerList", soccerList.getApi().getFixtures());

        // 세션이 유효한지 확인
        if (session != null && session.getAttribute("SPRING_SECURITY_CONTEXT") != null) {
            SecurityContext securityContext = (SecurityContext) session.getAttribute("SPRING_SECURITY_CONTEXT");
            Authentication authentication = securityContext.getAuthentication();
            if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
                UserDetails userDetails = (UserDetails) authentication.getPrincipal();
                model.addAttribute("user", userDetails);
            }
        }


        // 네이버 뉴스 api
        String clientId = "VThSYhofsxKXIWAvv9Wx";
        String clientSecret = "WRmau6BH7U" ; 
        try {
            query = URLEncoder.encode(query, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("검색어 인코딩 실패",e);
        }
        String apiURL = "https://openapi.naver.com/v1/search/news?query=" + query;    // JSON 결과

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        String responseBody = get(apiURL,requestHeaders);    
        // JSON 응답을 NewsVO로 변환 후 모델에 추가
        NewsVO newsVO = objectMapper.readValue(responseBody, NewsVO.class);
        model.addAttribute("leagueNews", newsVO);
        System.out.println(responseBody);

        return "main" ;
    }

    // 사용자가 선택한 A -> A에 대한 정보 ( 데이터 부족으로 오픈 api 2개 추가 )
    @GetMapping("/posts/threecolumn/{teamId}")
    public String teamDetailSch(@PathVariable Integer teamId, Model model, HttpSession session) throws IOException, InterruptedException {
        
        if (session != null) {
            HttpRequest request1 = HttpRequest.newBuilder()
            .uri(URI.create("https://api-football-v1.p.rapidapi.com/v2/fixtures/team/" + teamId + "/6280?timezone=Europe/London"))
            .header("x-rapidapi-key", "6e1b55783bmsh96a786c871fd0d6p1660d6jsn4ac2f3db547f")
            .header("x-rapidapi-host", "api-football-v1.p.rapidapi.com")
            .method("GET", HttpRequest.BodyPublishers.noBody())
            .build();
            HttpResponse<String> response1 = HttpClient.newHttpClient().send(request1, HttpResponse.BodyHandlers.ofString());
            ObjectMapper objectMapper1 = new ObjectMapper();
            SoccerListVO soccerList1 = objectMapper1.readValue(response1.body(), SoccerListVO.class);
            model.addAttribute("soccerList1", soccerList1.getApi().getFixtures());

            HttpRequest request2 = HttpRequest.newBuilder()
            .uri(URI.create("https://api-football-v1.p.rapidapi.com/v2/teams/team/"+teamId))
            .header("x-rapidapi-key", "6e1b55783bmsh96a786c871fd0d6p1660d6jsn4ac2f3db547f")
            .header("x-rapidapi-host", "api-football-v1.p.rapidapi.com")
            .method("GET", HttpRequest.BodyPublishers.noBody())
            .build();
            HttpResponse<String> response2 = HttpClient.newHttpClient().send(request2, HttpResponse.BodyHandlers.ofString());
            ObjectMapper objectMapper2 = new ObjectMapper();
            SoccerListVO soccerList2 = objectMapper2.readValue(response2.body(), SoccerListVO.class);        
            model.addAttribute("soccerList2", soccerList2.getApi().getTeams());
            System.out.println("====================================================================");

            // 팀 이름 추출 및 출력
            List<SoccerListVO.Teams> teams = soccerList2.getApi().getTeams();
            for (SoccerListVO.Teams team : teams) {
                System.out.println("Team Name: " + team.getName());
                String clientId = "VThSYhofsxKXIWAvv9Wx";
                String clientSecret = "WRmau6BH7U" ; 
                try {
                    String teamName = URLEncoder.encode(team.getName(), "UTF-8");
                    String apiURL = "https://openapi.naver.com/v1/search/news?query=" + teamName;    // JSON 결과
                    Map<String, String> requestHeaders = new HashMap<>();
                    requestHeaders.put("X-Naver-Client-Id", clientId);
                    requestHeaders.put("X-Naver-Client-Secret", clientSecret);
                    String responseBody = get(apiURL,requestHeaders);    
                    // JSON 응답을 NewsVO로 변환 후 모델에 추가
                    NewsVO newsVO = objectMapper.readValue(responseBody, NewsVO.class);
                    model.addAttribute("teamNews", newsVO);
                    System.out.println(responseBody);
                } catch (UnsupportedEncodingException e) {
                    throw new RuntimeException("검색어 인코딩 실패",e);
                }



            }

        return "posts/threecolumn";   
        }  else{
            return "login/login";   
        } 
    }

    
    
    
    
    
    
    // 오픈 api 예제 
    // @RequestMapping("/main1")
    // public void teamDetail11( Model model) throws IOException, InterruptedException {
    // HttpRequest request = HttpRequest.newBuilder()
	// 	.uri(URI.create("https://api-football-v1.p.rapidapi.com/v2/odds/bookmakers/"))
	// 	.header("x-rapidapi-key", "6e1b55783bmsh96a786c871fd0d6p1660d6jsn4ac2f3db547f")
	// 	.header("x-rapidapi-host", "api-football-v1.p.rapidapi.com")
	// 	.method("GET", HttpRequest.BodyPublishers.noBody())
	// 	.build();
    //     HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
    // }



    // // 네이버 뉴스 api 
    private static String get(String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }


            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 오류 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }

        private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }

    private static String readBody(InputStream body) {
        InputStreamReader streamReader;
        try {
            streamReader = new InputStreamReader(body, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("UTF-8 인코딩이 지원되지 않습니다.", e);
        }
    
        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();
    
            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }
    
            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는 데 실패했습니다.", e);
        }
    }

}