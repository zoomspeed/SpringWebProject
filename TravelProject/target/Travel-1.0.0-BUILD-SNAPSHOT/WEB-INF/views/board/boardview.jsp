<%@ page language="java" 
    contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.*"%>    
<%@page import="com.multi.travel.board.dto.*"%>
<%@page import="com.multi.travel.common.*"%>
 <%@include file="../include/common_main.jsp"%>	
<%@include file="../include/startheader.jsp"%>
<%@include file="../include/viewheader.jsp"%>
<%@include file="../include/writeheader.jsp"%>
<%@include file="../include/mainheader.jsp"%>

<%
BoardDto viewDto = (BoardDto)request.getAttribute("viewDto");
BoardDto prevDto = (BoardDto)request.getAttribute("prevDto");
BoardDto nextDto = (BoardDto)request.getAttribute("nextDto");


%>

<br/><br/><br/><br/>	

<!-- <body class="admin" lang="en" > -->
<form name="mform" id="mform" method="post" enctype="multipart/form-data">   
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
	<input type="hidden" name="title" id="mode" value="<%=viewDto.getTitle() %>">
	
 	     
<!------ Include the above in your HEAD tag ---------->
<style>

#user_pic{
max-width:730px; 
max-height:730px;
}

img {
width:20%;
}


/* body {
    background-image: url("${commonURL}/resources/table_template/images/simple_blue_background-t2.jpg"), url("./pexels-photo-531880.jpeg");

${commonURL}/resouㄴrces/images/board/def/search_title.gif

}
body {
    background-image: url("${commonURL}/resources/table_template/images/view-image.jpg"), url("./pexels-photo-531880.jpeg");

}  */
</style>
 <div class="container" style="width:100%; height:100%; background-image:url('${commonURL}/resources/table_template/images/purple-gradient.png');">
<%-- <div class="container" style="width:100%; height:100%;""background-image= "url('${commonURL}/resources/table_template/images/simple_blue_background-t2.jpg')"> --%>
      <div class="row">
      <div class="col-md-5  toppad  pull-right col-md-offset-3 ">
           <A href="edit.html" >Edit Profile</A>

        <A href="edit.html" >Logout</A>
       <br>
<p class=" text-info">May 05,2014,03:00 pm </p>
      </div>
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xs-offset-0 col-sm-offset-0  toppad" >
   			<!-- class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" -->
          <div class="panel panel-info">
            <div class="panel-heading">
              <h3 class="panel-title">Sheena Shrestha</h3>
            </div>
            <div class="panel-body">
            
            
              <div class="row">
<!-- 여기부분이 사진 프로필 동그랗게 나옴 -->                
<!--
                 <div class="col-md-3 col-lg-3 " align="center"> <img alt="User Pic" src="http://babyinfoforyou.com/wp-content/uploads/2014/10/avatar-300x300.png" class="img-circle img-responsive"> </div>
 -->                
                <!--<div class="col-xs-10 col-sm-10 hidden-md hidden-lg"> <br>
                  <dl>
                    <dt>DEPARTMENT:</dt>
                    <dd>Administrator</dd>
                    <dt>HIRE DATE</dt>
                    <dd>11/12/2013</dd>
                    <dt>DATE OF BIRTH</dt>
                       <dd>11/12/2013</dd>
                    <dt>GENDER</dt>
                    <dd>Male</dd>
                  </dl>
                </div>-->
                <div class=" col-md-12 col-lg-12 " algin="right"> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td>제목:</td>
                        <td><%=viewDto.getTitle() %></td>
                      </tr>
                      <tr>
                        <td>작성자:</td>
                        <td><%=viewDto.getUserid() %></td>
                      </tr>
                      <tr>
                      	<td>내용:</td>
                        <td name="contents" id="contents"><%=viewDto.getContents() %></td>
                      </tr>
                      <tr>
                      	<td>첨부파일 1 :</td>
						<td><a href="<%=commonURL%>/down.do?id=board&filename=<%=viewDto.getFilename1()%>"><font color="black"><%=viewDto.getFilename1()%></a></font></td>
					  </tr>
					  <tr>
					  	<td>첨부파일 2 :</td>
						<td><a href="<%=commonURL%>/down.do?id=board&filename=<%=viewDto.getFilename2()%>"><font color="black"><%=viewDto.getFilename2()%></font></a></td>
					  </tr>
					  <tr>
					  	<td>첨부파일 3 :</td>
						<td><a href="<%=commonURL%>/down.do?id=board&filename=<%=viewDto.getFilename3()%>"><font color="black"><%=viewDto.getFilename3()%></a></font></td>	
					  </tr>
					  <tr>
					  	<td></td>
					  	<td><br/><br/><br/></td>
					  </tr>
					  
					  <tr>
					  	<td>이전글</td>
					  	<td>						
						  	<%if(prevDto!=null){%>
								<a href="?board_seq=<%=prevDto.getBoard_seq()%>"><font color="black"><%=prevDto.getTitle()%></font></a>
							<%}else{%>
							글의 시작입니다 
							<%}%>
						</td>
					  </tr>
					  <tr>
					  	<td>다음글</td>
					  	<td>
							<%if(nextDto!=null){%>
								<a href="?board_seq=<%=nextDto.getBoard_seq()%>"><font color="black"><%=nextDto.getTitle()%></font></a>
							<%}else{%>
							글의 마지막입니다 
							<%}%>					  	
					  	</td>
					  </tr>
                    </tbody>
                  </table>
                  	
                  
                  
                  

			
			
			
		
                  
                  
                  
