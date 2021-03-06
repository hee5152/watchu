<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset=utf-8>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Wachu | GenreList</title>
<!-- Load Roboto font -->
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,300,700&amp;subset=latin,latin-ext'
	rel='stylesheet' type='text/css'>
<!-- Load css styles -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="css/bootstrap-responsive.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/pluton.css" />
<!--[if IE 7]>
            <link rel="stylesheet" type="text/css" href="css/pluton-ie7.css" />
        <![endif]-->
<link rel="stylesheet" type="text/css" href="css/jquery.cslider.css" />
<link rel="stylesheet" type="text/css" href="css/jquery.bxslider.css" />
<link rel="stylesheet" type="text/css" href="css/animate.css" />
<!-- Fav and touch icons -->
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="images/ico/apple-touch-icon-144.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="images/ico/apple-touch-icon-114.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="images/apple-touch-icon-72.png">
<link rel="apple-touch-icon-precomposed"
	href="images/ico/apple-touch-icon-57.png">
<link rel="shortcut icon" href="images/ico/favicon.ico">
<style>
.pic {
	width: 100%;
	height: 80%;
}
table tr, td {
	background-color: #181A1C;
	border: 5px #FECE1A solid;
	border-collapse: collapse;
	width: 400px;
}
td {
	height: 500px;
	padding: 15px;
}
.div1, .list {
	margin: auto;
	text-align: center;
}
</style>
</head>

