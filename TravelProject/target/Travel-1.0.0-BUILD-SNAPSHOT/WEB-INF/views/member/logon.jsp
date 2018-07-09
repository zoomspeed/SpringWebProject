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
 
  </head>
  <body>
	
	   
     <form name="myform" id="myform" class="form-horizontal">
		
      <article class="container">
        <div class="col-md-12">
        <div class="page-header">
    	    <h1>로그온</h1>
        </div>

        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputEmail">이메일</label>
	        <div class="col-sm-6">
	         	<input class="form-control" id="inputEmail" 
		           name="email" type="email" placeholder="이메일">
		        <span class="help-block" id="idcheckresult"></span>
	        </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputPassword">비밀번호</label>
	        <div class="col-sm-6">
	          <input class="form-control" id="inputPassword" 
	          name="password" type="password" placeholder="비밀번호">
	        
	        </div>
        </div>
        <div class="form-group">
          <div class="col-sm-12 text-center">
            <button id="btnLogon"  class="btn btn-primary" type="submit">로그온</button>
            <button id="btnIdFind"   class="btn btn-danger" type="submit">아이디 찾기</button>
            <button id="btnPwdFind"  class="btn btn-danger" type="submit">비밀번호 찾기</button>
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

	$("#btnLogon").click(function(event){
		
		event.preventDefault();
		
	   var email = $("#inputEmail").val();
	   var pwd = $("#inputPassword").val();
	   $.ajax({
		   url:"${commonURL}/member/logon_proc",
		   data:{"email":email, "password":pwd},
		   dataType:"text",
		   /*
		    1.json, 2.xml, 3.text 셋중에 선택 가능하다 
		    컨트롤러에서 보내는 정보가 String 일 경우에는 text
		    로 받으면 된다 그게 아니고 List나, Map, Dto등 
		    복잡한 객체 형태로 보낼때는 json 이나 xml 중에 선택
		    가능하다 그런데 스프링은 xml로 전송보다는 json 
		    전송을 위한 라이브러리를 기본적으로 제공하고 있고,
		    또 클라이언트단의 자바스크립트에서 결과를 받았을 ㅕㅇ우 
		   xml의 경우는 xml을 파싱하기 위한 별도의 작업이 
		   필요하다 보니까, 바로 자바스크립트객체로 전홚되는 
		   json 을 일반적으로 많이 사용한다 
		   sns연동이나 api 연동때도 json이 대세가 되었다 
		   본래 ajax 는 비동기 xml 통신인데 지금은 
		   비동기 json 통신으로 사용된다 
		   */
		   success:function(data){
			   //성공시 호출될 함수인데 첫번째 파라미터가 
			   //서버로 부터 결과를 받아온다 
			   //변수명 각자 마음대로 
			   if(data=="1")
			   {
					alert("아이디를 찾을 수 없습니다");   
			   }
			   else if(data=="2")
			   {
				   alert("패스워드 오류입니다");
			   }
			   else  
			   {
					alert("로그온 되셨습니다");
					//페이지 이동 
					location.href="${commonURL}/home";
			   }
		   },
		   error:function(){
			   alert("서버랑 통신이 원할하지 않습니다");
		   }
	   });
	});
	
	$("#btnIdFind").click(function(event){
		event.preventDefault();
		location.href="${commonURL}/member/idfind";
	});
	
	$("#btnPwdFind").click(function(event){
		event.preventDefault();
		location.href="${commonURL}/member/pwdfind";
	});
	
});


</script>



