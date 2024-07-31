<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html class="wide wow-animation" lang="en">
  <head>
    <!-- Site Title-->
    <title>Home</title>
    <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <link rel="icon" href="images/favicon.ico" type="image/x-icon">
    <!-- Stylesheets-->
    <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Kanit:300,400,500,500i,600,900%7CRoboto:400,900">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/fonts.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/style22.css">
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
	  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
        <!-- SweetAlert CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <style>.ie-panel{display: none;background: #212121;padding: 10px 0;box-shadow: 3px 3px 5px 0 rgba(0,0,0,.3);clear: both;text-align:center;position: relative;z-index: 1;} html.ie-10 .ie-panel, html.lt-ie-10 .ie-panel {display: block;}</style>
      <script>
			document.addEventListener('DOMContentLoaded', function() {
				document.getElementById('loadMoreBtn').addEventListener('click', function() {
					var matches = document.querySelectorAll('.game-result .game-info-creative');
					for (var i = 3; i < matches.length; i++) {
						if (matches[i].style.display === 'none') {
							matches[i].style.display = 'block';
						}
					}

					var hiddenMatches = document.querySelectorAll('.game-result .match-info[style="display:none;"]');
					if (hiddenMatches.length === 0) {
						document.getElementById('loadMoreBtn').style.display = 'none';
					}
				});
			});

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
    <script src="/js/teamid.js"></script>
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
    <%@ include file='header.jsp' %>
      <!-- Latest News-->
      <section class="section section-md bg-gray-100">
        <div class="container">
          <div class="row row-50">
            <div class="col-lg-8">
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
              </div>
              <div class="main-component">
                <!-- Heading Component-->
                <article class="heading-component">
                  <div class="heading-component-inner">
                    <h5 class="heading-component-title">24-25 Match
                    </h5>
                  </div>
                </article>
                <!-- Game Result Bug-->
                <article class="game-result">
                <c:forEach items="${soccerList}" var="soccer" varStatus="status"> 
                  <div class="game-info game-info-creative" style="${status.index > 2 ? 'display:none;' : ''}">
                    <p class="game-info-subtitle">${soccer.event_date}
                      <time datetime="">ROUND:  ${fn:substringAfter(soccer.round, 'Regular Season - ')}  </time>
                    </p>
                    <h3 class="game-info-title">${soccer.league.name}</h3>
                    <div class="game-info-main">
                      <div class="game-info-team game-info-team-first">
                        <figure><img src="${soccer.homeTeam.logo}" alt="" width="75" height="99"/>
                        <div class="game-result-team-name">${soccer.homeTeam.team_name}</div>
                        <input type="hidden" value="${soccer.homeTeam.team_id}" class="homeTeamid" />
                      </div>
                      <div class="game-info-middle game-info-middle-vertical">
                        <time class="time-big" datetime="2020-04-17"><span class="heading-3">Fri 19</span>${soccer.venue}
                        </time>
                        <div class="game-result-divider-wrap"><span class="game-info-team-divider">VS</span></div>
                        <div class="group-sm">
                        </div>
                      </div>
                      <div class="game-info-team game-info-team-second">
                        <figure><img src="${soccer.awayTeam.logo}" alt="" width="91" height="91"/>
                        <div class="game-result-team-name">${soccer.awayTeam.team_name}</div>
                        <input type="hidden" value="${soccer.awayTeam.team_id}" class="awayTeamid" /> 
                      </div>
                    </div>
                  </div>
                  </c:forEach>
                </article>
              
              	<button id="loadMoreBtn">Load More</button>
              </div>
            </div>
            <!-- Aside Block-->
            <div class="col-lg-4">
              <aside class="aside-components">
                <div class="aside-component">
                  <div class="owl-carousel-outer-navigation-1">
                  </div>
                </div>
                <div class="aside-component">
                  <!-- Heading Component-->
                  <article class="heading-component">
                    <div class="heading-component-inner">
                      <h5 class="heading-component-title" >SEARCH TIME: <br/>
                              <span id="leagueNews">${leagueNews.lastBuildDate}</span>
                      </h5>
                    </div>
                  </article>
                  <!-- List Post Classic-->
                  <div class="list-post-classic">
                                      <!-- Post Classic-->
                                      <c:forEach items="${leagueNews.items}" var="items" varStatus="status" >
                                      <article class="post-classic">
                                        <div class="post-classic-aside">
                                        </div>
                                        <div class="post-classic-main">
                                          <p class="post-classic-title">
                                            <a href="${items.link}">
                                            ${items.title}
                                            </a>
                                          </p>
                                          <div class="post-classic-time">
                                            <time datetime="2020">
                                              ${items.description}
                                            </time>
                                          </div>
                                        </div>
                                      </article>
                                      </c:forEach>
                </div>
                <div class="aside-component">
                
                  <div class="owl-carousel-outer-navigation">
                    <!-- Heading Component-->
                    <article class="heading-component">
                      <div class="heading-component-inner">
                        <h5 class="heading-component-title">COMMU
                        </h5>
                      </div>
                    </article>
                    <!-- Owl Carousel-->
                    <div class="owl-carousel owl-spacing-1" data-items="1" data-dots="false" data-nav="true" data-autoplay="true" data-autoplay-speed="4000" data-stage-padding="0" data-loop="false" data-margin="30" data-mouse-drag="false" data-nav-custom=".owl-carousel-outer-navigation">
                    	<section class="ftco-section">
                      <div class="container">
                        <div class="row">
                          <div class="col-md-12">
                            <div class="table-wrap">
                              <table class="table">
                                <thead class="thead-dark">
                                  <tr>
                                    <th>View</th>
                                    <th>User ID</th>
                                    <th></th>
                                    <th>Email</th>
                                    <th>Title </th>
                                    <th>Id No. </th>
                                  </tr>
                                </thead>
                                <tbody>
                                  <c:forEach items="${allPosts}" var="allPosts" >
                                  <tr class="alert" role="alert">
                                    <td>${allPosts.view}</td>
                                    <td class="user_idHidden">${allPosts.user_id}</td>
                                    <td>
                                      <a href="#" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true"  id="close123" style="display:none;" >
                                          <i class="fa fa-close"></i>
                                        </span>
                                      </a>
                                    </td>
                                    <td>${allPosts.email}</td>
                                    <td>${allPosts.title}</td>
                                    <th scope="row">${allPosts.id}</th>
                                  </tr>
                                  </c:forEach >
                                </tbody>
                              </table>
                            </div>
                          </div>
                        </div>
                      </div>
                    </section>
                    </div>
                  </div>
                </div>
              </aside>
            </div>
          </div>
        </div>
      </section>
      <%@ include file='footer.jsp' %>
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
    <script src="js/core.min.js"></script>
    <script src="js/script.js"></script>
    <!-- SweetAlert JS -->
    <script	script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  </body>
</html>