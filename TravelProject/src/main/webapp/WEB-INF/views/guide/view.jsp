<%@ page language="java" 
    contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
  
<%@include file="../include/common_old.jsp"%>


<body class="admin" lang="en">


<!-- site align S -->
<div class="sa">

	<%@include file="../include/header.jsp"%>

	<%@include file="../include/left.jsp"%>
	

	<!-- section S -->
	<div id="section">

		<div id="pagetitle">

			<h2>관리자 모드</h2>
		</div>

		<div id="content">

			<h3>관리자 상세보기</h3>

			<!-- bbs view header S -->
			<div class="bvhd dbline">
				<dl>
					<dt class="subject">제목</dt>
						<dd class="subject">제목들어갑니다.</dd>
					<dt class="date">작성일</dt>
						<dd class="date">2012-03-09</dd>
					<dt class="country">작성자</dt>
						<dd class="country">홍길동</dd>
					<dt class="hits">조회</dt>
						<dd class="hits">310</dd>
				</dl>
			</div>
			<!-- bbs view header E -->

			<!-- bbs view content S -->
			<div class="bvc">
				<p>
					내용들어갑니다.
				</p>
				<p>
					내용들어갑니다.내용들어갑니다.내용들어갑니다.내용들어갑니다.내용들어갑니다.내용들어갑니다.내용들어갑니다.
				</p>
				<p>
					내용들어갑니다.내용들어갑니다.내용들어갑니다.<br />내용들어갑니다.내용들어갑니다.내용들어갑니다.내용들어갑니다.
				</p>

				<dl class="files">
					<dt>첨부파일</dt>
					<dd><a href="#">첨부파일1.txt</a></dd>
					<dd><a href="#">첨부파일2.txt</a></dd>
					<dd><a href="#">첨부파일3.txt</a></dd>
					<dd><a href="#">첨부파일4.txt</a></dd>
				</dl>
			</div>
			<!-- bbs view content E -->

			<!-- bbs footer S -->
			<div class="bftv">

				<div class="bb">
					<ul class="sbb">
						<li><a href="#">목록</a></li>
						<li><a href="#">수정</a></li>
						<li><a href="#">삭제</a></li>
					</ul>
				</div>

			</div>
			<!-- bbs footer E -->

			<!-- other list S -->
			<div class="otl">
				<dl>
					<dt class="prev">이전글</dt>
					<dd class="prev"><a href="#">이전글 입니다.</a></dd>
					<dt class="next">다음글</dt>
					<dd class="next"><a href="#">다음글 입니다.</a></dd>
				</dl>
			</div>
			<!-- other list E -->


		</div>
		<!-- content E -->

	</div>
	<!-- section E -->

	<%@include file="../include/footer_ami.jsp"%>

</div>
<!-- site align E -->


</body>
</html>