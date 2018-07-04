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
    	    <h1>패스워드 찾기</h1>
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
          <label class="col-sm-3 control-label" for="inputPassword">전화번호</label>
	        <div class="col-sm-6">
	          <input class="form-control" id="inputPassword" 
	          name="mobile" type="text" placeholder="전화번호">
	        
	        </div>
        </div>
        <div class="form-group">
          <div class="col-sm-12 text-center">
            <button id="btnPwdFind" class="btn btn-danger" type="submit">비밀번호 찾기<i class="fa fa-times spaceLeft"></i></button>
            <button id="btnLogon" class="btn btn-primary" type="submit">로그온<i class="fa fa-check spaceLeft"></i></button>
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
	$("#btnPwdFind").click(function(event){
		//서버로 전송
		   
	    $("#myform").submit(function(event){
	    		    	
	    	   	
	    	$("#myform").prop("method", "post");
	    	$("#myform").prop("action", 
	    			'<c:url value="/member/pwdfind_proc.do"/>');
	    	
	    });
	});
	
	$("#btnLogon").click(function(event){
		event.preventDefault();
		location.href="${commonURL}/member/login.do";
	});
});


</script>



