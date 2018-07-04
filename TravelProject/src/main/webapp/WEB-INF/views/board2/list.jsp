<%@ page language="java" 
    contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.multi.travel.common.*"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
       
<%@include file="../include/common2.jsp"%>


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
						<label for="target" class="desc">Target</label>
						
						<select id="sel" name="sel">
							<option value="all" <%if(sel.equals("all")){%>selected<%}%>>전체</option>
							<option value="title" <%if(sel.equals("title")){%>selected<%}%>>제목</option>
							<option value="contents" <%if(sel.equals("contents")){%>selected<%}%>>내용</option>
						</select>
						
						<label for="keyword" class="desc">Keyword</label>
						<input type="text" id="key" name="key"
						    value="${param.key}"  
							class="keyword" size="30" 
						/>
						<span class="inbtn inputBtn"><input type="button" 
						 onclick="goSearch()" class="submit" value="Search" /></span>
					</p>

				</fieldset>
			</div>
			<!-- bbs search E -->

			<!-- bbs header S -->
			<div class="bhd">
				<p class="fl"><strong><c:out value="${total}"/>건</strong> 의 게시물이 있습니다.</p>
			</div>
			<!-- bbs header E -->

			<!-- bbs default list S -->
			<table cellspacing="0" summary="[게시판명 프로그램입력]의 게시물 목록 입니다." class="bdl">
				<caption class="desc">[게시판명 프로그램입력] 목록</caption>
				<colgroup>
					<col width="10%" />
					<col width="*" />
					<col width="10%"  />
					<col width="8%" />
					<col width="12%" />
					<col width="12%" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col" class="first">번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일</th>
						<th scope="col">조회</th>
						<th scope="col" class="last">비고</th>
					</tr>
				</thead>

				<tbody>
				
		<c:forEach var="item" items="${list}" >
					<tr>
						<td class="first">
							<c:out value="${total-item.num+1}"/>
						</td>
						<td class="list">
						    <c:forEach var="i" begin="1" 
						          end="${item.depth}">
						          &nbsp;&nbsp;&nbsp;
						    </c:forEach> 
							<c:if test="${item.depth!='0'}">
								ㄴ>  
							</c:if>

							<a href='
							<c:url value="/board2/view.do">
								<c:param name="board_seq" value="${item.board_seq}"/>
								<c:param name="pg" value="${param.pg}"/>
								<c:param name="sel" value="${param.sel}"/>
								<c:param name="key" value="${param.key}"/>
							</c:url>'>
							<c:out value="${item.title}"/>
							</a>
							
							
						</td>
						<td>
							<c:out value="${item.userid}"/>
						</td>
						<td>
							<c:out value="${item.regdate}"/>
						</td>
						<td>
							<c:out value="${item.hit}"/>
						</td>
						<td class="last">
							<a href="#" class="btn"><span>수정</span></a>
							<a href="#" class="btn"><span>삭제</span></a>
						</td>
					</tr>
		</c:forEach>
					
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

		
					<% 
					int total = Integer.parseInt(
							request.getAttribute("total").toString());
					out.print(Pager.makeTag(request, 10,total));
					%>
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
	$("#mform").attr("action", "${commonURL}/board2/list.mt");
	$("#mform").prop("action", "${commonURL}/board2/list.mt");

	$("#mform").submit();
}

function goSearch()
{
	/*var frm = document.mform;
	frm.pg.value="0";//검색누르면 첫번째 페이지로 이동
	frm.action="${commonURL}/board/list.mt";
	frm.submit();*/
	
	$("#pg").val("0"); 
	$("#mform").attr("action", "${commonURL}/board2/list.mt");
	$("#mform").prop("action", "${commonURL}/board2/list.mt");

	$("#mform").submit();
}

function goModify(seq)
{
	$("#mode").val("update");
	$("#seq").val(seq);
	var url="${commonURL}/board2/write.mt";
	$("#mform").attr("action",url);
	$("#mform").prop("action",url);
	$("#mform").submit();
}

function goDelete(seq)
{
	if( confirm("삭제하시겠습니까? "))
	{
		var url="${commonURL}/board2/delete.mt";
		$.ajax({
			url:url,
			data:{"seq":seq},
			dataType:"text",
			success:function(data){
				alert("글이 삭제되었습니다");
				//현재 페이지 새로 고침하기 
				location.reload();
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
		
		$("#mform").attr("action", "${commonURL}/board2/write.mt");
		$("#mform").prop("action", "${commonURL}/board2/write.mt");

		$("#mform").submit();
	});
	
	//다른거 초기화 하고 데이터 다시 불러오기 
	$("#btnList").click(function(){
		$("#pg").val(0);
		$("#sel").val("all");
		$("#key").val("");
		
		$("#mform").prop("action", "${commonURL}/board2/list.mt");

		$("#mform").submit();
	})
});


</script>
