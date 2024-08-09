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
    <style>.ie-panel{display: none;background: #212121;padding: 10px 0;box-shadow: 3px 3px 5px 0 rgba(0,0,0,.3);clear: both;text-align:center;position: relative;z-index: 1;} html.ie-10 .ie-panel, html.lt-ie-10 .ie-panel {display: block;}</style>
  
    <script src="/js/jquery.min.js"></script>
    <script>
            function previewProfilePicture() {
                var input = document.getElementById('profilePictureUpload');
                var preview = document.getElementById('profilePicturePreview');

                if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                preview.src = e.target.result;
                };

                reader.readAsDataURL(input.files[0]);
                }
            }
    </script>
  </head>
  <body>
    <div class="ie-panel"><a href="http://windows.microsoft.com/en-US/internet-explorer/"><img src="../images/ie8-panel/warning_bar_0000_us.jpg" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today."></a></div>
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
                    <form action="/posts/postInsertForm" method="post" enctype="multipart/form-data" > 
                        <!-- Post header-->
                        <header class="mb-4">
                            <!-- Post title-->
                            <textarea class="form-control" rows="3" placeholder="title" id="title" name="title" ></textarea>
                            <!-- Post meta content-->
                            <div class="text-muted fst-italic mb-2"></div>
                            <input type="hidden" value="${loggedInUser.username}" id="loggedInUser" class="userInfoId" name="user_id" />
                            <!-- Post categories-->
                            <a class="badge bg-secondary text-decoration-none link-light" href="#!">조회수 :</a>
                            <a class="badge bg-secondary text-decoration-none link-light" href="#!"></a>
                        </header>
                        <!-- Preview image figure-->
                        <figure class="mb-4">
                            <img class="img-fluid rounded" src="/images/6c757d.jpg" alt="..." id ="profilePicturePreview" />
                            <input class="form-control-sm col-8" type="file" id="profilePictureUpload" name="file"
                            accept="image/*" onchange="previewProfilePicture()" />
                        </figure>
                        <!-- Post content-->
                        <section class="mb-5">
                            <textarea class="form-control" rows="9" id="content" name="content" placeholder="content"> </textarea>
                        </section>

                        <section>
                            <input type="submit" id ="searchButton" value="등록" style="background-color: #d9dadb;">
                        </section>
                    </form>    
                    </article>
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
    <script	script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  </body>
</html>