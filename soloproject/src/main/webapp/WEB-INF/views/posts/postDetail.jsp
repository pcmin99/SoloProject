<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html class="wide wow-animation" lang="en">
  <head>
    <!-- Site Title-->
    <title>BOARD</title>
    <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <link rel="icon" href="../images/favicon.ico" type="image/x-icon">
    <!-- Stylesheets-->
    <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Kanit:300,400,500,500i,600,900%7CRoboto:400,900">
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" href="/css/fonts.css">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/style22.css">
    <link rel="stylesheet" href="/css/style2322.css">
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <!-- SweetAlert CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <style>
      .ie-panel {
        display: none;
        background: #212121;
        padding: 10px 0;
        box-shadow: 3px 3px 5px 0 rgba(0, 0, 0, .3);
        clear: both;
        text-align: center;
        position: relative;
        z-index: 1;
      }

      html.ie-10 .ie-panel,
      html.lt-ie-10 .ie-panel {
        display: block;
      }

      .comment-section {
        margin-top: 20px;
      }

      .comment-card {
        border: 1px solid #ddd;
        border-radius: 5px;
        padding: 10px;
        margin-bottom: 10px;
      }

      .comment-author {
        font-weight: bold;
        display: inline-block;
        margin-right: 10px;
      }

      .comment-date {
        display: inline-block;
        color: #888;
        margin-right: 10px;
      }

      .comment-content {
        white-space: normal;
        word-wrap: break-word;
        word-break: break-all;
        margin-top: 10px;
      }

      .comment-avatar {
        width: 50px;
        height: 50px;
        border-radius: 50%;
        margin-right: 10px;
      }

      .comment-actions {
        margin-top: 5px;
      }

      .comment-actions button {
        border: none;
        background: none;
        color: #007bff;
        cursor: pointer;
      }

      .comment-actions button:hover {
        text-decoration: underline;
      }
    </style>
  
    <script src="/js/jquery.min.js"></script>
  </head>
  <body>
      <div class="preloader">
        <div class="preloader-body">
          <div class="preloader-item"></div>
        </div>
      </div>
    <!-- Page-->
    <div class="page">
      <!-- Page Header-->
     <input type="hidden" value="${loggedInUser}" id="loggedInUser" class="userInfoId" />
      <%@ include file='../header.jsp' %>

      <div class="container mt-5">
        <div class="row">
          <div class="col-lg-8">
            <!-- Post content-->
            <article>
              <!-- Post header-->
              <header class="mb-4">
                <!-- Post title-->
                <h1 class="fw-bolder mb-1">${post.title}</h1>
                <!-- Post meta content-->
                <div class="text-muted fst-italic mb-2">ID : ${post.user_id}</div>
                <!-- Post categories-->
                <a class="badge bg-secondary text-decoration-none link-light" href="#!">조회수 : ${post.view}</a>
                <a class="badge bg-secondary text-decoration-none link-light" href="#!">${post.id}</a>
              </header>
              <!-- Preview image figure-->
              <figure class="mb-4"><img class="img-fluid rounded" src="/images/${post.imgfile_name}" alt="" /></figure>
              <!-- Post content-->
              <section class="mb-5">
                <p class="fs-5 mb-4">${post.content}</p>
              </section>
            </article>
            <!-- Comments section-->
            <section class="mb-5">
              <div class="card bg-light">
                <div class="card-body">
                  <!-- Comment form-->
                  <form class="mb-4" method="post" action="/posts/insertComments">
                    <textarea class="form-control" rows="3" name="comment" placeholder="댓글 작성"></textarea>
                    <input type ="hidden" value="${post.id}" name = "posts_id"  />
                    <input type="hidden" value="${loggedInUser.username}" id="loggedInUser" class="userInfoId" name="user_id" />
                    <input type="submit" class="btn btn-primary mt-2" value="댓글 작성"/>
                  </form>
                  <!-- Comments list-->
                  <ul class="comment-section">
                    <c:forEach items="${comments}" var="comments">
                      <li class="comment-card">
                        <div class="d-flex">
                          <img class="comment-avatar" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="...">
                          <div>
                            <div>
                              <span class="comment-author">${comments.member_username}</span>
                              <span class="comment-date">
                                <c:if test="${empty comments.modified_date}">
                                  ${comments.created_date}
                                </c:if>
                                <c:if test="${not empty comments.modified_date}">
                                  ${comments.modified_date}
                                </c:if>
                              </span>
                              <div class="comment-actions">
                                  <input type="hidden" name="co"  class="user_idHidden" value="${comments.member_username}">
                                  <input type="hidden" name="comsid" class="comsid" value="${comments.comsid}">
                                  <button type="submit" class="deleteCommid">삭제</button>
                              </div>
                              
                            </div>
                            <div class="comment-content">${comments.comment}</div>
                          </div>
                        </div>
                      </li>
                    </c:forEach>
                  </ul>
                </div>
              </div>
            </section>
          </div>
        </div>
      </div>
      <!-- Latest News-->

      <%@ include file='../footer.jsp' %>
    </div>
    <!-- Global Mailform Output-->
    <div class="snackbars" id="form-output-global"></div>
    <!-- Javascript-->
    <script src="/js/core.min.js"></script>
    <script src="/js/script.js"></script>
    <script src="/js/teamid.js"></script>
    <script src="/js/footer.js"></script>
    <!-- SweetAlert JS -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
    </script>
  </body>
</html>
