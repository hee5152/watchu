<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset=utf-8>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Wachu | MemberModify</title>
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
td {
	padding: 3px;
	color: black;
}

.momId {
	margin-left: 50px;
}

#box {
	width: 60%;
	margin-left: 235px;
}

#footer {
	width: 100%
}

#idAlign {
	text-align: left;
}

#idAlign2 {
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
								<li><a href="movieList">Home</a></li>
								<li class="active"><a href="memberView?momId=${sessionScope.loginId}">???????????????</a></li>
								<li><a href="memberList">????????? ?????? ??????</a></li>
								<li><a href="adminmovieList">????????? ?????? ??????</a></li>
								<li><a href="Logout">????????????</a></li>
							</ul>
						</c:when>


						<c:when test="${loginId2.momSubD > 0}">
							<h3>${sessionScope.loginId}??? ???????????????.
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?????????</h3>
							<ul class="nav" id="top-navigation">
								<li><a href="movieList">Home</a></li>
								<li class="active"><a
									href="memberView?momId=${sessionScope.loginId}">???????????????</a></li>
								<li><a href="movieSaveList?mosId=${sessionScope.loginId}">?????? ?????? ?????? ??????</a></li>
								<li><a href="Logout">????????????</a></li>
							</ul>
						</c:when>


						<c:when test="${sessionScope.loginId != null}">

							<h3>${sessionScope.loginId}??? ???????????????.</h3>

							<ul class="nav" id="top-navigation">
								<li><a href="movieList">Home</a></li>
								<li class="active"><a
									href="memberView?momId=${sessionScope.loginId}">???????????????</a></li>
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
	<!-- Start home section -->
	<div id="home"></div>
	<!-- End home section -->

	

	<!-- ????????????/????????? ?????? -->
	<div class="section secondary-section">
		<div class="triangle"></div>
		<div class="container centered">
			<div class="row-fluid">
				<div class="title">
				<h1>${modify.momId}??? ???????????? ??????</h1>
				</div>
				<br>
				<div class="span5 contact-form centered" id="box">
					
					<form id="contact-form" action="memberModify" method="POST" style="text-align: center" name="modiForm">
						<div class="control-group">
							<div class="controls">
								<h5 style="color: black;">
									<span id=idAlign>????????? : </span> <span id=idAlign2>${modify.momId}</span>
									<input type="hidden" name="momId" value="${modify.momId}">
								</h5>
							</div>
						</div>
						<div class="control-group">
							<div class="controls">
								<h5 style="color: black;">
									?????? ???????????? : <input type="password" name="momPw" id="momPw"
										class="span12" placeholder="* ??????????????? ?????? ????????????">
								</h5>
							</div>
						</div>

						<div class="control-group">
							<div class="controls">
								<h5 style="color: black;">
									????????? ???????????? : <input type="password" name="momPw" id="momPw"
										class="span12" placeholder="* ??????????????? ?????? ????????????">
								</h5>
							</div>
						</div>

						<div class="control-group">
							<div class="controls">
								<h5 style="color: black;">
									??? ??? : <input type="text" name="momName" id="momName"
										class="span12" placeholder="${modify.momName}">
								</h5>
							</div>
						</div>

						<div class="control-group">
							<div class="controls">
								<h5 style="color: black;">
									???????????? : <input type="date" name="momBirth" id="momBirth"
										class="span12" placeholder="${modify.momBirth}">
								</h5>
							</div>
						</div>

						<div class="control-group">
							<div class="controls">
								<h5 style="color: black;">
									?????? : <input type="radio" name="momGender" value="??????">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;??????:
									<input type="radio" name="momGender" value="??????">
								</h5>
							</div>
						</div>

						<div class="control-group">
							<div class="controls">
								<h5 style="color: black;">
									????????? : <input type="email" name="momEmail" id="momEmail"
										class="span12" placeholder="${modify.momEmail}">
								</h5>
							</div>
						</div>

						<div class="control-group">
							<div class="controls">
								<h5 style="color: black;">
									???????????? : <input type="text" name="momPhone" id="momPhone"
										class="span12">
								</h5>
							</div>
						</div>

						<div class="control-group">
							<div class="controls">
								<input type="button" value="????????????" onclick="memberModify()" class="message-btn"> 
								<input type="reset" class="message-btn" value="????????????">
							</div>
						</div>
					</form>
					
				</div>
				
				
			</div>
		</div>
		<br>&nbsp;
	</div>
	
	
	
	<div class="section primary-section">
		<div class="triangle"></div>
		<div class="container">
			<div class="title"></div>
			<div class="row"></div>
		</div>
	</div>

	<div class="footer">
		<p id="footer">
			<i class="fa fa-love"></i>
		</p>
	</div>
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

<script>
		function memberModify() {
			var password = '${modify.momPw}';
			var passwordConfirm = document.getElementById("momPw").value;

			if (password == passwordConfirm) {
				modiForm.submit();
			} else {
				alert('??????????????? ????????????.');
				location.href="memberModifyForm?momId=${modify.momId}";
			}
		}
</script>

</html>