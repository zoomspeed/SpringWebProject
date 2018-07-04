<%@ page language="java" 
    contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.multi.travel.board.dto.*"%>
<%@page import="java.util.*"%>
  
<%@include file="../include/common.jsp"%>

<body class="admin" lang="en">
<form name="mform" id="mform" 
      method="post"
      enctype="multipart/form-data">      

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
 
<!--
 
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

			<h3>관리자 쓰기</h3>

			<!-- bbs default write S -->
			<table cellspacing="0" summary="[프로그램 입력] 글쓰기 입력 양식입니다." class="bdw">
				<caption>글쓰기 입력 양식</caption>
				<colgroup><col width="125" /><col width="*" /></colgroup>
				<tbody>
					<tr>
						<th scope="row" class="first"><label for="title">제목</label></th>
						<td class="last"><input type="text" id="title" name="title" size="70"
						   value="${resultDto.title}" /></td>
					</tr>
					<tr>
						<th scope="row" class="first">
						  <label for="userid">작성자</label></th>
						<td class="last">
					<!--<input type="hidden" id="userid" name="userid" size="70" 
						       value="${email}" />  -->
						<input type="text" id="userid" name="userid" size="70" 
						value="${ResultDto.userid}" />						        
						${username}
						</td>
					</tr>

					<tr>
						<th scope="row" class="first"><label for="editor">내용</label></th>
						<td class="last"><textarea id="editor" name="contents" rows="10">${resultDto.contents}</textarea></td>
					</tr>
					
					<%
					String mode=request.getParameter("mode");
					for(int i=0; i<3; i++)
					{
						if(!mode.equals("update")){
						
					%>
					<tr>
						<th scope="row" class="first"><label for="atchfile">첨부파일</label></th>
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
			<!-- bbs default write E -->

			<!-- bbs footer S -->
			<div class="bft">

				<div class="bb">
					<ul>
						<li><a href="#" onclick="history.go(-1)">취소</a></li>
						<li class="inputBtn">
						<input type="button" id="btnWrite" value="확인" /></li>
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

function goChange(id)
{
	if(document.getElementById("del"+id).checked )
	{
		document.getElementById("files"+id).disabled=false;
	}
	else
	{
		document.getElementById("files"+id).disabled=true;
	}
}

$(document).ready(function(){
	initSample(); 
	finder.request( 'file:preview' );
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
					     
		var url="${commonURL}/board/save";
		if('${param.mode}'=='update')
			url="${commonURL}/board/update";
		else if('${param.mode}'=='reply' )
			url="${commonURL}/board/reply";
			
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
				
				location.href="<%=commonURL%>/board/list";
			},
			error:function(request, status, error){
				//서버호출 실패시 
				alert("파일 용량이 너무 커서 못올립니다");
			}
		});
		
		
	});
});

</script>




