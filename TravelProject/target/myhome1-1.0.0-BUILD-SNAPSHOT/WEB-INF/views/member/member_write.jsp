<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" 
       uri="http://java.sun.com/jsp/jstl/core" %>


<%
request.setAttribute("commonURL", 
		    request.getContextPath());
%>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- explorer edge 버전와의 호환성 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 안드로이드나 아이폰에서 화면회전할때 비율 -->
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>회원가입</title>
    <!-- Bootstrap -->
    <link href="${commonURL}/resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- font awesome -->
    <link rel="stylesheet" href="${commonURL}/resources/css/font-awesome.min.css" media="screen" title="no title" charset="utf-8">
    <!-- Custom style -->
    <link rel="stylesheet" href="${commonURL}/resources/css/style.css" media="screen" title="no title" charset="utf-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!--  아래 주석은 html5 가 지원되지 않는 
                 브라우저의 호환성을 위해서 붙임 
                 삭제하면 안됨 
    -->
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
		function findZipCode(event)
		{
		
			event.preventDefault();
			//서버로 submit 막기 
			new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	                if(fullRoadAddr !== ''){
	                    fullRoadAddr += extraRoadAddr;
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
	                document.getElementById('base_address').value = fullRoadAddr;
	                document.getElementById('detail_address').value = data.jibunAddress;

	                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	                if(data.autoRoadAddress) {
	                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
	                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

	                } else if(data.autoJibunAddress) {
	                    var expJibunAddr = data.autoJibunAddress;
	                    alert(expJibunAddr);
	                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

	                } else {
	                    document.getElementById('guide').innerHTML = '';
	                }
	            }
	        }).open();
		}
	   
	</script>

  </head>
  <body>
	
	   
      <form name="myform" id="myform" class="form-horizontal">
		<input type="hidden" name="idcheckyn" 
		id="idcheckyn" value="N">
		<input type="hidden" name="interest" 
		id="interest">
      <article class="container">
        <div class="col-md-12">
        <div class="page-header">
    	    <h1>회원가입</h1>
        </div>

        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputEmail">이메일</label>
	        <div class="col-sm-6">
	         	<div class="input-group">
		            <input class="form-control" id="inputEmail" 
		           name="email" type="email" placeholder="이메일">
		           
		           <span class="input-group-btn">
		              <button id="btnIdCheck" class="btn btn-success">중복체크<i class="fa fa-mail-forward spaceLeft"></i></button>
		           </span>
	          	</div>    
	          	<span class="help-block" id="idcheckresult"></span>
	        </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputPassword">비밀번호</label>
        <div class="col-sm-6">
          <input class="form-control" id="inputPassword" 
          name="password" type="password" placeholder="비밀번호">
        <p class="help-block">숫자, 특수문자 포함 8자 이상</p>
        </div>
        </div>
          <div class="form-group">
              <label class="col-sm-3 control-label" for="inputPasswordCheck">비밀번호 확인</label>
             <div class="col-sm-6">
              <input class="form-control" id="inputPasswordCheck" type="password" placeholder="비밀번호 확인">
                <p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
             </div>
          </div>
          
          
        <div class="form-group">
            <label class="col-sm-3 control-label" for="inputName">이름</label>
          <div class="col-sm-6">
            <input class="form-control" name="username" id="inputName" type="text" placeholder="이름">
          </div>
        </div>
        <!-- 성별 -->
         <div class="form-group">
        
         <label class="col-sm-3 control-label" for="gender">성별</label>
          <div class="col-sm-6">
            <input type="radio" name="gender" value="M" checked>남자
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="radio" name="gender" value="F">여자
          </div>
        </div>
        <!--  관심사-->
         <div class="form-group">
            <label class="col-sm-3 control-label" 
            for="checkbox">관심사</label>
          <div class="col-sm-6">
            <input type="checkbox" name="interest1"
                 value="1">음악&nbsp;&nbsp;&nbsp;
      		<input type="checkbox" name="interest1"
                 value="2">스포츠&nbsp;&nbsp;&nbsp;
      		<input type="checkbox" name="interest1"
                 value="3">정치&nbsp;&nbsp;&nbsp;
      		<input type="checkbox" name="interest1"
                 value="4">주식&nbsp;&nbsp;&nbsp;
     
          </div>
        </div>
        
        <div class="form-group">
            <label class="col-sm-3 control-label" for="inputNumber">휴대폰번호</label>
              <div class="col-sm-6">
                <div class="input-group">
                  <input type="tel" class="form-control" 
                  name="mobile" id="inputNumber" placeholder="- 없이 입력해 주세요" />
                  
                  <span class="input-group-btn">
                    <button class="btn btn-success">인증번호 전송<i class="fa fa-mail-forward spaceLeft"></i></button>
                  </span>
                </div>
              </div>
        </div>
        <div class="form-group">
           <label class="col-sm-3 control-label" for="inputNumberCheck">주소</label>
          <div class="col-sm-6">
            <div class="input-group">
              <input class="form-control" id="zipcode" type="text" placeholder="우편번호">
              <span class="input-group-btn">
                <button class="btn btn-success" type="button" 
                id="btnFindZipcode">우편번호찾기<i class="fa fa-edit spaceLeft"></i></button>
              </span>
            </div>
           </div>
        </div>
        
         <div class="form-group">
           <label class="col-sm-3 control-label" for="inputNumberCheck">기본 주소</label>
          <div class="col-sm-6">
            
              <input class="form-control" id="base_address"
              name="base_address"  type="text" placeholder="기본주소">
              
         	 
           <div class="col-sm-6"> 
              <span id="guide" class="help-block" 
                   style="width:500px"></span>
           </div>
           </div>
        </div>
        
         <div class="form-group">
           <label class="col-sm-3 control-label" for="inputNumberCheck">상세주소</label>
          <div class="col-sm-6">
           
              <input class="form-control" 
              id="detail_address" 
              name="detail_address"  type="text" placeholder="상세주소를 입력하세요">
              
          
           </div>
        </div>
        
        <div class="form-group">
           <label class="col-sm-3 control-label" 
                   for="imagefile">이미지</label>
          <div class="col-sm-6">
           
             <div class="input-group">
              <input class="form-control" 
              id="imagefile" 
              name="imagefile"  type="file" placeholder="이미지를 업로드 하세요">
              
                <span class="input-group-btn">
                   <button class="btn btn-success"
                   id="btnUpload">파일업로드<i class="fa fa-mail-forward spaceLeft"></i></button>
                 </span>
                  
             	 <input type="hidden" id="image" name="image" >
              </div>
              <div style="margin:10px 0 0 0 ">
                 <img id="myimage" src="${commonURL}/resources/images/noimage.png" 
                   style="width:200px;height:200px">
         
              </div>
           </div>
        </div>
        
        
         <div class="form-group">
              <label class="col-sm-3 control-label" for="inputAgree">약관 동의</label>
            <div class="col-sm-6" data-toggle="buttons">
              <label class="btn btn-warning active">
                <input id="agree" type="checkbox" autocomplete="off" chacked>
                  <span class="fa fa-check"></span>
              </label>
              <a href="#">이용약관</a> 에 동의 합니다.
            </div>
          </div>
        <div class="form-group">
          <div class="col-sm-12 text-center">
            <button class="btn btn-primary" type="submit">회원가입<i class="fa fa-check spaceLeft"></i></button>
            <button class="btn btn-danger" type="submit">가입취소<i class="fa fa-times spaceLeft"></i></button>
          </div>
        </div>
        
          <hr>
        </div>
      </article>
