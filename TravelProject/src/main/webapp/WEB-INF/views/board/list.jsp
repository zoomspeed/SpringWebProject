<%@ page language="java" 
    contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.*"%>
<%@page import="com.multi.travel.board.dto.*"%>
<%@page import="com.multi.travel.common.*"%>

<%@include file="../include/common.jsp"%>

<%
String sel="all";
if(request.getParameter("sel")!=null)
	sel = request.getParameter("sel");
String key="";
if(request.getParameter("key")!=null)
	key = request.getParameter("key");

%>

<body class="admin" lang="en">
<form name="mform" id="mform">
	<input type="text" name="pg" value="<%=pg%>" id="pg" />
	<input type="hidden" name="mode" id="mode" />
	<input type="hidden" name="board_seq" id="board_seq" />
	        
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

			

			<h3>관리자 리스트</h3>

			<!-- bbs search S -->
			<div class="bs">
				<fieldset>
					<legend class="desc">Search</legend>

					<h3><img src="${commonURL}/resources/images/board/def/search_title.gif" width="46" height="9" alt="search" /></h3>
					<p>
						<label for="sel" class="desc">Target</label>
						<select id="sel" name="sel">
							<option value="all" <%if(sel.equals("all")){%>selected<%}%>>전체</option>
							<option value="title" <%if(sel.equals("title")){%>selected<%}%>>제목</option>
							<option value="contents" <%if(sel.equals("contents")){%>selected<%}%>>내용</option>
						</select>
						<label for="key" class="desc">Keyword</label>
						<input type="text" id="key" name="key" 
						   class="keyword" size="30" value="<%=key%>"/> <span class="inbtn inputBtn"><input type="button" onclick="goSearch()" class="submit" value="Search" /></span>
					</p>

				</fieldset>
			</div>
			<!-- bbs search E -->

			<!-- bbs header S -->
			<div class="bhd">
				<p class="fl"><strong>100 건</strong> 의 게시물이 있습니다.</p>
			</div>
			<!-- bbs header E -->

			<!-- bbs default list S -->
			<table cellspacing="0" summary="[게시판명 프로그램입력]의 게시물 목록 입니다." class="bdl">
				<caption class="desc">[게시판명 프로그램입력] 목록</caption>
				<colgroup>
					<col width="8%" />
					<col width="*" />
					<col width="10%" />
					<col width="12%" />
					<col width="8%" />
					<col width="14%" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col" class="first">번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일</th>
						<th scope="col" >조회</th>
						<th scope="col" >비고</th>
					</tr>
				</thead>

				<tbody>
				<%
					List<BoardDto> list 
					 = (List<BoardDto>)request.getAttribute("list");
					int total = (Integer)request.getAttribute("total");
								
					for(int i=0; i<list.size(); i++){
						BoardDto item = list.get(i);
						int num= total-Integer.parseInt(item.getNum())+1;
						String url=commonURL + "/board/view.do?board_seq="
								+ item.getBoard_seq() + "&sel="+sel
								+ "&key="+key;
						
						String reply="";
						for(int j=0; j<Integer.parseInt(item.getDepth()); j++)
							reply += "&nbsp;&nbsp;&nbsp;";
						if(reply.length()>0)
							reply +="ㄴ>";
				%>
					<tr>
						<td class="first"><%=num%></td>
						
						<td class="list"><%=reply%><a href="<%=url%>"><%=item.getTitle()%></a></td>
						<td><%=item.getUserid()%></td>
						<td><%=item.getRegdate()%></td>
						<td><%=item.getHit()%></td>
						<td class="last">
							<a href="#none" class="btn" onclick="goModify('<%=item.getBoard_seq()%>')"><span>수정</span></a>
							<a href="#none" class="btn" onclick="goDelete('<%=item.getBoard_seq()%>')"><span>삭제</span></a>
						</td>
					</tr>
		<%} %>
				</tbody>

			</table>
			<!-- bbs default list E -->

			<!-- bbs footer S -->
			<div class="bft">

				<div class="sbb">
					<ul>
						<li><a href="#"><img src="${commonURL}/resources/images/board/def/excel.gif" alt="Excel Save" /></a></li>
					</ul>
				</div>

				<!-- pagination S -->
				<div class="pg">

					<%=Pager.makeTag(request, 10, total)%>
				</div>
				<!-- pagination E -->

				<div class="bb withpg">
					<ul>
						<li><a href="#none" id="btnList">목록</a></li>
						<li><a href="#none" id="btnWrite">글쓰기</a></li>
						
					</ul>
				</div>

			</div>
			<!-- bbs footer E -->

			

		</div>
		<!-- content E -->

	</div>
	<!-- section E -->

	<%@include file="../include/footer.jsp"%>

</div>
<!-- site align E -->

</form>
</body>
</html>

<script>
function goPage(pg)
{
	/*var frm = document.mform;
	frm.pg.value=pg;
	frm.action="${commonURL}/board/list.mt";
	frm.submit();*/
	
	$("#pg").val(pg); //frm.pg.value=pg;
	//jquery버전이나 브라우저에 따라서 attr이 
	//먹는 경우가 있고 prop가 먹는 경우가 있다 
	$("#mform").attr("action", 
			"${commonURL}/board/list.do");
	$("#mform").prop("action", 
	"${commonURL}/board/list.do");

	$("#mform").submit();
}

function goSearch()
{
	/*var frm = document.mform;
	frm.pg.value="0";//검색누르면 첫번째 페이지로 이동
	frm.action="${commonURL}/board/list.mt";
	frm.submit();*/
	
	$("#pg").val("0"); 
	$("#mform").attr("action", 
			"${commonURL}/board/list.do");
	$("#mform").prop("action", 
	"${commonURL}/board/list.do");

	$("#mform").submit();
}

function goModify(board_seq)
{
	$("#mode").val("update");
	$("#board_seq").val(board_seq);
	var url="${commonURL}/board/write.do";
	$("#mform").attr("action",url);
	$("#mform").prop("action",url);
	$("#mform").submit();
}

function goDelete(board_seq)
{
	if( confirm("삭제하시겠습니까? "))
	{
		var url="${commonURL}/board/delete.do";
		$.ajax({
			url:url,
			data:{"board_seq":board_seq},
			dataType:"text",
			success:function(data){
				alert("글이 삭제되었습니다");
				//현재 페이지 새로 고침하기 
				//location.reload();
			},
			error:function(e){
				alert("삭제 실패");
			}
		});
	}
	
}

$(document).ready(function(){
	$("#btnWrite").click(function(){
		//여기다 write로 전송하기 
		$("#pg").val("0"); 
		$("#sel").val("all"); 
		$("#key").val("");
		$("#mode").val("insert");
		
		$("#mform").attr("action", "${commonURL}/board/write.do");
		$("#mform").prop("action", "${commonURL}/board/write.do");

		$("#mform").submit();
	});
});


</script>
