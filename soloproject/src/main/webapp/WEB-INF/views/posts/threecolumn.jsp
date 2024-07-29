<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
	<head>
	    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<title>Three Column - Halcyonic by HTML5 UP</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
			<link rel="stylesheet" type="text/css" href="/css/skel.css" />
			<link rel="stylesheet" type="text/css" href="/css/style.css" />
			<link rel="stylesheet" type="text/css" href="/css/style-desktop.css" />
			<link rel="stylesheet" type="text/css" href="/css/style11.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
			<script src="/js/skel.min.js"></script>
		<script src="/js/skel-layers.min.js"></script>
		<script src="/js/init.js"></script>
		<script src="/js/moreview.js"></script>
	<script>
	$(function () {
	function loadMoreMatches() {
		var matches = document.querySelectorAll('#matchSchedule .match-info');
		for (var i = 3; i < matches.length; i++) {
			if (matches[i].style.display === 'none') {
				matches[i].style.display = 'block';
			}
		}
		var hiddenMatches = document.querySelectorAll('#matchSchedule .match-info[style="display:none;"]');
		if (hiddenMatches.length === 0) {
			document.getElementById('loadMoreBtn').style.display = 'none';
		}
	};


	function loadMoreNews() {
		var news = document.querySelectorAll('#descriptionCon');
		for (var i = 3; i < news.length; i++) {
			if (news[i].style.display === 'none') {
				news[i].style.display = 'block';
			}
		}
		var hiddenNews = document.querySelectorAll('#descriptionCon[style="display:none;"]');
		if (hiddenNews.length === 0) {
			document.getElementById('loadMoreNewsBtn').style.display = 'none';
		}
	};
    document.getElementById('loadMoreBtn').addEventListener('click', loadMoreMatches);
    document.getElementById('loadMoreNewsBtn').addEventListener('click', loadMoreNews);

	})	
	</script>
	</head>
	<body class="subpage">

		<!-- Header -->
			<div id="header-wrapper">
				<header id="header" class="container">
					<div class="row">
						<div class="12u">

							<!-- Logo -->
								<h1><a href="#" id="logo">Halcyonic</a></h1>
							
							<!-- Nav -->
								<nav id="nav">
									<a href="../main">Homepage</a>
									<a href="../twocolumn1">Two Column #1</a>
									<a href="../twocolumn2">Two Column #2</a>
									<a href="../onecolumn">One Column</a>
								</nav>

						</div>
					</div>
				</header>
			</div>

		<!-- Content -->
			<div id="content-wrapper">
				<div id="content">
					<div class="container">
						<div class="row">
							<div class="3u">

								<!-- Left Sidebar -->
									<section id="matchSchedule">
										<header>
											<h2>MATCH SCHEDULE</h2>
										</header>
										<c:forEach items="${soccerList1}" var="match" varStatus="loop">
											<div class="match-info" style="${loop.index > 2 ? 'display:none;' : ''}">
												<p>
													<strong>Round:</strong> ${fn:substringAfter(match.round, 'Regular Season - ')} <br>
													<strong>League:</strong> ${match.league.name} 
													<img src="${match.league.logo}" alt="${match.league.name} Logo" class="TeamLogo" style="max-width: 17% !important;" />
													<br>
													<strong>Date:</strong> ${match.event_date} <br>
													<strong>Place:</strong> ${match.venue} <br>
													<strong>HomeTeam:</strong> ${match.homeTeam.team_name}   
													<img src="${match.homeTeam.logo}" alt="${match.homeTeam.team_name} Logo" class="TeamLogo"  style="max-width: 17% !important;" />
													<br>
													<strong>AwayTeam:</strong> ${match.awayTeam.team_name} 
													<img src="${match.awayTeam.logo}" alt="${match.awayTeam.team_name} Logo" class="TeamLogo"  style="max-width: 17% !important;" />
													<br>
													<hr />
												</p>
											</div>
										</c:forEach>
										<button id="loadMoreBtn" onclick="loadMoreMatches()">Load More</button>
									</section>
							</div>
							<div class="6u important(collapse)">

								<!-- Main Content -->
								<c:forEach items="${soccerList2}" var="teamInfo" varStatus="loop">
									<section>
										<header>
											<img src="${teamInfo.logo}" alt="" class="TeamLogo"  style="max-width: 17% !important;" />
											<h2>${teamInfo.name}</h2>
											<h3>Home Stadium : ${teamInfo.venue_name} </h3>
											${teamInfo}
										</header>
										<p>
											Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc quam metus, congue 
											vel suscipit ut, dignissim non risus. Vestibulum ante est, fringilla nec placerat 
											eu, vestibulum vitae diam. Integer eget egestas eros. Duis enim erat, mollis quis 
											lacinia eget, blandit nec ipsum. Donec vitae turpis ipsum. Aliquam mauris libero, 
											sagittis in eleifend at, mattis imperdiet velit. Donec urna risus, rutrum molestie 
											varius ac, lacinia sit amet augue. Nam ultrices elementum eros.
										</p>
										<p>
											Sed faucibus viverra ligula, non varius magna semper vitae. Donec eu justo ut ipsum 
											hendrerit congue nec eu risus. Cum sociis natoque penatibus et magnis dis parturient 
											montes, nascetur ridiculus mus. Lorem ipsum dolor sit amet, consectetur adipiscing 
											egestas tempus. Cras convallis odio sit amet risus convallis porttitor. Integer 
											vehicula fermentum ligula at pretium. Suspendisse semper iaculis eros, eu aliquam 
											justo imperdiet vel. Proin nec dictum mi. Duis commodo enim non tellus interdum 
											elit. Suspendisse fermentum adipiscing nisi, a tempor libero malesuada at. Morbi 
											lacinia dui adipiscing risus eleifend tincidunt. Proin eu mauris eu tellus eleifend 
											hendrerit.
										</p>
										<p>
											Mauris sit amet tellus urna. In facilisis, tortor vitae ultricies egestas, odio 
											mi rhoncus arcu, quis euismod felis felis et velit. Mauris varius consectetur erat 
											egestas tempus. Cras convallis odio sit amet risus convallis porttitor. Integer 
											vehicula fermentum ligula at pretium. Suspendisse semper iaculis eros, eu aliquam 
											justo imperdiet vel. Proin nec dictum mi. Duis commodo enim non tellus interdum 
											iaculis. Phasellus ultrices diam sit amet orci lacinia sed consequat dui auctor. 							
										</p>
									</section>
								</c:forEach>	

							</div>
							<div class="3u">
									<header>
											<h2>
												SEARCH TIME: <br/>
												${teamNews.lastBuildDate}
											</h2>
									</header>
									<c:forEach  items="${teamNews.items}" var="teamNews1" varStatus="loop">
									<section id ="descriptionCon"  style="${loop.index > 2 ? 'display:none;' : ''}" >
										<header>
											<h2>${teamNews1.title}</h2>
										</header>
										<p >
											${teamNews1.description}
											<ul class="link-list">
												<a href="${teamNews1.link}">
												link
												</a>
											</ul>
										</p>
									</section>
									</c:forEach>
									<button id="loadMoreNewsBtn" onclick=loadMoreNews >Load More</button>


							</div>
						</div>
					</div>
				</div>
			</div>

		<!-- Footer -->
		   	<%@ include file='../footer.jsp' %>
	</body>
</html>