<!--                   <a href="#" class="btn btn-primary" onclick="history.go(-1)">취소</a>
                  <input type="button" id="btnWrite" name="btnWrite" class="btn btn-primary" value="확인" /> -->
                </div>
              </div>
            </div>
            <div class="panel-footer">
            
            
            <div class="bftv">

				<div class="bb" align="right">
					<%
					String userid =(String)session.getAttribute("userid");
					if(userid==null) userid="";
					if(userid !=null && !userid.equals("")){%>
						<button class="btn btn-primary" id="btnReply">답변</button>
					<%}%>	
					
				   <%
					
				   if( userid.equals(viewDto.getUserid())) {
				   %>
						<a href="#none" id="btnUpdate" class="btn btn-warning"><i class="glyphicon glyphicon-edit"></i>수정</a>
						<a href="#none" id="btnDelete" class="btn btn-danger"><i class="glyphicon glyphicon-remove"></i>삭제</a>
				   <%} %>
				   
						<button id="btnList" class="btn btn-primary"><a href="${commonURL}/board/test.do">목록</a></button>
					
				</div>

			</div>
<!--                         <a data-original-title="Broadcast Message" data-toggle="tooltip" type="button" class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-envelope"></i></a>
                        <span class="pull-right">
                            <a href="edit.html" data-original-title="Edit this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a>
                            <a data-original-title="Remove this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-danger"><i class="glyphicon glyphicon-remove"></i></a>
                        </span> -->
            </div>
            
          </div>
        </div>
      </div>
         <br/><br/><br/><br/><br/> 
    </div>
<%@include file="../include/footer.jsp"%>
    
</form>


</body>
</html>

<style>
.user-row {
    margin-bottom: 14px;
}

.user-row:last-child {
    margin-bottom: 0;
}

.dropdown-user {
    margin: 13px 0;
    padding: 5px;
    height: 100%;
}

.dropdown-user:hover {
    cursor: pointer;
}

.table-user-information > tbody > tr {
    border-top: 1px solid rgb(221, 221, 221);
}

.table-user-information > tbody > tr:first-child {
    border-top: 0;
}


.table-user-information > tbody > tr > td {
    border-top: 0;
}
.toppad
{margin-top:20px;
}
</style>

<script>


$(document).ready(function() {
	
	//initSample(); 
	

    var panels = $('.user-infos');
    var panelsButton = $('.dropdown-user');
    panels.hide();

    
	var image = $('img');  
	var contents = $('#contents');
	//alert(image.width());
	//console.log("Aa"+image.width());
	if (image.width() > 1000) {
		console.log(image.width());
		image.width('1000px');
	}
	else{
		contents.width('1050px');
	}


    
    
    //Click dropdown
    panelsButton.click(function() {
        //get data-for attribute
        var dataFor = $(this).attr('data-for');
        var idFor = $(dataFor);

        //current button
        var currentButton = $(this);
        idFor.slideToggle(400, function() {
            //Completed slidetoggle
            if(idFor.is(':visible'))
            {
                currentButton.html('<i class="glyphicon glyphicon-chevron-up text-muted"></i>');
            }
            else
            {
                currentButton.html('<i class="glyphicon glyphicon-chevron-down text-muted"></i>');
            }
        })
    });


    //$('[data-toggle="tooltip"]').tooltip();

/*     $('button').click(function(e) {
        e.preventDefault();
        alert("This is a demo.\n :-)");
    });
     */
    
    
	
/* 	$("#btnList").click(function(){
		history.go(-1); //바로 전단계로 이동한다 
	}); */
	$("#btnReply").click(function(){
		$("#mode").val("reply");
		$("#mform").attr("action", 
		"${commonURL}/board/boardwrite.do");
		$("#mform").prop("action", 
		"${commonURL}/board/boardwrite.do");
		$("#mform").submit();
	});
 	$("#btnUpdate").click(function(){
		$("#mode").val("update");
		$("#mform").attr("action", 
		"${commonURL}/board/boardwrite.do");
		$("#mform").prop("action", 
		"${commonURL}/board/boardwrite.do");
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
					location.href="${commonURL}/board/test.do";
				},
				error:function(e){
					alert("삭제 실패");
				}
			});
		}
		
	});
    
});
</script>