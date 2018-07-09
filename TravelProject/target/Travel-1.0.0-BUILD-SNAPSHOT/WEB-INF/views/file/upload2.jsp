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

   
<table id="preset" cellpadding="5" cellspacing="0" border="1">
	<tr>
		<th>제목</th>
		<td>.</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>.</td>
	</tr>
	<tr name="tr_attach_file">
		<th>첨부파일</th>
		<td>
			<input type="file" name="attachFile" id="attachFile" class="atchfile"/> <button type="button" onclick="addFile()">추가</button>
		</td>
	</tr>
	<!-- 추가 버튼을 누르면 위 숨겨진 테이블의 tr 을 가져다가 추가할 겁니닷 -->
</table>

<button type="text" name="btnWrite" id="btnWrite">전송하기</button>


</form>
</body>
</html>

<script>
function addFile(){
	$('[name=mform] [name=tr_attach_file]:last').after( $('#preset tr').clone() );
	// $('#preset tr').clone() : id=preset 에서 tr 요소 셀렉트 하여 복제 !!
	// form1 안에 이름이 tr_attach_file 인것 중 마지막 것 다음에 추가합니다.
	// 이렇게 하면 실행때 마다 동적으로 하나씩 추가됩니다.
}


$(document).ready(function(){
	
	$("#btnWrite").click(function(){
		//textarea 객체에 값 전달하기 
		
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

		// title=제목1&contents=내용1
		console.log(formData.getAll("attachFile").length);
		//return false;
		
		//파일의 경우 반드시 추가로 뭔가를 해줘야 한다 
					     
		var url="${commonURL}/file/save.do";
			
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
				alert('글이 등록되었습니다');
				
				location.href="<%=commonURL%>/board/list.do";
			},
			error:function(request, status, error){
				//서버호출 실패시 
				alert("파일 용량이 너무 커서 못올립니다");
			}
		});
		
		
	});
});

</script>




