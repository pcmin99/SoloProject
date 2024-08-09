<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="/css/login.css" />
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet' type="text/css">
    <!-- SweetAlert CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <style> 
    #dupiCheck {
        color: #fff;
        background-color: #0069d9;
        border-color: #0062cc;
        text-decoration: none;
        cursor: pointer;
        margin-top: 0.5rem !important;
        border-radius: 1.5rem;
    }

    .login__social--icon {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: 50px;
        height: 50px;
        border-radius: 33%;
        margin: 5px;
        font-size: 24px;
        color: white;
    }

    .login__social--icon.google {
        background-color: #db4437;
    }

    .login__social--icon.facebook {
        background-color: #3b5998;
    }

    .login__social--icon.naver {
        background-color: #1ec800;
        position: relative;
        top:10px;
    }
    </style>
    <!-- SweetAlert JS -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
</head>
<body>

    <div class="login">
        <div class="login__content">
            <div class="login__img">
                <img src="https://image.freepik.com/free-vector/code-typing-concept-illustration_114360-3581.jpg" alt="user login">
            </div>
            <div class="login__forms">
                <!-- 로그인 폼 -->
                <form action="/loginonlyLogin" method="post" class="login__register" id="login-in">
                    <h1 class="login__title">로그인</h1>
                    <div class="login__box">
                        <i class='bx bx-user login__icon'></i>
                        <input type="text" placeholder="UserId" name="username" class="login__input">
                    </div>
                    <div class="login__box">
                        <i class='bx bx-lock login__icon'></i>
                        <input type="password" placeholder="Password" name="password" class="login__input">
                    </div>
                    <a href="#" class="login__forgot">비밀번호를 잊으셨나요?</a>
                    
                    <span> 
                        <c:if test="${error}">
                            <p id="valid" class="alert alert-danger">${exception}</p>
                        </c:if>
                    </span>
                    
                    <input type="submit" value="로그인" class="login__button" />
                    
                    <div>
                        <span class="login__account login__account--account">계정이 없으신가요?</span>
                        <span class="login__signin login__signin--signup" id="sign-up">회원가입</span>
                    </div>
                </form>
                
                <!-- 회원가입 폼 -->
                <form action="/login/join" method="post" class="login__create none" id="login-up">
                    <h1 class="login__title">회원가입</h1>
                    <div class="login__box">
                        <i class='bx bx-user login__icon'></i>
                        <input type="text" placeholder="UserId" name="username" id="username" class="login__input">
                        <input type="button" value="중복 확인" id="dupiCheck"  class="btn btn-primary mt-2" />
                        <span id="idError" class="validateError"></span>
                    </div>
                    
                    <div class="login__box">
                        <i class='bx bx-at login__icon'></i>
                        <input type="email" placeholder="Email" name="email" id="joinEmail" class="login__input">
                    </div>
                    
                    <div class="login__box">
                        <i class='bx bx-lock login__icon'></i>
                        <input type="password" placeholder="Password" name="password" id="joinPassword" class="login__input">
                    </div>
                    
                    <input type="submit" value="회원가입" class="login__button joinbutton" />

                    <div>
                        <span class="login__account login__account--account">이미 계정이 있으신가요?</span>
                        <span class="login__signup login__signup--signup" id="sign-in">로그인</span>
                    </div>
                    
                    <div class="login__social">
                        <a href="/oauth2/authorization/google" class="login__social--icon google">
                            <i class='bx bxl-google'></i>
                        </a>
                        <%-- <a href="/oauth2/authorization/facebook" class="login__social--icon facebook">
                            <i class='bx bxl-facebook'></i>
                        </a> --%>
                        <a href="/oauth2/authorization/naver" id="naver_id_login" class="login__social--icon naver">
                           <img class="img-fluid" style="max-height: 80%; " src="../images/naver.jpg"/>
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="../js/login.js"></script>
    <%-- <script type="text/javascript">
        var naver_id_login = new naver_id_login("VThSYhofsxKXIWAvv9Wx", "http://localhost:8080/login/oauth2/code/naver");
        var state = naver_id_login.getUniqState();
        naver_id_login.setButton("green", 1,30);
        naver_id_login.setDomain(".service.com");
        naver_id_login.setState(state);
        naver_id_login.init_naver_id_login();
    </script> --%>
    
</body>
</html>
