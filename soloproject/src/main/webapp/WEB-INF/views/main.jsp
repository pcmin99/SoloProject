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
                    <c:if test="${not empty user}">
                    <a class="link link-icon link-icon-left link-classic" href="" onclick="confirmLogout()">
                    <span class="icon fl-bigmug-line-login12"></span>
                    <span class="link-icon-text">LOGOUT</span>
                    <input type="hidden" value="${user}" id="user" />
                    </a>
                    </c:if>
                    <c:if test="${empty user}">
                    <a class="link link-icon link-icon-left link-classic" href="login/login" id="user">
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
                  <div class="rd-navbar-brand"><a class="brand" href="./"><img class="brand-logo " src="images/logo-soccer-default-95x126.png" alt="" width="95" height="126"/></a>
                  </div>
                  <!-- RD Navbar List-->
                  <ul class="rd-navbar-list">
                    <li class="rd-navbar-list-item"><a class="rd-navbar-list-link" href="#"><img src="images/partners-1-inverse-75x42.png" alt="" width="75" height="42"/></a></li>
                    <li class="rd-navbar-list-item"><a class="rd-navbar-list-link" href="#"><img src="images/partners-2-inverse-88x45.png" alt="" width="88" height="45"/></a></li>
                    <li class="rd-navbar-list-item"><a class="rd-navbar-list-link" href="#"><img src="images/partners-3-inverse-79x52.png" alt="" width="79" height="52"/></a></li>
                  </ul>
                  <!-- RD Navbar Search-->
                  <div class="rd-navbar-search">
                    <button class="rd-navbar-search-toggle" data-rd-navbar-toggle=".rd-navbar-search"><span></span></button>
                    <form class="rd-search" action="#" data-search-live="rd-search-results-live" method="GET">
                      <div class="form-wrap">
                        <label class="form-label" for="rd-navbar-search-form-input">Team Search..</label>
                        <input class="rd-navbar-search-form-input form-input" id="rd-navbar-search-form-input" type="text" name="s" autocomplete="off">
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
                                      <li class="rd-nav-item active"><a class="rd-nav-link" href="index.html">Home</a>
                                      </li>
                                      <li class="rd-nav-item"><a class="rd-nav-link" href="https://livedemo00.template-help.com/wt_63853_v4/soccer/index.html">Game overview</a>
                                      </li>
                                      <li class="rd-nav-item"><a class="rd-nav-link" href="https://livedemo00.template-help.com/wt_63853_v4/soccer/index.html">Typography</a>
                                      </li>
                                      <li class="rd-nav-item"><a class="rd-nav-link" href="https://livedemo00.template-help.com/wt_63853_v4/soccer/index.html">Contact us</a>
                                      </li>
                                    </ul>
                  <div class="rd-navbar-main-element">
                    <ul class="list-inline list-inline-sm">
                      <li><a class="icon icon-xs icon-light fa fa-facebook" href="#"></a></li>
                      <li><a class="icon icon-xs icon-light fa fa-twitter" href="#"></a></li>
                      <li><a class="icon icon-xs icon-light fa fa-google-plus" href="#"></a></li>
                      <li><a class="icon icon-xs icon-light fa fa-instagram" href="#"></a></li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </nav>
        </div>
      </header>
      <!-- Swiper-->
      <section class="section swiper-container swiper-slider swiper-classic bg-gray-2" data-loop="true" data-autoplay="4000" data-simulate-touch="false" data-slide-effect="fade">
        <div class="swiper-wrapper">
          <div class="swiper-slide text-center" data-slide-bg="images/slider-1-slide-1-1920x671.jpg">
            <div class="container">
              <div class="row justify-content-center">
                <div class="col-xl-6">
                  <div class="swiper-slide-caption">
                    <h1 data-caption-animate="fadeInUp" data-caption-delay="100">We play Soccer</h1>
                    <h4 data-caption-animate="fadeInUp" data-caption-delay="200">like no one else in the united states</h4><a class="button button-primary" data-caption-animate="fadeInUp" data-caption-delay="300" href="about-us.html">Read More</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="swiper-button swiper-button-prev"></div>
        <div class="swiper-button swiper-button-next"></div>
        <div class="swiper-pagination"></div>
      </section>

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
                    </h5><a class="button button-xs button-gray-outline" href="#">All news</a>
                  </div>
                </article>
                <div class="row row-30">
                  <div class="col-md-6">
                    <!-- Post Future-->
                    <article class="post-future"><a class="post-future-figure" href="#"><img src="images/news-2-1-368x287.jpg" alt="" width="368" height="287"/></a>
                      <div class="post-future-main">
                        <h4 class="post-future-title"><a href="#">Sadio mane still makes a difference, sam wilson admits</a></h4>
                        <div class="post-future-meta">
                          <!-- Badge-->
                          <div class="badge badge-secondary">The Team
                          </div>
                          <div class="post-future-time"><span class="icon mdi mdi-clock"></span>
                            <time datetime="2020">April 15, 2020</time>
                          </div>
                        </div>
                        <hr/>
                        <div class="post-future-text">
                          <p>Liverpool would love to welcome Philippe Coutinho back, but Sadio Mane is carrying...</p>
                        </div>
                        <div class="post-future-footer group-flex group-flex-xs"><a class="button button-gray-outline" href="#">Read more</a>
                          <div class="post-future-share">
                            <div class="inline-toggle-parent">
                              <div class="inline-toggle icon material-icons-share"></div>
                              <div class="inline-toggle-element">
                                <ul class="list-inline">
                                  <li>Share</li>
                                  <li><a class="icon fa-facebook" href="#"></a></li>
                                  <li><a class="icon fa-twitter" href="#"></a></li>
                                  <li><a class="icon fa-google-plus" href="#"></a></li>
                                  <li><a class="icon fa-instagram" href="#"></a></li>
                                </ul>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </article>
                  </div>
                  <div class="col-md-6">
                    <!-- Post Future-->
                    <article class="post-future"><a class="post-future-figure" href="#"><img src="images/news-2-2-368x287.jpg" alt="" width="368" height="287"/></a>
                      <div class="post-future-main">
                        <h4 class="post-future-title"><a href="#">Robertson's decent debut at european cup 2020</a></h4>
                        <div class="post-future-meta">
                          <!-- Badge-->
                          <div class="badge badge-secondary">The Team
                          </div>
                          <div class="post-future-time"><span class="icon mdi mdi-clock"></span>
                            <time datetime="2020">April 15, 2020</time>
                          </div>
                        </div>
                        <hr/>
                        <div class="post-future-text">
                          <p>Robertson, in his first Anfield outing as a Liverpool player, looked assured at left-back...</p>
                        </div>
                        <div class="post-future-footer group-flex group-flex-xs"><a class="button button-gray-outline" href="#">Read more</a>
                          <div class="post-future-share">
                            <div class="inline-toggle-parent">
                              <div class="inline-toggle icon material-icons-share"></div>
                              <div class="inline-toggle-element">
                                <ul class="list-inline">
                                  <li>Share</li>
                                  <li><a class="icon fa-facebook" href="#"></a></li>
                                  <li><a class="icon fa-twitter" href="#"></a></li>
                                  <li><a class="icon fa-google-plus" href="#"></a></li>
                                  <li><a class="icon fa-instagram" href="#"></a></li>
                                </ul>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </article>
                  </div>
                  <div class="col-md-6">
                    <!-- Post Future-->
                    <article class="post-future"><a class="post-future-figure" href="#"><img src="images/news-2-3-368x287.jpg" alt="" width="368" height="287"/></a>
                      <div class="post-future-main">
                        <h4 class="post-future-title"><a href="#">Pochettino and ‘gaffer’s son’ Rose estranged – reports</a></h4>
                        <div class="post-future-meta">
                          <!-- Badge-->
                          <div class="badge badge-secondary">The Team
                          </div>
                          <div class="post-future-time"><span class="icon mdi mdi-clock"></span>
                            <time datetime="2020">April 15, 2020</time>
                          </div>
                        </div>
                        <hr/>
                        <div class="post-future-text">
                          <p>Danny Rose and Mauricio Pochettino were once so close that he was nicknamed “the gaffer’s...</p>
                        </div>
                        <div class="post-future-footer group-flex group-flex-xs"><a class="button button-gray-outline" href="#">Read more</a>
                          <div class="post-future-share">
                            <div class="inline-toggle-parent">
                              <div class="inline-toggle icon material-icons-share"></div>
                              <div class="inline-toggle-element">
                                <ul class="list-inline">
                                  <li>Share</li>
                                  <li><a class="icon fa-facebook" href="#"></a></li>
                                  <li><a class="icon fa-twitter" href="#"></a></li>
                                  <li><a class="icon fa-google-plus" href="#"></a></li>
                                  <li><a class="icon fa-instagram" href="#"></a></li>
                                </ul>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </article>
                  </div>
                  <div class="col-md-6">
                    <!-- Post Future-->
                    <article class="post-future"><a class="post-future-figure" href="#"><img src="images/news-2-4-368x287.jpg" alt="" width="368" height="287"/></a>
                      <div class="post-future-main">
                        <h4 class="post-future-title"><a href="#">Coutinho’s camp: It was all Barca’s fault and we can prove it</a></h4>
                        <div class="post-future-meta">
                          <!-- Badge-->
                          <div class="badge badge-secondary">The Team
                          </div>
                          <div class="post-future-time"><span class="icon mdi mdi-clock"></span>
                            <time datetime="2020">April 15, 2020</time>
                          </div>
                        </div>
                        <hr/>
                        <div class="post-future-text">
                          <p>Philippe Coutinho is reportedly seeking clear-the-air talks with Liverpool after...</p>
                        </div>
                        <div class="post-future-footer group-flex group-flex-xs"><a class="button button-gray-outline" href="#">Read more</a>
                          <div class="post-future-share">
                            <div class="inline-toggle-parent">
                              <div class="inline-toggle icon material-icons-share"></div>
                              <div class="inline-toggle-element">
                                <ul class="list-inline">
                                  <li>Share</li>
                                  <li><a class="icon fa-facebook" href="#"></a></li>
                                  <li><a class="icon fa-twitter" href="#"></a></li>
                                  <li><a class="icon fa-google-plus" href="#"></a></li>
                                  <li><a class="icon fa-instagram" href="#"></a></li>
                                </ul>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </article>
                  </div>
                  <div class="col-md-12">
                  </div>
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
                  <input type="hidden" value="${soccer.homeTeam.team_id}" class="homeTeamid" />
                  <input type="hidden" value="${soccer.awayTeam.team_id}" class="awayTeamid" />
                    <p class="game-info-subtitle">${soccer.event_date}
                      <time datetime="">ROUND: ${soccer.round} </time>
                    </p>
                    <h3 class="game-info-title">${soccer.league.name}</h3>
                    <div class="game-info-main">
                      <div class="game-info-team game-info-team-first">
                        <figure><img src="${soccer.homeTeam.logo}" alt="" width="75" height="99"/>
                        <div class="game-result-team-name">${soccer.homeTeam.team_name}</div>
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
                                      <c:forEach items="${leagueNews.items}" var="newsItem" varStatus="status" >
                                      <article class="post-classic">
                                        <div class="post-classic-aside">
                                          <a class="post-classic-figure" href="#">
                                            <img src="images/blog-element-1-94x94.jpg" alt="" width="94" height="94"/>
                                          </a>
                                        </div>
                                        <div class="post-classic-main">
                                          <p class="post-classic-title">
                                            <a href="${newsItem.link}">
                                            ${newsItem.title}
                                            </a>
                                          </p>
                                          <div class="post-classic-time">
                                            <span class="icon mdi mdi-clock">
                                            </span>
                                            <time datetime="2020">April 15, 2020
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
                        <h5 class="heading-component-title">NEWS
                        </h5>
                        <div class="owl-carousel-arrows-outline">
                          <div class="owl-nav">
                            <button class="owl-arrow owl-arrow-prev"></button>
                            <button class="owl-arrow owl-arrow-next"></button>
                          </div>
                        </div>
                      </div>
                    </article>
                    <!-- Owl Carousel-->
                    <div class="owl-carousel owl-spacing-1" data-items="1" data-dots="false" data-nav="true" data-autoplay="true" data-autoplay-speed="4000" data-stage-padding="0" data-loop="false" data-margin="30" data-mouse-drag="false" data-nav-custom=".owl-carousel-outer-navigation">
                      <article class="product">
                        <header class="product-header">
                          <!-- Badge-->
                          <div class="product-figure"><img src="images/shop/product-1.png" alt=""/></div>
                          <div class="product-buttons">
                            <div class="product-button product-button-share fl-bigmug-line-share27" style="font-size: 22px">
                              <ul class="product-share">
                                <li class="product-share-item"><span>Share</span></li>
                                <li class="product-share-item"><a class="icon fa fa-facebook" href="#"></a></li>
                                <li class="product-share-item"><a class="icon fa fa-instagram" href="#"></a></li>
                                <li class="product-share-item"><a class="icon fa fa-twitter" href="#"></a></li>
                                <li class="product-share-item"><a class="icon fa fa-google-plus" href="#"></a></li>
                              </ul>
                            </div><a class="product-button fl-bigmug-line-shopping202" href="#" style="font-size: 26px"></a><a class="product-button fl-bigmug-line-zoom60" href="images/shop/product-1-original.jpg" data-lightgallery="item" style="font-size: 25px"></a>
                          </div>
                        </header>
                        <footer class="product-content">
                          <h6 class="product-title"><a href="#">Nike hoops elite backpack</a></h6>
                          <div class="product-price"><span class="product-price-old">$400</span><span class="heading-6 product-price-new">$290</span>
                          </div>
                          <ul class="product-rating">
                            <li><span class="material-icons-star"></span></li>
                            <li><span class="material-icons-star"></span></li>
                            <li><span class="material-icons-star"></span></li>
                            <li><span class="material-icons-star"></span></li>
                            <li><span class="material-icons-star_half"></span></li>
                          </ul>
                        </footer>
                      </article>
                      <article class="product">
                        <header class="product-header">
                          <!-- Badge-->
                          <div class="badge badge-shop">new
                          </div>
                          <div class="product-figure"><img src="images/shop/product-2.png" alt=""/></div>
                          <div class="product-buttons">
                            <div class="product-button product-button-share fl-bigmug-line-share27" style="font-size: 22px">
                              <ul class="product-share">
                                <li class="product-share-item"><span>Share</span></li>
                                <li class="product-share-item"><a class="icon fa fa-facebook" href="#"></a></li>
                                <li class="product-share-item"><a class="icon fa fa-instagram" href="#"></a></li>
                                <li class="product-share-item"><a class="icon fa fa-twitter" href="#"></a></li>
                                <li class="product-share-item"><a class="icon fa fa-google-plus" href="#"></a></li>
                              </ul>
                            </div><a class="product-button fl-bigmug-line-shopping202" href="#" style="font-size: 26px"></a><a class="product-button fl-bigmug-line-zoom60" href="images/shop/product-2-original.jpg" data-lightgallery="item" style="font-size: 25px"></a>
                          </div>
                        </header>
                        <footer class="product-content">
                          <h6 class="product-title"><a href="#">Nike Air Zoom Pegasus</a></h6>
                          <div class="product-price"><span class="heading-6 product-price-new">$290</span>
                          </div>
                          <ul class="product-rating">
                            <li><span class="material-icons-star"></span></li>
                            <li><span class="material-icons-star"></span></li>
                            <li><span class="material-icons-star"></span></li>
                            <li><span class="material-icons-star"></span></li>
                            <li><span class="material-icons-star_half"></span></li>
                          </ul>
                        </footer>
                      </article>
                      <article class="product">
                        <header class="product-header">
                          <!-- Badge-->
                          <div class="badge badge-red">hot<span class="icon material-icons-whatshot"></span>
                          </div>
                          <div class="product-figure"><img src="images/shop/product-3.png" alt=""/></div>
                          <div class="product-buttons">
                            <div class="product-button product-button-share fl-bigmug-line-share27" style="font-size: 22px">
                              <ul class="product-share">
                                <li class="product-share-item"><span>Share</span></li>
                                <li class="product-share-item"><a class="icon fa fa-facebook" href="#"></a></li>
                                <li class="product-share-item"><a class="icon fa fa-instagram" href="#"></a></li>
                                <li class="product-share-item"><a class="icon fa fa-twitter" href="#"></a></li>
                                <li class="product-share-item"><a class="icon fa fa-google-plus" href="#"></a></li>
                              </ul>
                            </div><a class="product-button fl-bigmug-line-shopping202" href="#" style="font-size: 26px"></a><a class="product-button fl-bigmug-line-zoom60" href="images/shop/product-3-original.jpg" data-lightgallery="item" style="font-size: 25px"></a>
                          </div>
                        </header>
                        <footer class="product-content">
                          <h6 class="product-title"><a href="#">Nike distressed baseball hat</a></h6>
                          <div class="product-price"><span class="product-price-old">$400</span><span class="heading-6 product-price-new">$290</span>
                          </div>
                          <ul class="product-rating">
                            <li><span class="material-icons-star"></span></li>
                            <li><span class="material-icons-star"></span></li>
                            <li><span class="material-icons-star"></span></li>
                            <li><span class="material-icons-star"></span></li>
                            <li><span class="material-icons-star_half"></span></li>
                          </ul>
                        </footer>
                      </article>
                    </div>
                  </div>
                </div>
              </aside>
            </div>
          </div>
        </div>
      </section>
     <footer class="section footer-classic footer-classic-dark context-dark">
        <div class="footer-classic-main">
          <div class="container">
            <p class="heading-7">Subscribe to our Newsletter</p>
            <!-- RD Mailform-->
            <form class="rd-mailform rd-form rd-inline-form-creative" data-form-output="form-output-global" data-form-type="subscribe" method="post" action="bat/rd-mailform.php">
              <div class="form-wrap">
                <div class="form-input-wrap">
                  <input class="form-input" id="footer-form-email" type="email" name="email" data-constraints="@Required">
                  <label class="form-label" for="footer-form-email">Enter your E-mail</label>
                </div>
              </div>
              <div class="form-button">
                <button class="button button-primary-outline" type="submit" aria-label="Send"><span class="icon fl-budicons-launch-right164"></span></button>
              </div>
            </form>
            <div class="row row-50">
              <div class="col-lg-5 text-center text-sm-left">
                <article class="unit unit-sm-horizontal unit-middle justify-content-center justify-content-sm-start footer-classic-info">
                  <div class="unit-left"><a class="brand brand-md" href="./"><img class="brand-logo " src="images/logo-soccer-default-95x126.png" alt="" width="95" height="126"/></a>
                  </div>
                  <div class="unit-body">
                    <p>Sportland website offers you the latest news about our team as well as updates on our matches and other events.</p>
                  </div>
                </article>
                <ul class="list-inline list-inline-bordered list-inline-bordered-lg">
                  <li>
                    <div class="unit unit-horizontal unit-middle">
                      <div class="unit-left">
                        <svg class="svg-color-primary svg-sizing-35" x="0px" y="0px" width="27px" height="27px" viewbox="0 0 27 27" preserveAspectRatio="none">
                          <path d="M2,26c0,0.553,0.447,1,1,1h5c0.553,0,1-0.447,1-1v-8.185c-0.373-0.132-0.711-0.335-1-0.595V19 H6v-1v-1v-1H5v1v2H3v-9H2v1H1V9V8c0-0.552,0.449-1,1-1h1h1h3h0.184c0.078-0.218,0.173-0.426,0.297-0.617C8.397,5.751,9,4.696,9,3.5 C9,1.567,7.434,0,5.5,0S2,1.567,2,3.5C2,4.48,2.406,5.364,3.056,6H3H2C0.895,6,0,6.895,0,8v7c0,1.104,0.895,2,2,2V26z M8,26H6v-6h2 V26z M5,26H3v-6h2V26z M3,3.5C3,2.121,4.121,1,5.5,1S8,2.121,8,3.5S6.879,6,5.5,6S3,4.879,3,3.5 M1,15v-3h1v4 C1.449,16,1,15.552,1,15"></path>
                          <path d="M11.056,6H11h-1C8.895,6,8,6.895,8,8v7c0,1.104,0.895,2,2,2v9c0,0.553,0.447,1,1,1h5 c0.553,0,1-0.447,1-1v-9c1.104,0,2-0.896,2-2V8c0-1.105-0.896-2-2-2h-1h-0.056C16.594,5.364,17,4.48,17,3.5 C17,1.567,15.434,0,13.5,0S10,1.567,10,3.5C10,4.48,10.406,5.364,11.056,6 M10,15v1c-0.551,0-1-0.448-1-1v-3h1V15z M11,20h2v6h-2 V20z M16,26h-2v-6h2V26z M17,16v-1v-3h1v3C18,15.552,17.551,16,17,16 M17,7c0.551,0,1,0.448,1,1v1v1v1h-1v-1h-1v5v4h-2v-1v-1v-1h-1 v1v1v1h-2v-4v-5h-1v1H9v-1V9V8c0-0.552,0.449-1,1-1h1h1h3h1H17z M13.5,1C14.879,1,16,2.121,16,3.5C16,4.879,14.879,6,13.5,6 S11,4.879,11,3.5C11,2.121,12.121,1,13.5,1"></path>
                          <polygon points="15,13 14,13 14,9 13,9 12,9 12,10 13,10 13,13 12,13 12,14 13,14 14,14 15,14 	"></polygon>
                          <polygon points="7,14 7,13 5,13 5,12 6,12 7,12 7,10 7,9 6,9 4,9 4,10 6,10 6,11 5,11 4,11 4,12 4,13 4,14 5,14"></polygon>
                          <polygon points="20,10 22,10 22,11 21,11 21,12 22,12 22,13 20,13 20,14 22,14 23,14 23,13 23,12 23,11 23,10 23,9 22,9 20,9 	"></polygon>
                          <path d="M19.519,6.383C19.643,6.574,19.738,6.782,19.816,7H20h3h1h1c0.551,0,1,0.448,1,1v3h-1v-1h-1v9 h-2v-2v-1h-1v1v2h-2v-1.78c-0.289,0.26-0.627,0.463-1,0.595V26c0,0.553,0.447,1,1,1h5c0.553,0,1-0.447,1-1v-9c1.104,0,2-0.896,2-2 V8c0-1.105-0.896-2-2-2h-1h-0.056C24.594,5.364,25,4.48,25,3.5C25,1.567,23.434,0,21.5,0S18,1.567,18,3.5 c0,0.736,0.229,1.418,0.617,1.981C18.861,5.834,19.166,6.14,19.519,6.383 M19,20h2v6h-2V20z M24,26h-2v-6h2V26z M26,15 c0,0.552-0.449,1-1,1v-4h1V15z M21.5,1C22.879,1,24,2.121,24,3.5C24,4.879,22.879,6,21.5,6C20.121,6,19,4.879,19,3.5 C19,2.121,20.121,1,21.5,1"></path>
                        </svg>
                      </div>
                      <div class="unit-body">
                        <h6>Join Our Team</h6><a class="link" href="mailto:#">info@demolink.org</a>
                      </div>
                    </div>
                  </li>
                  <li>
                    <div class="unit unit-horizontal unit-middle">
                      <div class="unit-left">
                        <svg class="svg-color-primary svg-sizing-35" x="0px" y="0px" width="72px" height="72px" viewbox="0 0 72 72">
                          <path d="M36.002,0c-0.41,0-0.701,0.184-0.931,0.332c-0.23,0.149-0.4,0.303-0.4,0.303l-9.251,8.18H11.58 c-1.236,0-1.99,0.702-2.318,1.358c-0.329,0.658-0.326,1.3-0.326,1.3v11.928l-8.962,7.936V66c0,0.015-0.038,1.479,0.694,2.972 C1.402,70.471,3.006,72,5.973,72h30.03h30.022c2.967,0,4.571-1.53,5.306-3.028c0.736-1.499,0.702-2.985,0.702-2.985V31.338 l-8.964-7.936V11.475c0,0,0.004-0.643-0.324-1.3c-0.329-0.658-1.092-1.358-2.328-1.358H46.575l-9.251-8.18 c0,0-0.161-0.154-0.391-0.303C36.703,0.184,36.412,0,36.002,0z M36.002,3.325c0.49,0,0.665,0.184,0.665,0.184l6,5.306h-6.665 h-6.665l6-5.306C35.337,3.51,35.512,3.325,36.002,3.325z M12.081,11.977h23.92H59.92v9.754v2.121v14.816L48.511,48.762 l-10.078-8.911c0,0-0.307-0.279-0.747-0.548s-1.022-0.562-1.684-0.562c-0.662,0-1.245,0.292-1.686,0.562 c-0.439,0.268-0.747,0.548-0.747,0.548l-10.078,8.911L12.082,38.668V23.852v-2.121v-9.754H12.081z M8.934,26.867v9.015 l-5.091-4.507L8.934,26.867z M63.068,26.867l5.091,4.509l-5.091,4.507V26.867z M69.031,34.44v31.559 c0,0.328-0.103,0.52-0.162,0.771L50.685,50.684L69.031,34.44z M2.971,34.448l18.348,16.235L3.133,66.77 c-0.059-0.251-0.162-0.439-0.162-0.769C2.971,66.001,2.971,34.448,2.971,34.448z M36.002,41.956c0.264,0,0.437,0.057,0.546,0.104 c0.108,0.047,0.119,0.059,0.119,0.059l30.147,26.675c-0.3,0.054-0.79,0.207-0.79,0.207H36.002H5.98H5.972 c-0.003,0-0.488-0.154-0.784-0.207l30.149-26.675c0,0,0.002-0.011,0.109-0.059C35.555,42.013,35.738,41.956,36.002,41.956z"></path>
                        </svg>
                      </div>
                      <div class="unit-body">
                        <h6>Contact Us</h6><a class="link" href="mailto:#">info@demolink.org</a>
                      </div>
                    </div>
                  </li>
                </ul>
                <div class="group-md group-middle">
                  <div class="group-item">
                    <ul class="list-inline list-inline-xs">
                      <li><a class="icon icon-corporate fa fa-facebook" href="#"></a></li>
                      <li><a class="icon icon-corporate fa fa-twitter" href="#"></a></li>
                      <li><a class="icon icon-corporate fa fa-google-plus" href="#"></a></li>
                      <li><a class="icon icon-corporate fa fa-instagram" href="#"></a></li>
                    </ul>
                  </div><a class="button button-sm button-gray-outline" href="contact-us.html">Get in Touch</a>
                </div>
              </div>
              <div class="col-lg-7">
                <h5>Popular News</h5>
                <div class="divider-small divider-secondary"></div>
                <div class="row row-20">
                  <div class="col-sm-6">
                          <!-- Post Classic-->
                          <article class="post-classic">
                            <div class="post-classic-aside"><a class="post-classic-figure" href="#"><img src="images/footer-soccer-post-1-93x87.jpg" alt="" width="93" height="87"/></a></div>
                            <div class="post-classic-main">
                              <!-- Badge-->
                              <div class="badge badge-secondary">The Team
                              </div>
                              <p class="post-classic-title"><a href="#">Bundy stymies Blue Jays and Orioles hit 2 HRs</a></p>
                              <div class="post-classic-time"><span class="icon mdi mdi-clock"></span>
                                <time datetime="2020">April 15, 2020</time>
                              </div>
                            </div>
                          </article>
                  </div>
                  <div class="col-sm-6">
                          <!-- Post Classic-->
                          <article class="post-classic">
                            <div class="post-classic-aside"><a class="post-classic-figure" href="#"><img src="images/footer-soccer-post-2-93x87.jpg" alt="" width="93" height="87"/></a></div>
                            <div class="post-classic-main">
                              <!-- Badge-->
                              <div class="badge badge-red">Hot<span class="icon material-icons-whatshot"></span>
                              </div>
                              <p class="post-classic-title"><a href="#">Good vibes back at struggling Schalke</a></p>
                              <div class="post-classic-time"><span class="icon mdi mdi-clock"></span>
                                <time datetime="2020">April 15, 2020</time>
                              </div>
                            </div>
                          </article>
                  </div>
                  <div class="col-sm-6">
                          <!-- Post Classic-->
                          <article class="post-classic">
                            <div class="post-classic-aside"><a class="post-classic-figure" href="#"><img src="images/footer-soccer-post-3-93x87.jpg" alt="" width="93" height="87"/></a></div>
                            <div class="post-classic-main">
                              <!-- Badge-->
                              <div class="badge badge-primary">The League
                              </div>
                              <p class="post-classic-title"><a href="#">Prem in 90 seconds: Chelsea's crisis is over!</a></p>
                              <div class="post-classic-time"><span class="icon mdi mdi-clock"></span>
                                <time datetime="2020">April 15, 2020</time>
                              </div>
                            </div>
                          </article>
                  </div>
                  <div class="col-sm-6">
                          <!-- Post Classic-->
                          <article class="post-classic">
                            <div class="post-classic-aside"><a class="post-classic-figure" href="#"><img src="images/footer-soccer-post-4-93x87.jpg" alt="" width="93" height="87"/></a></div>
                            <div class="post-classic-main">
                              <!-- Badge-->
                              <div class="badge badge-primary">The League
                              </div>
                              <p class="post-classic-title"><a href="#">Liverpool in desperate need of backup players</a></p>
                              <div class="post-classic-time"><span class="icon mdi mdi-clock"></span>
                                <time datetime="2020">April 15, 2020</time>
                              </div>
                            </div>
                          </article>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="footer-classic-aside footer-classic-darken">
          <div class="container">
            <div class="layout-justify">
              <!-- Rights-->
              <p class="rights"><span>Sportland</span><span>&nbsp;&copy;&nbsp;</span><span class="copyright-year"></span><span>.&nbsp;</span><span>Designed by <a href="https://www.templatemonster.com/products/author/zemez/">Zemez.</a></span></p>
              <nav class="nav-minimal">
                <ul class="nav-minimal-list">
                  <li class="active"><a href="index.html">Home</a></li>
                  <li><a href="#">Features</a></li>
                  <li><a href="#">Statistics</a></li>
                  <li><a href="#">Team</a></li>
                  <li><a href="#">News</a></li>
                  <li><a href="#">Shop</a></li>
                </ul>
              </nav>
            </div>
          </div>
        </div>
      </footer>
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