<body>
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container">
				<a href="movieList" class="brand"> <img src="images/logo.png"
					width="120" height="40" alt="Logo" /> <!-- This is website logo -->
				</a>
				
				
				<!-- ?????? ?????? -->
				<!-- 1. ????????? ?????? ?????? -->
				<!-- 2. ????????? ??? -->
				<!-- 3. ???????????? ?????? ???  -->
				<div class="nav-collapse collapse pull-right">
					<c:choose>
						<c:when test="${sessionScope.loginId eq 'admin'}">
							<h3>????????? ????????? ????????? ?????????!</h3>
							<ul class="nav" id="top-navigation">
								<li class="active"><a href="movieList">Home</a></li>
								<li><a href="memberView?momId=${sessionScope.loginId}">???????????????</a></li>
								<li><a href="memberList">????????? ?????? ??????</a></li>
								<li><a href="adminmovieList">????????? ?????? ??????</a></li>
								<li><a href="Logout">????????????</a></li>
							</ul>
						</c:when>


						<c:when test="${loginId2.momSubD > 0}">
							<h3>${sessionScope.loginId}??? ???????????????. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?????????</h3> 
							<ul class="nav" id="top-navigation">
								<li class="active"><a href="movieList">Home</a></li>
								<li><a href="memberView?momId=${sessionScope.loginId}">???????????????</a></li>
								<li><a href="movieSaveList?mosId=${sessionScope.loginId}">?????? ?????? ?????? ??????</a></li>
								<li><a href="Logout">????????????</a></li>
							</ul>
						</c:when>


						<c:when test="${sessionScope.loginId != null}">

							<h3>${sessionScope.loginId}??? ???????????????.</h3>
							
							<ul class="nav" id="top-navigation">
								<li class="active"><a href="movieList">Home</a></li>
								<li><a href="memberView?momId=${sessionScope.loginId}">???????????????</a></li>
								<li><a href="moneyC?momId=${sessionScope.loginId}">????????? ??????</a></li>
								<li><a href="Logout">????????????</a></li>
							</ul>
							</c:when>
							
					</c:choose>
				</div>
				<!-- End ?????? ?????? -->
				
			</div>
		</div>
	</div>
	
	
	
	
	
	<!-- ????????? start -->
	<div class="section primary-section">
		<div class="container">
			<!-- Start title section -->
			<div class="title">
				<h1>????????????</h1>
			</div>

			<div class="text-center">
				<form action="movieSearch" method="GET"> 
					<input type="text" name="search" class="span7"
						placeholder="?????????????????? ????????????" style="height:36px;">&nbsp;&nbsp;&nbsp;
					<input type="submit" value="??????" class="button button-sp">
				</form>
				
			</div>

		</div>
	</div>
	<!-- ????????? end -->


	<c:choose>
	
	<c:when test="${sessionScope.loginId eq 'admin'}">
	
	<!-- ????????? ?????? ?????? ?????? ?????? -->
	<div class="section secondary-section " id="portfolio">
		<div class="triangle"></div>
		<div class="container">
			<div class=" title">
				<h1>Movie</h1>
			</div>
			<ul class="nav nav-pills">
				<li><a href="movieList">??????</a></li>
				<li><a href="movieGenreList?moGenre=??????">??????</a></li>
				<li><a href="movieGenreList?moGenre=?????????">?????????</a></li>
				<li><a href="movieGenreList?moGenre=SF">SF</a></li>
				<li><a href="movieGenreList?moGenre=??????">??????</a></li>
				<li><a href="movieGenreList?moGenre=?????????">?????????</a></li>
				<li><a href="movieGenreList?moGenre=?????????">?????????</a></li>
				<li><a href="movieGenreList?moGenre=???????????????">???????????????</a></li>
			</ul>


			<!-- ????????? ?????? ?????? ???????????? -->
			<table class="list">

				<tr>
					<c:forEach var="movie" items="${moGenreList}" varStatus="status">
						
						<td><a href="movieView?moNum=${movie.moNum}"><img
								alt="????????? ??????" src="fileUpload/${movie.moPic}" class="pic"></a>
							<h3>
								<br> <strong>${movie.moTitle}</strong>
							</h3></td>


						<c:if test="${status.count%3==0}">
							<tr></tr>
						</c:if>

					</c:forEach>
				</tr>

			</table>


		</div>
	</div>
	<!-- ?????? ???????????? end -->
	</c:when>
	
	
	
	
	<c:when test="${sessionScope.loginId2 != null}">
	
	<!-- ????????? ?????? ?????? ?????? -->
	<div class="section secondary-section " id="portfolio">
		<div class="triangle"></div>
		<div class="container">
			<div class=" title">
				<h1>Movie</h1>
			</div>
			<ul class="nav nav-pills">
				<li><a href="movieList">??????</a></li>
				<li><a href="movieGenreList?moGenre=??????">??????</a></li>
				<li><a href="movieGenreList?moGenre=?????????">?????????</a></li>
				<li><a href="movieGenreList?moGenre=SF">SF</a></li>
				<li><a href="movieGenreList?moGenre=??????">??????</a></li>
				<li><a href="movieGenreList?moGenre=?????????">?????????</a></li>
				<li><a href="movieGenreList?moGenre=?????????">?????????</a></li>
				<li><a href="movieGenreList?moGenre=???????????????">???????????????</a></li>
			</ul>


			<!-- ????????? ?????? ???????????? -->
			<table class="list">

				<tr>
					<c:forEach var="movie" items="${moGenreList}" varStatus="status">
						
						<td><a href="movieView?moNum=${movie.moNum}"><img
								alt="????????? ??????" src="fileUpload/${movie.moPic}" class="pic"></a>
							<h3>
								<br> <strong>${movie.moTitle}</strong>
							</h3></td>


						<c:if test="${status.count%3==0}">
							<tr></tr>
						</c:if>

					</c:forEach>
				</tr>

			</table>


		</div>
	</div>
	<!-- ?????? ???????????? end -->
	</c:when>
	
	
	<c:otherwise>
	
	<!-- ?????? ?????? ?????? -->
	<div class="section secondary-section " id="portfolio">
		<div class="triangle"></div>
		<div class="container">
			<div class=" title">
				<h1>Movie</h1>
			</div>
			<ul class="nav nav-pills">
				<li><a href="movieList">??????</a></li>
				<li><a href="movieGenreList?moGenre=??????">??????</a></li>
				<li><a href="movieGenreList?moGenre=?????????">?????????</a></li>
				<li><a href="movieGenreList?moGenre=SF">SF</a></li>
				<li><a href="movieGenreList?moGenre=??????">??????</a></li>
				<li><a href="movieGenreList?moGenre=?????????">?????????</a></li>
				<li><a href="movieGenreList?moGenre=?????????">?????????</a></li>
				<li><a href="movieGenreList?moGenre=???????????????">???????????????</a></li>
			</ul>



			<!-- ?????? ???????????? -->
			<table class="list">

				<tr>
					<c:forEach var="movie" items="${moGenreList}" varStatus="status">
						
						<td><img alt="????????? ??????" src="fileUpload/${movie.moPic}" class="pic">
							<h3>
								<br> <strong>${movie.moTitle}</strong>
							</h3></td>


						<c:if test="${status.count%3==0}">
							<tr></tr>
						</c:if>

					</c:forEach>
				</tr>

			</table>


		</div>
	</div>
	<!-- ?????? ???????????? end -->
	
	</c:otherwise>
	
	</c:choose>




	

	<!-- Footer section start -->
	<div class="footer"></div>
	<!-- Footer section end -->
	<!-- ScrollUp button start -->
	<div class="scrollup">
		<a href="#"> <i class="icon-up-open"></i>
		</a>
	</div>
	<!-- ScrollUp button end -->
	<!-- Include javascript -->
	<script src="js/jquery.js"></script>
	<script type="text/javascript" src="js/jquery.mixitup.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/modernizr.custom.js"></script>
	<script type="text/javascript" src="js/jquery.bxslider.js"></script>
	<script type="text/javascript" src="js/jquery.cslider.js"></script>
	<script type="text/javascript" src="js/jquery.placeholder.js"></script>
	<script type="text/javascript" src="js/jquery.inview.js"></script>
	<!-- Load google maps api and call initializeMap function defined in app.js -->
	<script async="" defer="" type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?sensor=false&callback=initializeMap"></script>
	<!-- css3-mediaqueries.js for IE8 or older -->
	<!--[if lt IE 9]>
            <script src="js/respond.min.js"></script>
        <![endif]-->
	<script type="text/javascript" src="js/app.js"></script>
</body>
</html>