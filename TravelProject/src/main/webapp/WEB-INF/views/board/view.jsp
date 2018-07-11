<%@ page language="java" 
    contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.multi.travel.board.dto.*"%>
  
<%@include file="../include/common_old.jsp"%>

<%
BoardDto viewDto = (BoardDto)request.getAttribute("viewDto");
BoardDto prevDto = (BoardDto)request.getAttribute("prevDto");
BoardDto nextDto = (BoardDto)request.getAttribute("nextDto");


%>
<body class="admin" lang="en">
<form name="mform" id="mform">
	<input type="hidden" name="pg" id="pg"
	     value="${param.pg}">
	<input type="hidden" name="sel" id="sel"
	     value="${param.sel}">
	<input type="hidden" name="key" id="key"
	     value="${param.key}">
	<input type="hidden" name="board_seq" id="board_seq"
	     value="${param.board_seq}">
	<input type="hidden" name="mode" id="mode"
	     value="">
	     


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
						<dd class="subject"><%=viewDto.getTitle()%></dd>
					<dt class="date">작성일</dt>
						<dd class="date"><%=viewDto.getRegdate()%></dd>
					<dt class="country">작성자</dt>
						<dd class="country"><%=viewDto.getUserid()%></dd>
					<dt class="hits">조회</dt>
						<dd class="hits"><%=viewDto.getHit()%></dd>
				</dl>
			</div>
			<!-- bbs view header E -->

			<!-- bbs view content S -->
			<div class="bvc">
				<%=viewDto.getContents()%>

				<dl class="files">
					<dt>첨부파일</dt>
					<dd><a href="<%=commonURL%>/down.do?id=board&filename=<%=viewDto.getFilename1()%>"><%=viewDto.getFilename1()%></a></dd>
					<dd><a href="<%=commonURL%>/down.do?id=board&filename=<%=viewDto.getFilename2()%>"><%=viewDto.getFilename2()%></a></dd>
					<dd><a href="<%=commonURL%>/down.do?id=board&filename=<%=viewDto.getFilename3()%>"><%=viewDto.getFilename3()%></a></dd>
				</dl>
			</div>
			<!-- bbs view content E -->

			<!-- bbs footer S -->
			<div class="bftv">

				<div class="bb">
					<ul class="sbb">
					<%
					String email =(String)session.getAttribute("email");
					if(email==null) email="";
					if(email !=null && !email.equals("")){%>
						<li><a href="#none" id="btnReply">답변</a></li>
					<%}%>	
					
				   <%
					
				   if( email.equals(viewDto.getUserid())) {
				   %>
						<li><a href="#none" id="btnUpdate">수정</a></li>
						<li><a href="#none" id="btnDelete">삭제</a></li>
				   <%} %>
				   
						<li><a href="#none" id="btnList">목록</a></li>
					</ul>
				</div>

			</div>
			<!-- bbs footer E -->

			<!-- other list S -->
			<div class="otl">
				<dl>
					<dt class="prev">이전글</dt>
					<dd class="prev">
						<%if(prevDto!=null){%>
						<a href="?board_seq=<%=prevDto.getBoard_seq()%>"><%=prevDto.getTitle()%></a>
						<%}else{%>
						글의 시작입니다 
						<%}%>
					</dd>
					<dt class="next">다음글</dt>
					<dd class="next">
					<%if(nextDto!=null){%>
						<a href="?board_seq=<%=nextDto.getBoard_seq()%>"><%=nextDto.getTitle()%></a>
					<%}else{%>
					글의 마지막입니다 
					<%}%>
					</dd>
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

</form> 
</body>
</html>
<script>
$(document).ready( function(){
	$("#btnList").click(function(){
		history.go(-1); //바로 전단계로 이동한다 
	});
	$("#btnReply").click(function(){
		$("#mode").val("reply");
		$("#mform").attr("action", 
		"${commonURL}/board/write.do");
		$("#mform").prop("action", 
		"${commonURL}/board/write.do");
		$("#mform").submit();
	});
	$("#btnUpdate").click(function(){
		$("#mode").val("update");
		$("#mform").attr("action", 
		"${commonURL}/board/write.do");
		$("#mform").prop("action", 
		"${commonURL}/board/write.do");
		$("#mform").submit();
	});
	
	$("#btnDelete").click(function(){
		if( confirm("삭제하시겠습니까? "))
		{
			var url="${commonURL}/board/delete.do";
			$.ajax({
				url:url,
				data:{"board_seq":$("#board_seq").val()},
				dataType:"text",
				success:function(data){
					alert("글이 삭제되었습니다");
					//현재 페이지 새로 고침하기 
					location.href="/${commonURL}/board/list.do";
				},
				error:function(e){
					alert("삭제 실패");
				}
			});
		}
		
	});
	
});


</script>
