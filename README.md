#

영국 프리미어리그 축구 팀 소개 및 커뮤니티 프로젝트 입니다. 

## 개발 언어
![SpringBoot](https://img.shields.io/badge/SpringBoot-6DB33F?style=flat&logo=SpringBoot)
![Java](https://img.shields.io/badge/Java-6DB33F?style=flat&logo=Java)
![MyBatis](https://img.shields.io/badge/MyBatis-000000?style=flat&logo=MyBatis)
![JPA](https://img.shields.io/badge/JPA-000000?style=flat&logo=JPA)
![SpringSecurity](https://img.shields.io/badge/SpringSecurity-000000?style=flat&logo=SpringSecurity)


![Mysql](https://img.shields.io/badge/Mysql-000000?style=flat&logo=Mysql)
![HTML](https://img.shields.io/badge/HTML-000000?style=flat&logo=HTML)
![javascript](https://img.shields.io/badge/javascript-000000?style=flat&logo=javascript)

<hr>

#### SQL 연결
1. SQL 생성 - MYSQL
2. Tool : dbeaver 사용
3. SpringBoot에 properties 설정 변경
<hr/>

## API 연결
Naver api, Google api, rapidapi 를 사용하였으며 모든 api들은 Controller에서 구현 되었다. 
실시간 현재 시간 기준으로 뉴스 데이터를 가져오는 네이버 검색 api
사용자에게 텍스트를 받아서 텍스트에 대한 뉴스를 가져오는 네이버 api
<hr/>
## DB
![dbmodelJPG](https://github.com/user-attachments/assets/d0b87c17-6413-4e3e-858a-df4051122220)

comments: 게시글에 관한 댓글 DB
posts: 게시글 DB
member: 회원 가입 사용자 DB
imgfile: 게시글 imgfile DB
<hr/>

## 시연 동영상
<hr/>

## 주요 기능
- main에서 원하는 팀 클릭시 해당 팀 스케줄, 해당 팀 뉴스 확인 가능
- 사용자를 위한 커뮤니티 입력 가능 ( 파일 포함 )
- 해당 커뮤니티 글에 관한 댓글 입력 가능하며 
- 커뮤니티 글은 내가 쓴 글에만 X가 뜨며
- 댓글은 삭제 텍스트는 동일하게 뜨지만 세션 값이 다를시 확인 문구가 뜹니다
- 관리자 권한 있는 아이디일시 댓글은 삭제가 가능합니다.
- 네이버 api를 통해 사용자가 원하는 텍스트에 대한 뉴스를 보실 수 있습니다.
- Google, Naver 소셜 로그인 가능합니다
### 예제 입니다.
![aosdb](https://github.com/user-attachments/assets/8ab68778-9479-4c04-856d-23a7351f4312)

### 홈 화면 - User
![main](https://github.com/user-attachments/assets/e6a5c017-eb19-48e2-bbc9-6a786ad0cc1f)

<hr/>

### 홈 화면 - Admin
![adminmain](https://github.com/user-attachments/assets/3106688f-de13-4ec5-8da7-26ee11e8df1a)

### 로그인 화면

![123123](https://github.com/user-attachments/assets/436d54c0-e219-41ea-8c23-9bfef821933c)

회원 가입시 ID 유효성 검사 완료. 
구글 ,네이버 소셜 로그인 가능 합니다.


### 회원 정보 관리자가 보는 리스트 입니다.
![userdb](https://github.com/user-attachments/assets/3cd8a60a-bef7-4839-aae8-497d6743ea90)


## Spring Security
- 현재는 회원 가입시 자동으로 role 컬럼이 자동으로 USER로 저장 됩니다.
- 로그인과 회원 가입은 JPA를 사용하였습니다.
- ADMIN 권한은 모든 화면을 볼수 있게 해놨으며 USER권한은 userBoard가 자체가 안보입니다.
- 밑에 사진은 Back에서 보내는 에러 문구 입니다
![backLoginerror](https://github.com/user-attachments/assets/7d7234d9-ea6d-48a6-87c0-083a321139b9)
<hr/>
![securityJPG](https://github.com/user-attachments/assets/cc37c525-a412-4c72-920d-5e913236ce50)
