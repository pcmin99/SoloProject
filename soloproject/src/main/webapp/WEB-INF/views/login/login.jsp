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
    <!-- SweetAlert JS -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

    <div class="login">
        <div class="login__content">
            <div class="login__img">
                <img src="https://image.freepik.com/free-vector/code-typing-concept-illustration_114360-3581.jpg" alt="user login">
            </div>
            <div class="login__forms">
                <!-- Login form -->
                <form action="/loginonlyLogin" method="post" class="login__register" id="login-in">
                    <h1 class="login__title">Sign In</h1>
                    <div class="login__box">
                        <i class='bx bx-user login__icon'></i>
                        <input type="text" placeholder="Username" name="username" class="login__input">
                    </div>
                    <div class="login__box">
                        <i class='bx bx-lock login__icon'></i>
                        <input type="password" placeholder="Password" name="password" class="login__input">
                    </div>
                    <a href="#" class="login__forgot">Forgot Password? </a>
                    
                    <input type="submit" value="Sign In" class="login__button" />
                    
                    <div>
                        <span class="login__account login__account--account">Don't Have an Account?</span>
                        <span class="login__signin login__signin--signup" id="sign-up">Sign Up</span>
                    </div>
                </form>
                
                <!-- Create account form -->
                <form action="/login/join" method="post" class="login__create none" id="login-up">
                    <h1 class="login__title">Create Account</h1>
                    <div class="login__box">
                        <i class='bx bx-user login__icon'></i>
                        <input type="text" placeholder="Username" name="username" id="username" class="login__input">
                        <input type="button" value="중복 확인" id="dupiCheck" />
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
                    
                    <input type="submit" value="Sign Up" class="login__button joinbutton" />

                    <div>
                        <span class="login__account login__account--account">Already have an Account?</span>
                        <span class="login__signup login__signup--signup" id="sign-in">Sign In</span>
                    </div>
                    
                    <div class="login__social">
                        <a href="#" class="login__social--icon"><i class='bx bxl-google'></i></a>
                        <a href="#" class="login__social--icon"><i class='bx bxl-github'></i></a>
                        <a href="#" class="login__social--icon"><i class='bx bxl-facebook'></i></a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="../js/login.js"></script>
</body>
</html>
