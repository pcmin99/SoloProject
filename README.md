#

영국 프리미어리그 축구 팀 소개 및 커뮤니티 프로젝트 입니다. 

## 개발 언어
![REACT](https://img.shields.io/badge/React-61DAFB?style=flat&logo=React&logoColor=FFFFFF)
![SpringBoot](https://img.shields.io/badge/SpringBoot-6DB33F?style=flat&logo=SpringBoot)
![MyBatis](https://img.shields.io/badge/MyBatis-000000?style=flat)
![JPA](https://img.shields.io/badge/JPA-000000?style=flat)



<hr>

#### SQL 연결
1. SQL 생성 - MYSQL
2. Tool : dbeaver 사용
3. SpringBoot에 properties 설정 변경


## API 연결
Naver api, Google api, rapidapi 를 사용하였으며 모든 api들은 Controller에서 구현 되었다. 

## DB
![dbmodelJPG](https://github.com/user-attachments/assets/d0b87c17-6413-4e3e-858a-df4051122220)

movieapp: 
usertags: 
tag: 
usermovie: 

## Proxy
```cmd
npm install http-proxy-middleware --save
```
이를 이용해 proxy로 포트를 8080으로 연결해주었다.
또한 build.gradle에서 build 시 react build를 포함할 수 있도록 해주었다.

## 시연 동영상



## 주요 기능


### 기본화면
<img width="1120" alt="image" src="https://github.com/jeongdonggi/MovieWeb/assets/100845304/2a00d7c4-bca9-4afd-b9b0-fdfe7a60999e">



### 값 입력 - 로그인, 회원가입, 업데이트, 회원탈퇴 등
<img width="1120" alt="image" src="https://github.com/jeongdonggi/MovieWeb/assets/100845304/3b5ef867-9d87-41b6-9385-4d49c0918586">



### 로그인 화면
![캡처](https://github.com/user-attachments/assets/f6079bc6-06f6-4747-a451-65c84d78f680)

구글 ,네이버 소셜 로그인 가능 합니다.


### 회원 정보
<img width="1120" alt="image" src="https://github.com/jeongdonggi/MovieWeb/assets/100845304/026c4a4c-b799-42c3-902d-953b1ebe64d6">


## Spring Security
![securityJPG](https://github.com/user-attachments/assets/cc37c525-a412-4c72-920d-5e913236ce50)


1. Router
   
   Router를 사용하다보니 값이 하트를 누르고 추천 영화를 보러 들어가게 되면 Loading값이 변경되어 있는 상태여서 하트를 누른 값인지 DB를 찾아보기 전에 값이 넘어가서 하트가 눌렸다. 이 값을 useEffect를 이용하여 새로운 화면으로 넘어가기 전에 값을 변경해주는 방식으로 고쳤다.
