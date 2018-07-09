<%@ page language="java" 
    contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Listing &mdash; 100% Free Fully Responsive HTML5 Template by FREEHTML5.co</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	<meta name="author" content="FREEHTML5.CO" />

  <!-- 
	//////////////////////////////////////////////////////

	FREE HTML5 TEMPLATE 
	DESIGNED & DEVELOPED by FREEHTML5.CO
		
	Website: 		http://freehtml5.co/
	Email: 			info@freehtml5.co
	Twitter: 		http://twitter.com/fh5co
	Facebook: 		https://www.facebook.com/fh5co

	//////////////////////////////////////////////////////
	 -->

  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />






<!-- board template start -->
<!-- 
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- board template end -->



	<!-- table template  start -->
	<%-- <%@include file="./header3.jsp"%> --%>
	<!-- table template  end -->

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<!-- <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'> -->
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="${commonURL}/resources/template/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="${commonURL}/resources/template/css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="${commonURL}/resources/template/css/bootstrap.css">
	<!-- Superfish -->
	<link rel="stylesheet" href="${commonURL}/resources/template/css/superfish.css">

	<link rel="stylesheet" href="${commonURL}/resources/template/css/style.css">


	<!-- Modernizr JS -->
	<script src="${commonURL}/resources/template/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	<!-- test start --> <!-- 겹치는부분.... -->
	 <link rel="stylesheet" href="${commonURL}/resources/board_template/board.css"> 
	<!-- test end -->

	<!-- jQuery -->
	

	<script src="${commonURL}/resources/template/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="${commonURL}/resources/template/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="${commonURL}/resources/template/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="${commonURL}/resources/template/js/jquery.waypoints.min.js"></script>
	<!-- Stellar -->
	<script src="${commonURL}/resources/template/js/jquery.stellar.min.js"></script>
	<!-- Superfish -->
	<script src="${commonURL}/resources/template/js/hoverIntent.js"></script>
	<script src="${commonURL}/resources/template/js/superfish.js"></script>

	<!-- Main JS -->
	<script src="${commonURL}/resources/template/js/main.js"></script>



	<!-- Google Map -->
	    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDDSFJk-gBENhgfxPZ5I8BLrdMcYJdJP2c&callback=initMap"
        async defer></script>	
	
	<!--     
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCefOgb1ZWqYtj7raVSmN4PL2WkTrc-KyA&sensor=false"></script>
         
	<script src="${commonURL}/resources/template/js/google_map.js"></script>
	 -->
	<!-- Main JS -->
	<script src="${commonURL}/resources/template/js/main.js"></script>




<%-- 	</head>	
<!-- header S -->
	<body>
		<div id="fh5co-header">
			<header id="fh5co-header-section">
				<div class="container">
					<div class="nav-header">
						<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"><i></i></a>
						<h1 id="fh5co-logo"><a href="index.html">Listing</a></h1>
						<!-- START #fh5co-menu-wrap -->
						<nav id="fh5co-menu-wrap" role="navigation">
							<ul class="sf-menu" id="fh5co-primary-menu">
								<li class="active">
									<a href="${commonURL}">Home</a>
								</li>
								<li>
									<a href="${commonURL}/board/test.do" class="fh5co-sub-ddown">게시판</a>
									<ul class="fh5co-sub-menu">
										<li><a href="${commonURL}/board/list.do" target="_blank">자유게시판</a></li>
										<li><a href="http://freehtml5.co/preview/?item=work-free-html5-template-bootstrap" target="_blank">Q&A 게시판</a></li>
										<li><a href="http://freehtml5.co/preview/?item=light-free-html5-template-bootstrap" target="_blank">앨범게시판</a></li>
										<li><a href="http://freehtml5.co/preview/?item=relic-free-html5-template-using-bootstrap" target="_blank">공지사항</a></li>
										<li><a href="${commonURL}/board/test.do" target="_blank">Test</a></li>
										<li><a href="http://freehtml5.co/preview/?item=sprint-free-html5-template-bootstrap" target="_blank">Sprint</a></li>
									</ul>
								</li>
								<li>
									<a href="${commonURL}/file/upload.do" class="fh5co-sub-ddown">길찾기</a>
									<ul class="fh5co-sub-menu">
										<li><a href="${commonURL}/file/upload.do" target="_blank">사진위치로 길찾기</a></li>
										<li><a href="http://freehtml5.co/preview/?item=work-free-html5-template-bootstrap" target="_blank">주변 관광지 찾기</a></li>
										<li><a href="${commonURL}/map/mapInfo.do" target="_blank">가장빠른길 찾기</a></li>
									</ul>
								</li>								
								 
		 
						 	<c:if test="${email==null || email==''}">	 

								<li>
									<a href="${commonURL}/member/login.do" class="fh5co-sub-ddown">Login</a>
									<ul class="fh5co-sub-menu">
										<li><a href="${commonURL}/member/login.do" target="_blank">Login</a></li>
										<li><a href="${commonURL}/member/signup.do" target="_blank">SignUp</a></li>
									</ul>
								</li>

						 	</c:if>  
							
						 	<c:if test="${email!=null && email!=''}">	 
						
								<li>
									<a href="${commonURL}/member/logout.do" class="fh5co-sub-ddown">Logout</a>
									<ul class="fh5co-sub-menu">
										<li><a href="${commonURL}/member/logout.do" target="_blank">Logout</a></li>
									</ul>
								</li>

							 </c:if>	 								 			 

																 
								<li><a href="${commonURL}/contact.do">Contact</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</header>
			
		</div>
<!-- header E --> --%>