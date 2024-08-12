package com.example.soloproject.controller;

import java.io.BufferedReader;
import java.io.File;
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
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.SecurityProperties.User;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.soloproject.domain.CommentsVO;
import com.example.soloproject.domain.ImgVO;
import com.example.soloproject.domain.NewsVO;
import com.example.soloproject.domain.PostsVO;
import com.example.soloproject.domain.SearchResultVO;
import com.example.soloproject.domain.SoccerListVO;
import com.example.soloproject.dto.Member.MemberJoinRequestDto;
import com.example.soloproject.service.CommentsService;
import com.example.soloproject.service.ImgService;
import com.example.soloproject.service.PostsService;
import com.example.soloproject.service.member.MemberService;
import com.example.soloproject.util.MD5Generator;
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

    // 게시물 service
    @Autowired
    private PostsService postsService ;

    @Autowired
    private ImgService imgService ;

    @Autowired
    private CommentsService commentsService ; 


    private final ObjectMapper objectMapper = new ObjectMapper();



    @RequestMapping("/{step}")
    public String viewPage(@PathVariable String step) {
        return step;
    }

    // 로그인
    @RequestMapping("/login/login")
    public String loginPage(User user,HttpSession session,  @RequestParam(value= "error", required = false) String error, 
                                                            @RequestParam(value= "exception", required = false) String exception,
                                                            Model model 
                ){
        model.addAttribute("error",error);
        model.addAttribute("exception",exception);
        session.setAttribute("loggedInUser", user);
        return "login/login" ; 
    }


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
    public String logout(HttpSession session) {
        session.invalidate();
        return "main";
    }

    // 푸터
    @PostMapping(value ="/footer")
    @ResponseBody
    public List<PostsVO> topViewPosts(Model m) {        
    List<PostsVO> list = postsService.topViewPosts();

    m.addAttribute("footerTopViewPosts", list);
    return list;
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

        // 세션에서 사용자 정보를 가져와 모델에 추가
        if (session != null && session.getAttribute("SPRING_SECURITY_CONTEXT") != null) {
            SecurityContext securityContext = (SecurityContext) session.getAttribute("SPRING_SECURITY_CONTEXT");
            Authentication authentication = securityContext.getAuthentication();
            if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
                UserDetails userDetails = (UserDetails) authentication.getPrincipal();
                session.setAttribute("loggedInUser", userDetails);
                model.addAttribute("loggedInUser", userDetails);
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
        NewsVO newsVO = objectMapper.readValue(responseBody, NewsVO.class);
        model.addAttribute("leagueNews", newsVO);

        // posts main 리스트
        List<PostsVO> allPosts = postsService.allpost();
        model.addAttribute("allPosts",allPosts);

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

            // 팀 이름 추출 및 출력
            List<SoccerListVO.Teams> teams = soccerList2.getApi().getTeams();
            for (SoccerListVO.Teams team : teams) {
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
                } catch (UnsupportedEncodingException e) {
                    throw new RuntimeException("검색어 인코딩 실패",e);
                }



            }

        return "posts/threecolumn";   
        }  else{
            return "login/login";   
        } 
    }

    
    // posts boardList page -> allSelect 
    @GetMapping("/posts/boardList")
    public String boardList(Model model) {
                List<PostsVO> postListId = postsService.postListId();
                model.addAttribute("postListId",postListId);
                
        return "posts/boardList" ; 

    }

    // id = posts id
    @GetMapping("/posts/postDetail/{id}")
    public String postDetail(Model model, @PathVariable("id") int id) {
        
        PostsVO postvo = new PostsVO();
        postvo.setId(id);
        postsService.clickPosts(postvo);

        CommentsVO commentsvo = new CommentsVO();
        commentsvo.setId(id);
        PostsVO result = postsService.postDetail(postvo);  
        
        List<CommentsVO> result1 = postsService.comment(commentsvo); 
        
        model.addAttribute("post", result);
        model.addAttribute("comments", result1);
          
        return "posts/postDetail";  // 뷰 이름 반환
    };
    
    // 댓글 입력
    @PostMapping("/posts/insertComments")
    public String insertComment(@RequestParam("comment") String comment,
                                @RequestParam("posts_id") int posts_id,
                                @RequestParam("user_id") String user_id,
                                RedirectAttributes redirectAttributes
                                ){
        CommentsVO commentsVO = new CommentsVO() ; 
        commentsVO.setPosts_id(posts_id);
        commentsVO.setMember_username(user_id);
        commentsVO.setComment(comment);
        commentsService.insertComment(commentsVO);
        redirectAttributes.addAttribute("posts_id", posts_id);
        return "redirect:/posts/postDetail/{posts_id}";
    };
    
    // boardList page 삭제 버튼 delte
    // 사용자가 쓴 글 지우는데 댓글 단 사용자와 상관없이 전체 삭제
    // imgfile 먼저 지우고 -> posts 지우기 
    // mysql-> 멀티 delete 안됌
    @PostMapping("/boardList/{id}")
    public ResponseEntity<Void> deletePost(@PathVariable int id) {
        PostsVO postvo = new PostsVO() ;
        ImgVO imgvo = new ImgVO() ;
        CommentsVO commentsVO = new CommentsVO(); 

        imgvo.setPosts_id(id); 
        postvo.setId(id);
        commentsVO.setPosts_id(id);
        commentsService.deletePostsid(commentsVO);
        imgService.deletePostsid(imgvo) ; 
        postsService.deletePost(postvo) ;
        return ResponseEntity.noContent().build() ; 
    }

    // 댓글 삭제 
    @PostMapping("/postDetail/{comsid}")
    public ResponseEntity<Void> deleteCommid(@PathVariable int comsid) {

        CommentsVO comentsvo = new CommentsVO() ;
        comentsvo.setComsid(comsid);

        commentsService.deleteComment(comentsvo);
        return ResponseEntity.noContent().build() ; 
    }



    @GetMapping("/posts/postInsert")
    public String postInsert1() {

        return "posts/postInsert";
    }
    


    @PostMapping("/posts/postInsertForm")
	public String postInsert(@RequestParam(name = "file", required = false) MultipartFile file, PostsVO postvo) {
		try {
            String defaultProfileImagePath = "static/images/6c757d.jpg";
            // 파일첨부가 있는 경우
            if( file != null && !file.isEmpty() ){
                String imgfile_name = file.getOriginalFilename();
                System.out.println("originFilename : " + imgfile_name);
                String imgfile_real_name = new MD5Generator(imgfile_name).toString();
                // => static 폴더 밑으로 이동해야 사용자가 그 파일에 접근 가능
                String save_path = System.getProperty("user.dir")+"\\src\\main\\resources\\static\\images";
                if( !new File(save_path).exists() ){
                    new File(save_path).mkdir();
                } 
                String img_path = save_path + "\\" + imgfile_name;
                System.out.println("filepath : " + img_path);

                // 파일저장
                file.transferTo(new File(img_path));
                // 디비저장 시 파일정보 덩어리 추가
				postsService.postInsert(postvo);
				System.out.println("postsService.postInsert() 요청");
                

                
                // 디비저장을 위해서 파일정보 덩어리 만들기
                ImgVO ivo = new ImgVO();
				ivo.setImgfile_name(imgfile_name);
                ivo.setImgfile_real_name(imgfile_real_name);
                ivo.setImg_path(img_path);
                ivo.setPosts_id(imgService.selectNum());
                System.out.println("<<<<< 파일정보 덩어리 만들기 성공 >>>>>");
                imgService.postInsertImg(ivo);
                System.out.println("imgService.postInsertImg() 요청");

            }else {
                
                // 파일첨부가 없는 경우
                // 기본 이미지를 업로드할 수 있도록 경로 설정
                String defaultImg_real_name = new MD5Generator(defaultProfileImagePath).toString();
                String save_path = System.getProperty("user.dir") + "\\src\\main\\resources\\";
                String img_path = save_path + defaultProfileImagePath;
                System.out.println("img_path : " + img_path);

                // 기본 이미지 저장
                InputStream defaultImageStream = getClass().getClassLoader().getResourceAsStream(defaultProfileImagePath);
                Files.copy(defaultImageStream, Paths.get(img_path), StandardCopyOption.REPLACE_EXISTING);

                // 디비저장 시 파일정보 덩어리 추가
                postsService.postInsert(postvo);
                

                // 디비저장을 위해
                ImgVO ivo = new ImgVO();
                ivo.setImgfile_name("6c757d.jpg");
                ivo.setImgfile_real_name(defaultImg_real_name);
                ivo.setImg_path(img_path);
                ivo.setPosts_id(imgService.selectNum());
                imgService.postInsertImg(ivo);
    
            }
			return "redirect:/posts/boardList";
        }catch(Exception ex){
            ex.printStackTrace();
            System.out.println("파일업로드 실패 : " + ex.getMessage());
            return "main"; // 실패 시 처리할 페이지로 리다이렉트
        }
		
	}

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