</form>

    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${commonURL}/resources/js/bootstrap.min.js"></script>
  </body>
</html>
<script>
$(function(){
    /*
    	이벤트란? 프로그램 기법은 크게 코맨드 기법과
    			 이벤트 기법 두가지가 있다 
    			 코맨드 기법은 콘솔창에 직접 명령어를 
    			 입력하면 그 명령어가 수행되어서 결과가
    			 나오는 프로그램 기법이다 
    			 예)Run sql command 
    			 오라클 sqlplus 가 대표적인 예이다 
    			 cmd 창도 
    			 자바 프로젝트 프로그램 
    			 예전의 방식 
    	그래픽 유저 인터페이스(Graphic User Interface)
    	GUI 그래픽을 이용해서 일을 시킨다 
    	마우스를 클릭하거나 드레그 하거나 키를 누르거나 
    	화면 창을 키우거나 화면창을 줄이거나 
    	마우스를 클릭 - 프로그램 가동 
    	              화면창이 커질 수 도 있고
    	         연산을 할 수 도 있고 
    	         ...........
    	 마우스를 클릭을 이벤트라고 하자 
    	 시스템 입장에서 마우스 클릭이 발생하면
    	 각각의 프로그램한테 마우스 눌렸음을 
    	 어디서 눌렸는지 알려준다 
    	 
    	 마우스가 클릭되면 호출할 함수의 주소를 주면
    	 너한테서 마우스 클릭되었을때 내가 그 함수를 
    	 호출할거야 (callback 기법 )
    	 
    	 함수인데 만들기는 내가만들었는데 호출은 시스템이
    	 할거야 (이런 함수를 이벤트 핸들러 라고 부른다)
    */
	
    //idCheck 함수는 이벤트 핸들러이다. 
    //click 이벤트가 발생하면 저 함수를 호출해 주세요 
    $("#btnIdCheck").click(idCheck);
    $("#btnFindZipcode").click(findZipCode);
    $("#btnUpload").click(imageUpload);
      
    
    
    
    
    $("#myform").submit(function(event){
    	if($("#idcheckyn").val()=="N")
    	{
    		alert("아이디 중복체크를 하십시요");
    		event.preventDefault();
    	}
    	if( $("#inputPassword").val()!= 
    		$("#inputPasswordCheck").val())
    	{
    		alert("비밀번호와 비밀번호확인이 일치하지 않습니다");
    		event.preventDefault();
    	}
    	
    	if($("#inputName").val()=="")
    	{
    		alert("이름을 입력하세요");
    		event.preventDefault();
    	}
    	
    	var interest=document.myform.interest1;
    	var temp="";
    	for(i=0; i<interest.length; i++)
    	{
    		if( interest[i].checked == true)
    			temp = temp + "1|";
    		else
    			temp = temp + "0|";
    		// temp에  1|0|0|1|   이렇게  들어있으면 
    		//음악하고 주식에 관심있다 
    	}
    	$("#interest").val(temp);
    	
    	$("#myform").prop("method", "post");
    	$("#myform").prop("action", 
    			'<c:url value="/member/member_save"/>');
    	
    });
});

