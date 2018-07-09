<%@ page language="java" 
    contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
    
    <meta charset="utf-8">
	
<!-- header S -->
	<div id="header">

		<h1><a href="/"><img src="${commonURL}/resources/images/admin/header/logo.gif" alt="버라이어티 쿠킹 클래스 Amy Cooking" /></a></h1>

		<!-- skip nav -->
		<ul class="skip">
			<li><a href="#nav">주메뉴 바로가기</a></li>
			<li><a href="#pagetitle">본문내용 바로가기</a></li>
			<li><a href="#footer">하단 바로가기</a></li>
		</ul>

		<!-- spot S -->
		<div class="spot">

			<ul>
				<li class="last"><a href="#">Amy Cooking 홈페이지 바로가기</a></li>
			</ul>

		</div>
		<!-- spot E -->

		<!-- member S -->
		<div class="member">

			<dl>
				<dt>Administrator</dt>
				<dd>${username}</dd>
				<dd class="last"><a href="#" class="btn"><img src="${commonURL}/resources/images/admin/header/logout.gif" width="50" height="22" alt="Logout" /></a></dd>
			</dl>

		</div>
		<!-- member E -->

		<!-- nav S -->
		<div id="nav">

			<ul>
				<li class="on"><a href="#">전체보기</a></li>
				<li class="off"><a href="#">첫번째 메뉴</a></li>
				<li class="off"><a href="#">두번째 메뉴</a></li>
				<li class="off"><a href="#">세번째 메뉴</a></li>
				<li class="off"><a href="#">네번째 메뉴</a></li>
				<li class="off"><a href="#">다섯번째 메뉴</a></li>
				<li class="off"><a href="#">여섯번째 메뉴</a></li>
			</ul>

		</div>
		<!-- nav E -->

	</div>
	<!-- header E -->