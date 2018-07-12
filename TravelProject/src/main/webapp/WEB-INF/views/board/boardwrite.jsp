<%@ page language="java" 
    contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.*"%>    
<%@page import="com.multi.travel.image.dto.*"%>
<%@page import="com.multi.travel.common.*"%>
 <%@include file="../include/common_main.jsp"%>	
<%@include file="../include/startheader.jsp"%>
<%@include file="../include/viewheader.jsp"%>
<%@include file="../include/writeheader.jsp"%>
<%@include file="../include/mainheader.jsp"%>

<br/><br/><br/><br/>	

<!-- <body class="admin" lang="en" > -->
<form name="mform" id="mform" method="post" enctype="multipart/form-data">   
	<input type="text" name="group_id"
	   id="group_id" value="${resultDto.group_id}">
	<input type="text" name="depth"
	   id="depth" value="${resultDto.depth}">
	<input type="text" name="g_level"
	   id="g_level" value="${resultDto.g_level}"> 
	<input type="text" name="board_seq"
	   id="board_seq" value="${param.board_seq}"> 
 	<input type="text" name="mode"
	   id="mode" value="${param.mode}">
	<input type="text" name="userid" id="userid" value="${userid}">
 	     
<!------ Include the above in your HEAD tag ---------->
<style>

#user_pic{
max-width:730px; 
max-height:730px;
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
                        <td> 
                        <input type="text" id="title" name="title" size="70" value="${param.title }"/></td>
                      </tr>
                      <tr>
                        <td>작성자:</td>
                        <td>${userid}</td>
                      </tr>
                      <tr>
                        <td>내용</td>
                        <td><textarea id="editor" name="contents" rows="10" style="width:100%;">${resultDto.contents}</textarea></td>
                      </tr>
                      <tr>
						<%
						String mode=request.getParameter("mode");
						for(int i=0; i<3; i++)
						{
							if(!mode.equals("update")){
							
						%>
					<tr>
						<td scope="row" class="first"><label for="atchfile">첨부파일</label></td>
						<td class="last"><input type="file" id="files<%=(i+1)%>" name="files" size="50" class="atchfile" /></td>
					</tr>
						<%  }
							else{
							Hashtable<String, String> map =
								(Hashtable<String, String>)
								request.getAttribute("filemap");
							
						%>
						<tr>
							<th scope="row" class="first"><label for="atchfile">첨부파일</label></th>
							<td class="last">
														
							<input type="file"   id="files<%=(i+1)%>" name="files" size="50" class="atchfile" />
							<input type="checkbox" id="del<%=(i+1)%>" 
							             onclick="goChange('<%=i+1%>')" value="<%=(i+1)%>" >삭제 
							&nbsp;&nbsp;
							<%=map.get("filename"+(i+1))%>
							<input type="hidden" name="old_name" 
							     id="old_name" 
							value="<%=map.get("filename"+(i+1))%>" >
							</td>
						</tr>
						<%		
							}
						}
						%>
                    </tbody>
                  </table>
                  
                  <a href="#" class="btn btn-primary" onclick="history.go(-1)">취소</a>
                  <input type="button" id="btnWrite" name="btnWrite" class="btn btn-primary" value="확인" />
                </div>
              </div>
            </div>
            <div class="panel-footer">
                        <a data-original-title="Broadcast Message" data-toggle="tooltip" type="button" class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-envelope"></i></a>
                        <span class="pull-right">
                            <a href="edit.html" data-original-title="Edit this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a>
                            <a data-original-title="Remove this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-danger"><i class="glyphicon glyphicon-remove"></i></a>
                        </span>
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
	
	initSample(); 
	
    var panels = $('.user-infos');
    var panelsButton = $('.dropdown-user');
    panels.hide();

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

    $('button').click(function(e) {
        e.preventDefault();
        alert("This is a demo.\n :-)");
    });
    
    
    
	
	$("#btnWrite").click(function(){
		var data = CKEDITOR.instances.editor.getData()
		//textarea 객체에 값 전달하기 
		$("#editor").val(data);
		
		//에러체크 (제목, 내용, 아이디)
		if( $("#title").val().length==0)
		{
			alert("제목을 입력하세요");
			$("#title").focus();
			return false;
		}
		
		if( $("#editor").val().length==0)
		{
			alert("내용을 입력하세요");
			$("#editor").focus();
			return false;
		}
		
		//데이타 전송하기 위해서 form에 있는
		//모든 값들을 parameter 화한다 
		var form = $("#mform")[0];
		
		var formData = new FormData(form);
		alert(formData);
		/*
		첨부된 파일 수정시 어려운 이유?
		1. 삭제만 누르고, 파일 첨부 안하는 경우 
		2. 파일을 전부 또는 차례대로 삭제 안하고 
		   부분 부분 삭제를 한다 
		   배열로 넘어가서, 실제 삭제 된 대상이 
		   누군지 알아 낸 다음 
		   업데이트 될 필드가 뭔지 정확하게 알
		   아야 한다 
		   
		   
		*/
		if('${param.mode}'=='update')
		{
			for(i=1; i<=3; i++)
			{
				if(document.getElementById("del"+i).checked==true)
				 	formData.append("del", $("#del"+i).val());
				else
					formData.append("del", "");
			}
		}
		// title=제목1&contents=내용1
		console.log(formData.getAll("files").length);
		//return false;
		
		//파일의 경우 반드시 추가로 뭔가를 해줘야 한다 
					     
		var url="${commonURL}/board/save.do";
		if('${param.mode}'=='update')
			url="${commonURL}/board/update.do";
		else if('${param.mode}'=='reply' )
			url="${commonURL}/board/reply.do";
			
		//첨부파일 처리 
		$.ajax({
			url:url,
			processData:false, //fileupload시 꼭 필요
			contentType:false, //fileupload시 꼭 필요
			data:formData, 
			enctype:"multipart/form-data",
			timeout:600000,
			dataType: 'text',
			type:'POST',  //fileupload시 꼭 post
			success:function(result){
				//서버호출 성공시 
				if('${param.mode}'=='update')
					alert('글이 수정 되었습니다');
				else if('${param.mode}'=='reply')
					alert('답글이 달렸습니다');
				else
					alert('글이 등록되었습니다');
				
				location.href="<%=commonURL%>/board/test.do";
			},
			error:function(request, status, error){
				//서버호출 실패시 
				alert("파일 용량이 너무 커서 못올립니다");
			}
		});
		
		
	});
    
});
</script>