function idCheck(event)
{
	event.preventDefault();
	$.ajax({
		url:"${commonURL}/member/getIdCheck",
		data:{email:$("#inputEmail").val()},
		dataType:"text",
		success:function(result){
			if( result=="OK")
			{
				
				$("#idcheckresult").html(
						"사용가능한 아이디 입니다");
				//css바꾸는거 찾아서 글자색 파란색으로 바꾸기
				$("#idcheckresult").css({color:'blue'});
				$("#idcheckyn").val("Y");
				
				$("#inputEmail").attr("readonly", true);
				$("#inputEmail").prop("readonly", true);
				
			}
			else
			{
				$("#idcheckresult").html(
				"이미 사용중인 아이디 입니다");
				//css바꾸는거 찾아서 글자색 빨간색으로 바꾸기
				$("#idcheckresult").css({color:'red'});
			}
		},
		error: function(){
			alert("서버와 연결 실패");
		}
		
	});
}

function imageUpload()
{
	event.preventDefault();
	//<button> 타입은 무조건 서버로 정보를 전송하기 때문에 
	//ajax처럼 문서의 일부만 서버로 전송하는 경우와 충돌난다 
	//그래서 원래 button 에 있는 submit 기능을 막아야 한다 
	
	//1. 폼 객체에 대한 정보를 가져온다 
	var form = $("#myform")[0];
	//2.jquery 는 #아이디를 통해 객체 정보를 가져온다 
	
	var formData = new FormData(form);
	//3. 데이타를 서버로 보낼때, 특히나 multipart로 보낼때 
	//   데이타 전송하는 방법에 맞춰서 폼 객체를 FormData
	//   타입으로 전환한다 
	
	$.ajax({
		url:"${commonURL}/member/upload",
		//업로드 전송을 처리할 ,url 
		data:formData,//전송할 데이터 
		//파일업로드시 아래 3개의 항목 반드시
		processData:false,
		contentType:false,
		enctype:"multipart/form-data",
		timeout:600000,//600초(10분)넘어가면 잘라라 
		dataType:"text",
		//받아올 데이터 타입,text,json,xml 중 선태가능 
		type:"POST",
		//데이터 전송 방식 get, post 선택가능하나 
		//multipart 방식일 경우에는 반드시 post 로 한다 
		success:function(result){
			//파일 업로드 성공되었을때 
			alert("이미지가 업로드 되었습니다");
			var url = "${commonURL}/resources/upload/member/"
						+result
			$("#myimage").attr("src", url);
			$("#myimage").prop("src", url);
			
			//hidden 태그 
			$("#image").val(result);
			
		},
		error:function(){
			alert("이미지 업로드를 하지 못했습니다");
		}
	})
}

</script>



