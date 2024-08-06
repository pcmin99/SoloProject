<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html class="wide wow-animation" lang="en">
  <head>
    <!-- Site Title-->
    <title>TeamDetail</title>
    <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <link rel="icon" href="images/favicon.ico" type="image/x-icon">
    <!-- Stylesheets-->
    <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Kanit:300,400,500,500i,600,900%7CRoboto:400,900">
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" href="/css/fonts.css">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/style22.css">
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- SweetAlert CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <style>.ie-panel{display: none;background: #212121;padding: 10px 0;box-shadow: 3px 3px 5px 0 rgba(0,0,0,.3);clear: both;text-align:center;position: relative;z-index: 1;} html.ie-10 .ie-panel, html.lt-ie-10 .ie-panel {display: block;}</style>
    <script>
      function loadMoreNews() {
        var newsItems = document.querySelectorAll('#descriptionCon .post-classic');
        for (var i = 0; i < newsItems.length; i++) {
          if (newsItems[i].style.display === 'none') {
            newsItems[i].style.display = 'block';
          }
        }
      }

      function confirmLogout() {
        const username = $('#user').val();
        console.log(username);
        // SweetAlert를 사용하여 로그아웃 여부를 묻는 알림창 띄우기
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
    <script src="/js/jquery.min.js"></script>
    <script src="/js/searchImg.js"></script>
  </head>
  <body>
    <div class="ie-panel"><a href="http://windows.microsoft.com/en-US/internet-explorer/"><img src="images/ie8-panel/warning_bar_0000_us.jpg" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today."></a></div>
    <div class="preloader">
      <div class="preloader-body">
        <div class="preloader-item"></div>
      </div>
    </div>
    <!-- Page-->
    <div class="page">
      <!-- Page Header-->
      <%@ include file='../header.jsp' %>
      <!-- Latest News-->
      <section class="section section-md bg-gray-100">
        <div class="container">
          <div class="row row-50">
            <div class="col-lg-8">
              <c:forEach items="${soccerList2}" var="teamInfo" varStatus="loop">
              <div class="main-component">
                <!-- Heading Component-->
                <article class="heading-component">
                  <div class="heading-component-inner">
                    <h5 class="heading-component-title">Popular news
                    </h5>
                  </div>
                </article>
                <div class="row row-30">
                <div id="searchResults" class="row"></div>
                  
                </div>
                <!-- Heading Component-->
                <article class="heading-component">
                  <div class="heading-component-inner">
                    <h5 class="heading-component-title">${teamInfo.name}</h5>
                  </div>
                </article>
                <div class="row row-30">
                  <div class="col-md-12">
                    <!-- Post Future-->
                    <article class="post-future post-future-horizontal"><a class="post-future-figure" href="#"><img src="${teamInfo.logo}" alt="" width="370" height="325"/></a>
                      <div class="post-future-main">
                        <h4 class="post-future-title"><a href="#">Zidane: “We’re not going to change the way we play at the Calderón”</a></h4>
                        <div class="post-future-meta">
                          <div class="post-future-time">
                            <time datetime="2020"> ${teamInfo.venue_name}</time>
                          </div>
                        </div>
                        <hr/>
                        <div class="post-future-text">
                          ${teamInfo}
                          <p>Zidane spoke to the media at the Real Madrid City. The Whites coach explained how the team is going in to the second leg of the Champions...</p>
                        </div>
                      </div>
                    </article>
                  </div>
                </div>
              </div>
              </c:forEach>
            </div>
            <!-- Aside Block-->
            <div class="col-lg-4">
              <aside class="aside-components">
                <div class="aside-component">
                  <div class="owl-carousel-outer-navigation-1">
                    <!-- Heading Component-->
                    <article class="heading-component">
                      <div class="heading-component-inner">
                        <h5 class="heading-component-title">Team ScheDule</h5>
                        <div class="owl-carousel-arrows-outline">
                          <div class="owl-nav">
                            <button class="owl-arrow owl-arrow-prev"></button>
                            <button class="owl-arrow owl-arrow-next"></button>
                          </div>
                        </div>
                      </div>
                    </article>
                    <!-- Owl Carousel-->
                    <div class="owl-carousel owl-spacing-1" data-items="1" data-dots="false" data-nav="true" data-autoplay="true" data-autoplay-speed="4000" data-stage-padding="0" data-loop="true" data-margin="30" data-mouse-drag="false" data-animation-in="fadeIn" data-animation-out="fadeOut" data-nav-custom=".owl-carousel-outer-navigation-1">
                      <!-- Game Result Creative-->
                      <c:forEach items="${soccerList1}" var="match" varStatus="loop"> 
                      <article class="game-result game-result-creative">
                        <div class="game-result-main-vertical">
                          <div class="game-result-team game-result-team-horizontal game-result-team-first">
                            <figure class="game-result-team-figure"><img src="${match.homeTeam.logo}" alt="${match.homeTeam.team_name} Logo" width="40" height="32"/></figure>
                            <div class="game-result-team-title">
                              <div class="game-result-team-name">${match.homeTeam.team_name} </div>
                            </div>
                          </div><span class="game-result-team-divider">VS</span>
                          <div class="game-result-team game-result-team-horizontal game-result-team-second">
                            <figure class="game-result-team-figure"><img src="${match.awayTeam.logo}" alt="${match.awayTeam.team_name} Logo"width="40" height="32"/></figure>
                            <div class="game-result-team-title">
                              <div class="game-result-team-name">${match.awayTeam.team_name} </div>
                            </div>
                          </div>
                        </div>
                        <div class="game-result-footer">
                          <ul class="game-result-details">
                            <li>Round: ${fn:substringAfter(match.round, 'Regular Season - ')} </li>
                            <li>${match.venue}</li>
                            <li>
                              <time datetime="2020-04-14">${match.event_date}</time>
                            </li>
                          </ul>
                        </div>
                      </article>
                      </c:forEach>
                    </div>
                  </div>
                </div>
                <div class="aside-component">
                  <!-- Heading Component-->
                  <article class="heading-component">
                    <div class="heading-component-inner">
                      <h5 class="heading-component-title">NEWS</h5>
                      <button class="button button-xs button-gray-outline" id="loadMoreNewsBtn" onclick="loadMoreNews()">All news</button>
                    </div>
                  </article>
                  <!-- List Post Classic-->
                  <div class="list-post-classic" id="descriptionCon">
                    <!-- Post Classic-->
                    <c:forEach items="${teamNews.items}" var="teamNews1" varStatus="loop">
                      <article class="post-classic" style="${loop.index > 2 ? 'display:none;' : ''}">
                        <div class="post-classic-aside"><a class="post-classic-figure" href="#"></a></div>
                        <div class="post-classic-main">
                          <p class="post-classic-title"><a href="${teamNews1.link}">${teamNews1.title}</a></p>
                          <div class="post-classic-time">
                            <time datetime="2020">${teamNews1.description}</time>
                          </div>
                        </div>
                      </article>
                    </c:forEach>
                  </div>
                </div>
                <div class="aside-component">
                  <!-- Table team-->
                </div>
              </aside>
            </div>
          </div>
        </div>
      </section>
      <%@ include file='../footer.jsp' %>
      <!-- Modal Video-->
      <div class="modal modal-video fade" id="modal1" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
              <div class="embed-responsive embed-responsive-16by9">
                <iframe class="embed-responsive-item" width="560" height="315" data-src="https://www.youtube.com/embed/uSzNA2_y46c"></iframe>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Global Mailform Output-->
    <div class="snackbars" id="form-output-global"></div>
    <!-- Javascript-->
    <script src="/js/core.min.js"></script>
    <script src="/js/script.js"></script>
    <!-- SweetAlert JS -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  </body>
</html>
