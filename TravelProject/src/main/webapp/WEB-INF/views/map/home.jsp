<%@ page language="java" 
    contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.*"%>    
<%@page import="com.multi.travel.common.*"%>
<%@include file="../include/common4.jsp"%>

	<%@include file="../include/header2.jsp"%>
	


		<div id="fh5co-wrapper">
		<div id="fh5co-page">

		<div>
		
			<c:if test="${email==null || email==''}">	
				<div class="box"/>
					<a href="/travel/member/login.do">로그온</a>
				</div>		
				<div class="box"/>
					<a href="/travel/member/member_write.do">
					회원가입</a>
				</div>
			</c:if>
			
			<c:if test="${email!=null && email!=''}">	
				이름 : ${username} <br>
				이메일 : ${email} <br>
				모바일 : ${mobile} <br>
				사용자아이디 : ${userid} <br>
				<div class="box"/>
					<a href="/travel/member/logout.do">로그아웃</a>
				</div>
			</c:if>
		 
		</div>		
		
		<div class="fh5co-hero">
			<div class="fh5co-overlay"></div>
			<div class="fh5co-cover text-center" data-stellar-background-ratio="0.5" style="background-image: url(images/cover_bg_1.jpg);">
				<div class="desc animate-box">
					<h2>Travel Around The World.</h2>
					<!-- <span>Lovely Crafted by <a href="http://frehtml5.co/" target="_blank" class="fh5co-site-name">FREEHTML5.co</a></span> -->
					<span><a class="btn btn-primary btn-lg" href="/travel/board/list.do">Get Started</a></span>
				</div>
			</div>

		</div>
		
		
	<% 
		List<String> ImageList =(ArrayList<String>)request.getAttribute("ImageList");
	%>
			

		<div class="fh5co-listing">
			<div class="container">
				<div class="row">
				
				<%for(int i=0; i<ImageList.size(); i++){ %>
					<div class="col-md-4 col-sm-4 fh5co-item-wrap">
						<a class="fh5co-listing-item">
							<img src="${commonURL}/upload/image/<%=ImageList.get(i)%>" alt="Free HTML5 Bootstrap Template by FreeHTML5.co" class="img-responsive">
							<div class="fh5co-listing-copy">
								<h2><%=ImageList.get(i) %></h2>
								<span class="icon">
									<i class="icon-chevron-right"></i>
								</span>
							</div>
						</a>
					</div>
				<% } %>

				</div>
			</div>
		</div>


		<div class="fh5co-section">
			<div class="container">
				<div class="row">
					<div class="col-md-6 fh5co-news">
						<h3>News</h3>
						<ul>
							<li>
								<a href="#">
									<span class="fh5co-date">Sep. 10, 2016</span>
									<h3>Newly done Bridge of London</h3>
									<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusamus reprehenderit!</p>
								</a>
							</li>
							<li>
								<a href="#">
									<span class="fh5co-date">Sep. 10, 2016</span>
									<h3>Newly done Bridge of London</h3>
									<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusamus reprehenderit!</p>
								</a>
							</li>
							<li>
								<a href="#">
									<span class="fh5co-date">Sep. 10, 2016</span>
									<h3>Newly done Bridge of London</h3>
									<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusamus reprehenderit!</p>
								</a>
							</li>
						</ul>
					</div>
					<div class="col-md-6 fh5co-testimonial">
						<img src="${commonURL}/resources/template/images/cover_bg_1.jpg" alt="Free HTML5 Bootstrap Template by FreeHTML5.co" class="img-responsive mb20">
						<img src="${commonURL}/resources/template/images/cover_bg_1.jpg" alt="Free HTML5 Bootstrap Template by FreeHTML5.co" class="img-responsive">
					</div>
				</div>
			</div>
		</div>
		
	<%@include file="../include/footer2.jsp"%>
	

	</div>
	<!-- END fh5co-page -->

	</div>
	<!-- END fh5co-wrapper -->

	</body>
</html>
