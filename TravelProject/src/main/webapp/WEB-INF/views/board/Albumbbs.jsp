<%@ page language="java" 
    contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.multi.travel.common.*"%>



<%@include file="../include/common4.jsp"%>
	<%@include file="../include/header2.jsp"%>
	<%-- <%@include file="../include/left.jsp"%>	--%>		
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

       
<br/><br/><br/><br/><br/>


	
	<!--container.start-->
        <div id="container">
            <div id="review_area">
                <h3>REVIEW</h3>
                               
                <div class="review_list">
                	<ul>
                		<li>
                			<a href="">
                				<img src="../images/1510208904835.png"> 
                			</a>
                			<div class="txt_area">
                				<h4>오나전 좋아요</h4>
                				<div class="review_short">
                					<span>
                						만족
                						<span> ... 더보기</span>
                					</span>
                					<br/>
                				</div>
                				
                				<div class="review_all">
                					만족<br/>
                					제품 좋아요~ 만족합니다~<br/><br/>
                				</div>
                			</div>
                			<span class="review_name"> dygks </span>
        					<span class="review_date">2018. 06. 21</span>
        					<a href=""><button class="btn_update">수정</button></a>
        					<a href=""><button class="btn_del">삭제</button></a>
                		</li>
                		<li>
                			<a href="">
                				<img src="../images/1510208904835.png"> 
                			</a>
                			<div class="txt_area">
                				<h4>오나전 좋아요</h4>
                				<div class="review_short">
                					<span>
                						만족
                						<span> ... 더보기</span>
                					</span>
                					<br/>
                				</div>
                				
                				<div class="review_all">
                					만족<br/>
                					제품 좋아요~ 만족합니다~<br/><br/>
                				</div>
                			</div>
                			<span class="review_name"> dygks </span>
        					<span class="review_date">2018. 06. 21</span>
        					<a href=""><button class="btn_update">수정</button></a>
        					<a href=""><button class="btn_del">삭제</button></a>
                		</li>
                		<li>
                			<a href="">
                				<img src="../images/1510208904835.png"> 
                			</a>
                			<div class="txt_area">
                				<h4>오나전 좋아요</h4>
                				<div class="review_short">
                					<span>
                						만족
                						<span> ... 더보기</span>
                					</span>
                					<br/>
                				</div>
                				
                				<div class="review_all">
                					만족<br/>
                					제품 좋아요~ 만족합니다~<br/><br/>
                				</div>
                			</div>
                			<span class="review_name"> dygks </span>
        					<span class="review_date">2018. 06. 21</span>
        					<a href=""><button class="btn_update">수정</button></a>
        					<a href=""><button class="btn_del">삭제</button></a>
                		</li>
                	</ul>
                </div>
                
                <div class="list_page">
                    <span><a href="" class="prev">PREVIOUS</a></span>
                    <ol>
                        <li><a href="">1</a></li>
                        <li><a href="">2</a></li>
                        <li><a href="">3</a></li>
                        <li><a href="">4</a></li>
                        <li><a href="">5</a></li>
                    </ol>
                    <span><a href="" class="next">NEXT</a></span>
                </div>
                
                <div class="list_bar">
                    <select name="" id="">
                        <option value="week">일주일</option>
                        <option value="month">한달</option>
                        <option value="month3">세달</option>
                        <option value="all">전체</option>
                    </select>
                    <select name="" id="">
                        <option value="subject">제목</option>
                        <option value="content">내용</option>
                        <option value="writer_name">글쓴이</option>
                        <option value="member_id">아이디</option>
                        <option value="nick_name">별명</option>
                    </select>
                    <input type="text">
                    <a href=""><button class="btn_search">찾기</button></a>
                </div>
                
                <div id="board_btn">
	                <a href=""><button class="btn_list">목록</button></a>
	                <a href=""><button class="btn_write">글쓰기</button></a>
	            </div>
                
            </div>
        </div>
    <!--container.end-->
	
	<!--footer.start-->
	<footer>
	
	<!-- companyInfo -->
	<section id="companyInfo">
          
        <ul>            
            <li>서울특별시 강남구 역삼동 769-8 엠스페이스빌딩, 도로명 주소 ( 서울특별시 강남구 논현로72길 13 M-SPACE 빌딩 해브앤비 )</li>
            <li>고객만족센터 : 1544-5453 ( 운영시간 : 09:00~18:00, 점심시간 : 11:50~12:50)</li>
            <li>사업자 등록번호 : 214-87-63681</li>   
            <li>제2017-서울-0166호 <span><a href="" target="_blank">[사업자정보확인]</a></span></li>
         	<li>Personal Information Manager: <a href="">김요한</a></li>               
        </ul>
		<p class="copyright">© Copyright All rights reserved.</p>
		<p class="siteby">Site by dygks</p>
	</section>
	
	</footer>
	<!--footer.end-->
	
	</div>
<!-- wrap.end -->
</body>
</html>

<script>

$(document).ready(function(){
	// header shadow 보이기
	$(document).scroll(function(){ //스크롤움직일때 실행되는함수
		var scrollTop = $(window).scrollTop();
		if(scrollTop<=0){ 
			$("#header_shadow").css("display", "none");
		}else{
			$("#header_shadow").css("display", "inline");
		}
	});
/* 	
	//로그인, 조인 메뉴 보이기 숨기기
	$(".jl a").mouseover(function(){
        //console.log("aaa");
        $(member_login).css("display","block");
        $(member_login).css("transition","0.6s");
    })
    $("header").mouseleave(function(){
        $(member_login).css("display","none");
        $(member_login).css("transition","0.6s");
    })
	 */
	//게시판 리스트 마우스 오버시 배경색 변환
    $("td.back a").mouseover(function(){
        //console.log("aaa");
        $(this).parent().css("background-color","#eee3ef");
        $(this).parent().css("transition-duration","0.4s");
    })
    $("td.back a").mouseleave(function(){
        $(this).parent().css("background-color","white");
        $(this).parent().css("transition-duration","0.4s");
    });
});
</script>
