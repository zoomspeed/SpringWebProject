<%@ page language="java" 
    contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.multi.travel.common.*"%>    
<%@include file="../include/common_main.jsp"%>

	<%@include file="../include/startheader.jsp"%>
	<%@include file="../include/listheader.jsp"%>
	<%-- <%@include file="../include/left.jsp"%>	 --%>	
		
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@include file="../include/mainheader.jsp"%>
<form name="mform" id="mform">
<input type="hidden" name="pg" value="<%=pg%>" id="pg" />
<br/><br/><br/><br/>
	<div class="limiter" >
		<div class="container-table100" style="background-color:#e6e6ff">
			<div class="wrap-table100">

				<br/><br/>


				<div class="table100 ver1 m-b-110">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column5" style="width:12%;"><font size="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Number</font></th>
									<th class="cell100 column3" style="width:17%;"><font size="4">Title</font></th>
									<th class="cell100 column2" style="width:13%;"><font size="4">Userid</font></th>
									<th class="cell100 column5" style="width:11%;"><font size="4">RegDate</font></th>
									<th class="cell100 column5" style="width:11%;"><font size="4" >ModDate</font></th>
									<th class="cell100 column5"><font size="4">Hit</font></th>
									<th class="cell100 column5"><font size="4" >Ip_addr</font></th>
									<th class="cell100 column6"><font size="4" >del/mod</font></th>
									<th class="cell100 column6"><font size="4"></font></th>
								</tr>
							</thead>
						</table>
					</div>

					<div class="table100-body js-pscroll">
						<table>
							<tbody>
							
							
							
							
							
								<c:forEach var="item" items="${list}" >
								<tr class="row100 body">
									<td  class="cell100 column5">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;
										<font size="4">
										<c:out value="${total-item.num+1}"/>
										</font>
									</td>
									<td class="cell100 column3">
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
										<font size="4" color="black">
										<c:out value="${item.title}"/>
										</font>
										</a>
										
										
										
									</td>
									<td class="cell100 column2">
										<font size="4">
										<c:out value="${item.userid}"/>
										</font>
									</td>
									<td class="cell100 column5">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<font size="4">
										<c:out value="${item.regdate}"/>
										</font>
									</td>
									<td class="cell100 column5">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<font size="4">
										<c:out value="${item.moddate}"/>
										</font>
									</td>									
									<td class="cell100 column5">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;
										<font size="4">
										<c:out value="${item.hit}"/>
										</font>
									</td>
									<td class="cell100 column5">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;
										<%-- <c:out value="${item.username}"/> --%>
										<font size="4">
										<c:out value="${item.ip_addr}"/>
										</font>
										<!-- <a href="#" class="settings" title="Settings" data-toggle="tooltip"><i class="material-icons">&#xE8B8;</i></a>
										<a href="#" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE5C9;</i></a> -->
									</td>
									<td class="cell100 column6">
										<a href="#" ><button type="button" class="btn btn-primary btn-sm"><font size="2">수정</font></button></a>
									</td>
									<td class="cell100 column6">
										<a href="#" ><button type="button" class="btn btn-danger btn-sm"><font size="2">삭제</font></button></a>
									</td>																
								</tr>
								</c:forEach>
							
							
							
<!-- 								<tr class="row100 body">
									<td class="cell100 column5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;100</td>
									<td class="cell100 column1">Like a butterfly</td>
									<td class="cell100 column2">Boxing</td>
									<td class="cell100 column3">9:00 AM - 11:00 AM</td>
									<td class="cell100 column4">Aaron Chapman</td>
									<td class="cell100 column5">10</td>
								</tr> -->


							</tbody>
						</table>

					</div>

				</div>
				
				<input id="key" name="key" type="text" value="${param.key}" class="keyword"  placeholder="Search..." />
				<input type="hidden" name="search" id="search" onclick="goSearch()"/>
				
				
				<select id="sel" name="sel">
					<option value="all" <%if(sel.equals("all")){%>selected<%}%>>전체</option>
					<option value="title" <%if(sel.equals("title")){%>selected<%}%>>제목</option>
					<option value="contents" <%if(sel.equals("contents")){%>selected<%}%>>내용</option>
				</select>				
			<br/>
				
	
				<% 
					int total = Integer.parseInt(request.getAttribute("total").toString());
					out.print(Pager.makeTag(request, 16,total));
				%>				
			 
					
				 
				
			
			</div>
		</div>
	</div>
</form>
<%@include file="../include/footer.jsp"%>

<script>
var input = document.getElementById("key");
input.addEventListener("keyup", function(event) {
    event.preventDefault();
    if (event.keyCode === 13) {
        document.getElementById("search").click();
    }
});


function goSearch()
{
	/*var frm = document.mform;
	frm.pg.value="0";//검색누르면 첫번째 페이지로 이동
	frm.action="${commonURL}/board/list.mt";
	frm.submit();*/
	
	$("#pg").val("0"); 
	$("#mform").attr("action", "${commonURL}/board/test.do");
	$("#mform").prop("action", "${commonURL}/board/test.do");

	$("#mform").submit();
}

</script>

<script>
		$('.js-pscroll').each(function(){
			var ps = new PerfectScrollbar(this);

			$(window).on('resize', function(){
				ps.update();
			})
		});
			
		
		function goPage(pg)
		{
			/*var frm = document.mform;
			frm.pg.value=pg;
			frm.action="${commonURL}/board/list.mt";
			frm.submit();*/
			
			$("#pg").val(pg); //frm.pg.value=pg;
			//jquery버전이나 브라우저에 따라서 attr이 
			//먹는 경우가 있고 prop가 먹는 경우가 있다 
			$("#mform").attr("action", "${commonURL}/board/test.do");
			$("#mform").prop("action", "${commonURL}/board/test.do");

			$("#mform").submit();
		}
		
		
</script>
	
	
	

</body>
</html>