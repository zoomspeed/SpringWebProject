<%@ page language="java" 
    contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.multi.travel.common.*"%>    
<%@include file="../include/common4.jsp"%>

	<%@include file="../include/header2.jsp"%>
	
	<%-- <%@include file="../include/header3.jsp"%>	  --%>
	<%@include file="../include/header3.jsp"%>
	<%-- <%@include file="../include/left.jsp"%>	 --%>	
		
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@include file="../include/mainheader.jsp"%>
<form name="mform" id="mform">
<input type="hidden" name="pg" value="<%=pg%>" id="pg" />
<br/><br/><br/><br/>
	<div class="limiter" >
		<div class="container-table100" style="background-color:gray">
			<div class="wrap-table100">

				


				<div class="table100 ver3 m-b-110">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Number</th>
									<th class="cell100 column2">Title</th>
									<th class="cell100 column2">UserID</th>
									<th class="cell100 column5">RegDate</th>
									<th class="cell100 column5">ModDate</th>
									<th class="cell100 column5">Hit</th>
									<th class="cell100 column5">Ip_addr</th>
									<th class="cell100 column6">수정</th>
									<th class="cell100 column6">삭제</th>
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
										<c:out value="${total-item.num+1}"/>
									</td>
									<td class="cell100 column2">
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
									<td class="cell100 column2">
										<c:out value="${item.userid}"/>
									</td>
									<td class="cell100 column5">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<c:out value="${item.regdate}"/>
									</td>
									<td class="cell100 column5">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<c:out value="${item.moddate}"/>
									</td>									
									<td class="cell100 column5">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;
										<c:out value="${item.hit}"/>
									</td>
									<td class="cell100 column5">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;
										<%-- <c:out value="${item.username}"/> --%>
										<c:out value="${item.ip_addr}"/>
										<!-- <a href="#" class="settings" title="Settings" data-toggle="tooltip"><i class="material-icons">&#xE8B8;</i></a>
										<a href="#" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE5C9;</i></a> -->
									</td>
									<td class="cell100 column6">
										<a href="#" ><button type="button" class="btn btn-primary btn-sm">수정</button></a>
									</td>
									<td class="cell100 column6">
										<a href="#" ><button type="button" class="btn btn-danger btn-sm">삭제</button></a>
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
				<% 
					int total = Integer.parseInt(request.getAttribute("total").toString());
					out.print(Pager.makeTag(request, 16,total));
				%>				
			 

			
			</div>
		</div>
	</div>
</form>
<%@include file="../include/footer2.jsp"%>
<style>
.wrap-table100 ul{

    position:absolute;
    left:39%;
    /*left:42%;*/
}





</style>
<!--===============================================================================================-->	
	<script src="${commonURL}/resources/table_template/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="${commonURL}/resources/table_template/vendor/bootstrap/js/popper.js"></script>
	<script src="${commonURL}/resources/table_template/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="${commonURL}/resources/table_template/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="${commonURL}/resources/table_template/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
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
	
	
	
<!--===============================================================================================-->
	<script src="${commonURL}/resources/table_template/js/main.js"></script>

</body>
</html>