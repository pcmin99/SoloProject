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
        <link rel="stylesheet" href="/css/style22.css">
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
	  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
        <!-- SweetAlert CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <style>.ie-panel{display: none;background: #212121;padding: 10px 0;box-shadow: 3px 3px 5px 0 rgba(0,0,0,.3);clear: both;text-align:center;position: relative;z-index: 1;} html.ie-10 .ie-panel, html.lt-ie-10 .ie-panel {display: block;}</style>
  
    <script src="/js/jquery.min.js"></script>
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

       <section class="section section-md bg-gray-100">
                    <section class="ftco-section">
                      <div class="container">
                      <a href="/posts/postInsert" class="button button-xs button-gray-outline" id="">INSERT POST</a>
                        <div class="row">
                          <div class="col-md-12">
                            <div class="table-wrap">
                              <table class="table">
                                <thead class="thead-dark">
                                  <tr>
                                    <th>No.</th>
                                    <th>User ID</th>
                                    <th>Email</th>
                                    <th>Title </th>
                                    <th>View </th>
                                    <th></th>
                                  </tr>
                                </thead>
                                <tbody>
                                  <c:forEach items="${postListId}" var="postListId" >
                                  <tr class="alert" role="alert" id="postDetail">
                                    <th scope="row" id ="postDetailId">${postListId.id}</th>
                                    <td class="user_idHidden">${postListId.user_id}</td>
                                    <td>${postListId.email}</td>
                                    <td>${postListId.title}</td>
                                    <td>${postListId.view}</td>
                                    <td>
                                        <a href="" class="close" data-dismiss="alert" aria-label="Close">
                                          <span aria-hidden="true"  id="close123" style="display:none;" class="close123" >
                                            <i class="fa fa-close"></i>
                                            <input type="hidden" value="${postListId.id}" class="postDetailIdX" />
                                          </span>
                                        </a>
                                    </td>
                                  </tr>
                                  </c:forEach >
                                </tbody>
                              </table>
                            </div>
                          </div>
                        </div>
                      </div>
                    </section>
      </section>
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