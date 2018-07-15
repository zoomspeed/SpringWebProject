<%@ page language="java" 
    contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
	</head>	
<!-- header S -->
	<body >
		<div id="fh5co-header">
			<header id="fh5co-header-section">
				<div class="container">
					<div class="nav-header">
						<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"><i></i></a>
						<h1 id="fh5co-logo"><a href="${commonURL}">Listing</a></h1>
						<!-- START #fh5co-menu-wrap -->
						<nav id="fh5co-menu-wrap" role="navigation">
							<ul class="sf-menu" id="fh5co-primary-menu">
								<li class="active">
									<a href="${commonURL}">Home</a>
								</li>
								<li>
									<a href="${commonURL}/board/test.do" class="fh5co-sub-ddown">게시판</a>
									<ul class="fh5co-sub-menu">
										<li><a href="${commonURL}/board/test.do" target="_self">자유게시판</a></li>									
										<li><a href="${commonURL}/board/qna/list.do" target="_self">Q&A 게시판</a></li>
										<li><a href="${commonURL}/board/albumbbs.do" target="_self">앨범게시판</a></li>
										<li><a href="${commonURL}" target="_self">공지사항</a></li>
										<li><a href="${commonURL}/board/list.do" target="_self">자유게시판(ami)</a></li>
										<li><a href="${commonURL}/board/boardwrite.do" target="_self">testview</a></li>
										<li><a href="http://freehtml5.co/preview/?item=sprint-free-html5-template-bootstrap" target="_blank">템플릿참고</a></li>
									</ul>
								</li>
								<li>
									<a href="${commonURL}/file/upload.do" class="fh5co-sub-ddown">길찾기</a>
									<ul class="fh5co-sub-menu">
										<li><a href="${commonURL}/file/fileUpload.do" target="_self">사진위치로 길찾기</a></li>
										<li><a href="http://freehtml5.co/preview/?item=work-free-html5-template-bootstrap" target="_self">주변 관광지 찾기</a></li>
										<li><a href="${commonURL}/map/mapInfo.do" target="_self">가장빠른길 찾기</a></li>
									</ul>
								</li>								
								 
		 
						 	<c:if test="${email==null || email==''}">	 

								<li>
									<a href="${commonURL}/member/login.do" class="fh5co-sub-ddown">Login</a>
									<ul class="fh5co-sub-menu">
										<li><a href="${commonURL}/member/login.do" target="_self">Login</a></li>
										<li><a href="${commonURL}/member/signup.do" target="_self">SignUp</a></li>
									</ul>
								</li>

						 	</c:if>  
							
						 	<c:if test="${email!=null && email!=''}">	 
						
								<li>
									<a href="${commonURL}/member/logout.do" class="fh5co-sub-ddown">Logout</a>
									<ul class="fh5co-sub-menu">
										<li><a href="${commonURL}/member/logout.do" target="_self">Logout</a></li>
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
<!-- header E -->