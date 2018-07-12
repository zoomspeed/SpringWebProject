<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="UTF-8"%>
<%-- 
<%@include file="../include/common_login_old.jsp"%>
 --%>
 
<%@include file="../include/common_main.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>Social Login Form Flat Responsive widget Template :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Social Login Form Widget Responsive, Login form web template,Flat Pricing tables,Flat Drop downs  Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- font files  -->
<link href='//fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Nunito:400,300,700' rel='stylesheet' type='text/css'>
<!-- /font files  -->
<!-- css files -->
<link href="/travel/resources/template/css/style2.css" rel='stylesheet' type='text/css' media="all" />
<!-- /css files -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head><!-- comonURL:${commonURL} -->

 

<body>
<h1>Social Login Form</h1>
<div class="log"><%-- background="${commonURL}/resources/template/images/login/banner.jpg" --%>
<div class="social w3ls">
		<li class="f"><a href="#"><img src="${commonURL}/resources/template/images/login/fb.png" alt=""></a></li>
		<li class="t"><a href="#"><img src="${commonURL}/resources/template/images/login/twt.png" alt=""></a></li>
		<!-- <li class="p"><a href="#"><i class="fa fa-google" style="font-size:36px; color:white"></i></a></li> -->
		<li class="p"><a href="#"><img src="${commonURL}/resources/template/images/login/pin.png" alt=""></a></li>
		<li class="i"><a href="#"><img src="${commonURL}/resources/template/images/login/ins.png" alt=""></a></li>
		<div class="clear"></div>
	</div>
	<div class="content1 agileits">
		<h2>Sign In</h2>
		<form name="myform" id="myform" method="post">
			<input type="email" name="email" id="email" value="Email Address" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email Address';}">
			<input type="password" name="password" id="password" value="Password"onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}" >
			<div class="button-row">
				<input type="submit" class="sign-in" id="btnLogon" value="Sign In">
				<!--  <button id="btnLogon"  class="btn btn-primary" type="submit">로그온</button>  -->
				<div class="clear"></div>
				
				
			</div>
		</form>
		<h3>New Here? <a href="${commonURL}/member/signup.do">Sign Up</a></h3>
	</div>
</div>
<div class="footer">
	<p>© 2016 Social Login Form. All Rights Reserved | Design by <a href="https://w3layouts.com/" target="_blank">w3layouts</a></p>
</div>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <!--  <script src="/travel/resources/js/bootstrap.min.js"></script>-->

</body>
</html>


<script>
$(function(){

	$("#btnLogon").click(function(event){
		
		event.preventDefault();
		
	   var email = $("#email").val();
	   var pwd = $("#password").val();
	   
/*  	   alert(email);
	   alert(password); */ 
	   $.ajax({
		   //console.log();
		   url:"${commonURL}/member/logon_proc.do",
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
					//location.href="${commonURL}/home";
			   }
			   else if(data=="2")
			   {
				   alert("패스워드 오류입니다");
				  // location.href="${commonURL}/home";
			   }
			   else  
			   {
					alert("로그온 되셨습니다");
					//페이지 이동 
					location.href="${commonURL}/home.do";
			   }
		   },
		   error:function(){
			   alert("서버랑 통신이 원할하지 않습니다");
		   }
	   });
	});
	
	$("#btnIdFind").click(function(event){
		event.preventDefault();
		location.href="${commonURL}/member/idfind.do";
	});
	
	$("#btnPwdFind").click(function(event){
		event.preventDefault();
		location.href="${commonURL}/member/pwdfind.do";
	});
	
});


</script>