<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/common_main.jsp"%>

<!doctype html>
<html>
<head>
<title>Social Login Form Flat Responsive widget Template :: w3layouts</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Social Login Form Widget Responsive, Login form web template,Flat Pricing tables,Flat Drop downs  Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- font files  -->
<link href='//fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Nunito:400,300,700' rel='stylesheet' type='text/css'>
<!-- /font files  -->
<!-- css files -->
<link href="${commonURL}/resources/template/css/style2.css" rel='stylesheet' type='text/css' media="all" />
<link href="${commonURL}/resources/css/bootstrap.min.css" rel="stylesheet">

<style>



</style>
<!-- /css files -->
<!-- script files -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${commonURL}/resources/js/bootstrap.min.js"></script>
    <
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    
<!-- /script files -->


</head>
<body>


<div class="log">
	<div class="social w3ls">
		<li class="f"><a href="#"><img src="${commonURL}/resources/template/images/login/fb.png" alt=""></a></li>
		<li class="t"><a href="#"><img src="${commonURL}/resources/template/images/login/twt.png" alt=""></a></li>
		<li class="p"><a href="#"><img src="${commonURL}/resources/template/images/login/pin.png" alt=""></a></li>
		<li class="i"><a href="#"><img src="${commonURL}/resources/template/images/login/ins.png" alt=""></a></li>
		<div class="clear"></div>
	</div>
	<div class="content2 w3agile">
		<h2>Sign Up</h2>
		<form  name="myform" id="myform" method="post">
		
		<input type="hidden" name="idcheckyn" id="idcheckyn" value="N">
		<input type="hidden" name="emailcheckyn" id="emailcheckyn" value="N">
		<input type="hidden" name="interest" id="interest" value="interest">
		
		
			<input type="userid" name="userid" id="userid" value="Id" onfocus="if(idcheckyn.value== 'N') {this.value = '';}" onblur="if (this.value == '') {this.value = 'Id';}">
			<button id="btnIdCheck" class="btn btn-success">중복체크<i class="fa fa-mail-forward spaceLeft"></i></button>
			<span class="help-block" id="idcheckresult"></span>													
			<input type="email2" id="email" name="email" value="Email Address" onfocus="if(emailcheckyn.value== 'N') {this.value = '';}" onblur="if (this.value == '') {this.value = 'Email Address';}">
			<button id="btnEmailCheck" class="btn btn-success">중복체크<i class="fa fa-mail-forward spaceLeft"></i></button>
			<span class="help-block" id="emailcheckresult"></span>
			<input type="password" name="password" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}">
			<input type="text" id="username" name="username" value="username" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'username';}">
			
			<input type="zipcode" id="zipcode" name="zipcode" value="zipcode"  readonly>
			<button class="btn btn-success" type="button" id="btnFindZipcode">우편번호찾기<i class="fa fa-edit spaceLeft"></i></button>
            
            
			<input type="text" id="base_address" name="base_address" value="base address" readonly>
			<input type="text" id="detail_address" name="detail_address" value="detail_address" readonly>
			
			<span id="guide" class="help-block" 
                   style="width:500px"></span>
			
			<input type="mobile" name="mobile" value="mobile" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'mobile';}">
			<button class="btn btn-success">인증번호 전송<i class="fa fa-mail-forward spaceLeft"></i></button>
			<input type="profile_image" name="profile_image" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'profile_image';}">
			<button class="btn btn-success" id="btnUpload">파일업로드<i class="fa fa-mail-forward spaceLeft"></i></button>						
			
			<!-- 이용약관 동의 -->
			<div class="col-sm-6" data-toggle="buttons">
				<span class="fa fa-check"><input id="agree" type="checkbox" autocomplete="off" chacked></span><a href="#">이용약관</a> 에 동의 합니다.	
			</div>
			
			
			<input type="submit" class="register" value="Sign Up">
		</form>
		<h3>Already have an account? <a href="${commonURL}/member/login.do">Sign In</a></h3>
	</div>
</div>
<div class="footer">
	<p>© 2016 Social Login Form. All Rights Reserved | Design by <a href="https://w3layouts.com/" target="_blank">w3layouts</a></p>
</div>

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
    $("#btnEmailCheck").click(emailCheck);
    $("#btnFindZipcode").click(findZipCode);
 //   $("#btnUpload").click(imageUpload);
      
    
    
    
    
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
    	
    	if($("#username").val()=="")
    	{
    		alert("이름을 입력하세요");
    		event.preventDefault();
    	}
    	
    	//var interest=document.myform.interest1;
    	var temp="";
/*     	for(i=0; i<interest.length; i++)
    	{
    		if( interest[i].checked == true)
    			temp = temp + "1|";
    		else
    			temp = temp + "0|";
    		// temp에  1|0|0|1|   이렇게  들어있으면 
    		//음악하고 주식에 관심있다 
    	} */
    	//$("#interest").val(temp);
    	
    	$("#myform").prop("method", "post");
    	//$("#myform").prop("action", '<c:url value="/member/member_save"/>');
    	$("#myform").prop("action", "/travel/member/member_save.do");
    });
});






function idCheck(event)
{
	event.preventDefault();
	$.ajax({
		url:"${commonURL}/member/getIdCheck.do",
		data:{userid:$("#userid").val()},
		dataType:"text",
		success:function(result){
			if( result=="OK")
			{
				$("#idcheckresult").html("사용가능한 아이디 입니다");
				//css바꾸는거 찾아서 글자색 파란색으로 바꾸기
				$("#idcheckresult").css({color:'white'});
				$("#idcheckyn").val("Y");
				
				$("#userid").attr("readonly", true);
				$("#userid").prop("readonly", true);
				
			}
			else
			{		
				$("#idcheckresult").html("이미 사용중인 아이디 입니다");
				//css바꾸는거 찾아서 글자색 빨간색으로 바꾸기
				$("#idcheckresult").css({color:'red'});
			}
		},
		error: function(){
			alert("서버와 연결 실패");
		}
		
	});
}


function emailCheck(event)
{
	event.preventDefault();
	$.ajax({
		url:"${commonURL}/member/getEmailCheck.do",
		data:{email:$("#email").val()},
		dataType:"text",
		success:function(result){
			if( result=="OK")
			{
				$("#emailcheckresult").html("사용가능한 이메일 입니다");
				//css바꾸는거 찾아서 글자색 파란색으로 바꾸기
				$("#emailcheckresult").css({color:'white'});
				$("#emailcheckyn").val("Y");
				
				$("#email").attr("readonly", true);
				$("#email").prop("readonly", true);
				
			}
			else
			{		
				$("#emailcheckresult").html("이미 사용중인 이메일 입니다");
				//css바꾸는거 찾아서 글자색 빨간색으로 바꾸기
				$("#emailcheckresult").css({color:'red'});
			}
		},
		error: function(){
			alert("서버와 연결 실패");
		}
		
	});
}



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