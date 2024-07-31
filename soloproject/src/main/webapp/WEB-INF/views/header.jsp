<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html class="wide wow-animation" lang="en">
  <head>
    <!-- SweetAlert CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <style>.ie-panel{display: none;background: #212121;padding: 10px 0;box-shadow: 3px 3px 5px 0 rgba(0,0,0,.3);clear: both;text-align:center;position: relative;z-index: 1;} html.ie-10 .ie-panel, html.lt-ie-10 .ie-panel {display: block;}</style>
      <script>
        // document.addEventListener('DOMContentLoaded', function() {
        //     document.getElementById('loadMoreBtn').addEventListener('click', function() {
        //         var matches = document.querySelectorAll('.game-result .game-info-creative');
        //         for (var i = 3; i < matches.length; i++) {
        //             if (matches[i].style.display === 'none') {
        //                 matches[i].style.display = 'block';
        //             }
        //         }

        //         var hiddenMatches = document.querySelectorAll('.game-result .match-info[style="display:none;"]');
        //         if (hiddenMatches.length === 0) {
        //             document.getElementById('loadMoreBtn').style.display = 'none';
        //         }
        //     });
        // });

        function confirmLogout() {
            event.preventDefault();  // 
            const username = $('#loggedInUser').val();
            console.log(username);
            swal({
                title: "로그아웃 하시겠습니까?",
                icon: "warning",
                buttons: {
                    cancel: {
                        text: "취소",
                        value: false,
                        visible: true,
                        className: "",
                        closeModal: true,
                    },
                    confirm: {
                        text: "확인",
                        value: true,
                        visible: true,
                        className: "",
                        closeModal: true
                    }
                }
            }).then((willLogout) => {
                if (willLogout) {
                    window.location.href = "/login/logout";
                }
            });
        }
    </script>
  </head>
  <body>
    <header class="section page-header rd-navbar-dark">
       <!-- RD Navbar-->
        <div class="rd-navbar-wrap">
          <nav class="rd-navbar rd-navbar-classic" data-layout="rd-navbar-fixed" data-sm-layout="rd-navbar-fixed" data-md-layout="rd-navbar-fixed" data-md-device-layout="rd-navbar-fixed" data-lg-layout="rd-navbar-fixed" data-lg-device-layout="rd-navbar-fixed" data-xl-layout="rd-navbar-static" data-xl-device-layout="rd-navbar-static" data-xxl-layout="rd-navbar-static" data-xxl-device-layout="rd-navbar-static" data-lg-stick-up-offset="166px" data-xl-stick-up-offset="166px" data-xxl-stick-up-offset="166px" data-lg-stick-up="true" data-xl-stick-up="true" data-xxl-stick-up="true">
            <div class="rd-navbar-panel">
              <!-- RD Navbar Toggle-->
              <button class="rd-navbar-toggle" data-rd-navbar-toggle=".rd-navbar-main"><span></span></button>
              <!-- RD Navbar Panel-->
              <div class="rd-navbar-panel-inner container">
                <div class="rd-navbar-collapse rd-navbar-panel-item rd-navbar-panel-item-left">
                  <!-- Owl Carousel-->
                  <div class="owl-carousel-navbar owl-carousel-inline-outer">
                    <div class="owl-carousel-inline-wrap">
                    </div>
                  </div>
                </div>
                <div class="rd-navbar-panel-item rd-navbar-panel-item-right">
                  <ul class="list-inline list-inline-bordered">
                    <li>
                    <c:if test="${not empty loggedInUser}">
                    <a class="link link-icon link-icon-left link-classic" href="" onclick="confirmLogout()">
                    <span class="icon fl-bigmug-line-login12"></span>
                    <span class="link-icon-text">LOGOUT</span>
                    <input type="hidden" value="${loggedInUser}" id="loggedInUser" class="userInfoId" />
                    </a>
                    </c:if>
                    <c:if test="${empty loggedInUser}">
                    <a class="link link-icon link-icon-left link-classic" href="../login/login" id="loggedInUser">
                    <span class="icon fl-bigmug-line-login12"></span>
                    <span class="link-icon-text">LOGIN</span>
                    </a>
                    </c:if>
                    </li>
                  </ul>
                </div>
                <div class="rd-navbar-collapse-toggle rd-navbar-fixed-element-1" data-rd-navbar-toggle=".rd-navbar-collapse"><span></span></div>
              </div>
            </div>
            <div class="rd-navbar-main">
              <div class="rd-navbar-main-top">
                <div class="rd-navbar-main-container container">
                  <!-- RD Navbar Brand-->
                  <div class="rd-navbar-brand"><a class="brand" href="/main"><img class="brand-logo " src="/images/logo-soccer-default-95x126.png" alt="" width="95" height="126"/></a>
                  </div>
                  <!-- RD Navbar List-->
                  <ul class="rd-navbar-list">
                    <li class="rd-navbar-list-item"><a class="rd-navbar-list-link" href="#"><img src="/images/partners-1-inverse-75x42.png" alt="" width="75" height="42"/></a></li>
                    <li class="rd-navbar-list-item"><a class="rd-navbar-list-link" href="#"><img src="/images/partners-2-inverse-88x45.png" alt="" width="88" height="45"/></a></li>
                    <li class="rd-navbar-list-item"><a class="rd-navbar-list-link" href="#"><img src="/images/partners-3-inverse-79x52.png" alt="" width="79" height="52"/></a></li>
                  </ul>
                  <!-- RD Navbar Search-->
                  <div class="rd-navbar-search">
                    <button class="rd-navbar-search-toggle" data-rd-navbar-toggle=".rd-navbar-search"><span></span></button>
                    <form class="rd-search" action="" data-search-live="rd-search-results-live" method="">
                      <div class="form-wrap">
                        <label class="form-label" for="rd-navbar-search-form-input">Team Search..</label>
                        <input class="rd-navbar-search-form-input form-input" id="rd-navbar-search-form-input" type="text" name="searchImg" autocomplete="off" id="searchImg" value="" >
                        <div class="rd-search-results-live" id="rd-search-results-live"></div>
                      </div>
                      <button class="rd-search-form-submit fl-budicons-launch-search81" type="submit"></button>
                    </form>

                  </div>
                </div>
              </div>
              <div class="rd-navbar-main-bottom rd-navbar-darker">
                <div class="rd-navbar-main-container container">
                  <!-- RD Navbar Nav-->
                  <ul class="rd-navbar-nav">
                    <li class="rd-nav-item"><a class="rd-nav-link" href="/main">Home</a></li>
                    <li class="rd-nav-item"><a class="rd-nav-link" href="/posts/boardList">Board</a></li>
                  </ul>
                  <div class="rd-navbar-main-element"></div>
                </div>
              </div>
            </div>
          </nav>
        </div>
      </header>
      <!-- SweetAlert JS -->
      <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  </body>
</html>
