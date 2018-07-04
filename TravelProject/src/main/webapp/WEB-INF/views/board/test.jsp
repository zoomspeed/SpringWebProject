<%@ page language="java" 
    contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.multi.travel.common.*"%>    
<%@include file="../include/common4.jsp"%>
	<%@include file="../include/header2.jsp"%>
	<%@include file="../include/left.jsp"%>			
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!-- 
</head>

<body>
 -->
<form name="mform" id="mform">
 
 
 <input type="text" name="pg" value="<%=pg%>" id="pg" />
	<input type="text" name="mode" id="mode" />
	<input type="text" name="board_seq" id="board_seq" />
 
 <br/><br/><br/><br/>
    <div class="container">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-5">
						<h2> <b>자유게시판</b></h2>
					</div>
					<div class="col-sm-7">
						<a href="#" class="btn btn-primary"><i class="material-icons">&#xE147;</i> <span>Add New User</span></a>
						<a href="#" class="btn btn-primary"><i class="material-icons">&#xE24D;</i> <span>Export to Excel</span></a>						
					</div>
                </div>
            </div>
            
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>Seq</th>
                        <th>Name</th>						
						<th>Date Created</th>
						<th>Role</th>
                        <th>Status</th>
						<th>Action</th>
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
							<a href="#" class="settings" title="Settings" data-toggle="tooltip"><i class="material-icons">&#xE8B8;</i></a>
							<a href="#" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE5C9;</i></a>
						</td>
					</tr>
				</c:forEach>
                
                
                
          <!--       
                
                    <tr>
                        <td>1</td>
                        <td><a href="#"><img src="/examples/images/avatar/1.jpg" class="avatar" alt="Avatar"> Michael Holz</a></td>
                        <td>04/10/2013</td>                        
                        <td>Admin</td>
						<td><span class="status text-success">&bull;</span> Active</td>
						<td>
							<a href="#" class="settings" title="Settings" data-toggle="tooltip"><i class="material-icons">&#xE8B8;</i></a>
							<a href="#" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE5C9;</i></a>
						</td>
                    </tr>
					<tr>
                        <td>2</td>
                        <td><a href="#"><img src="/examples/images/avatar/2.jpg" class="avatar" alt="Avatar"> Paula Wilson</a></td>
                        <td>05/08/2014</td>                       
						<td>Publisher</td>
						<td><span class="status text-success">&bull;</span> Active</td>
						<td>
							<a href="#" class="settings" title="Settings" data-toggle="tooltip"><i class="material-icons">&#xE8B8;</i></a>
							<a href="#" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE5C9;</i></a>
						</td>
                    </tr>
					<tr>
                        <td>3</td>
                        <td><a href="#"><img src="/examples/images/avatar/3.jpg" class="avatar" alt="Avatar"> Antonio Moreno</a></td>
                        <td>11/05/2015</td>
						<td>Publisher</td>
                        <td><span class="status text-danger">&bull;</span> Suspended</td>                        
						<td>
							<a href="#" class="settings" title="Settings" data-toggle="tooltip"><i class="material-icons">&#xE8B8;</i></a>
							<a href="#" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE5C9;</i></a>
						</td>                        
                    </tr>
					<tr>
                        <td>4</td>
                        <td><a href="#"><img src="/examples/images/avatar/4.jpg" class="avatar" alt="Avatar"> Mary Saveley</a></td>
                        <td>06/09/2016</td>
						<td>Reviewer</td>
						<td><span class="status text-success">&bull;</span> Active</td>
						<td>
							<a href="#" class="settings" title="Settings" data-toggle="tooltip"><i class="material-icons">&#xE8B8;</i></a>
							<a href="#" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE5C9;</i></a>
						</td>
                    </tr>
					<tr>
                        <td>5</td>
                        <td><a href="#"><img src="${commonURL}/resources/images/admin/header/logout.gif" class="avatar" alt="Avatar"> Martin Sommer</a></td>
                        <td>12/08/2017</td>                        
                        <td>Moderator</td>
						<td><span class="status text-warning">&bull;</span> Inactive</td>
						<td>
							<a href="#" class="settings" title="Settings" data-toggle="tooltip"><i class="material-icons">&#xE8B8;</i></a>
							<a href="#" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE5C9;</i></a>
						</td>
                    </tr>
           -->      
           
            
                </tbody>
            </table>
			<div class="clearfix">
                <div class="hint-text">Showing <b>10</b> out of <b>${total}</b> entries</div>
                
                	<% 
					int total = Integer.parseInt(request.getAttribute("total").toString());
					out.print(Pager.makeTag(request, 10,total));
					%>
          
               <!--  <ul class="pagination">
                
                	
					<li class="page-item disabled"><a href="#" class="page-link">Previous</a></li>
                    <li class="page-item"><a href="#" class="page-link">1</a></li>
                    <li class="page-item"><a href="#" class="page-link">2</a></li>
                    <li class="page-item active"><a href="#" class="page-link">3</a></li>
                    <li class="page-item"><a href="#" class="page-link">4</a></li>
                    <li class="page-item"><a href="#" class="page-link">5</a></li>
                    <li class="page-item"><a href="#" class="page-link">Next</a></li>
                     
                </ul>
               -->
            </div>
        </div>
    </div>     
    				
				
    
				<!-- pagination S -->
				

		

				<!-- pagination E -->
</form>
</body>
</html>      

					




<script>
$(document).ready(function(){
	$('[data-toggle="tooltip"]').tooltip();
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
	








