<%@ page language="java" 
    contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.*"%>    
<%@page import="com.multi.travel.common.*"%>
<%@include file="../include/common4.jsp"%>

	<%@include file="../include/header2.jsp"%>

<%
sel="title";
if(request.getParameter("sel")!=null)
	sel = request.getParameter("sel");
%>

		<div id="fh5co-wrapper">
		<div id="fh5co-page">

		<div>  

		 
		</div>		
		
		<div class="fh5co-hero">
			<div class="fh5co-overlay"></div>
			<div class="fh5co-cover text-center" data-stellar-background-ratio="0.5" style="background-image: url(images/cover_bg_1.jpg);">
				<div class="desc animate-box">
					<h2>Travel Around The World.</h2>
					<!-- <span>Lovely Crafted by <a href="http://frehtml5.co/" target="_blank" class="fh5co-site-name">FREEHTML5.co</a></span> -->
					<span><a class="btn btn-primary btn-lg" href="/travel/board/list.do">Get Started</a></span>
				</div>
			</div>

		</div>
		
		
		
	
		

	<% 
		List<String> ImageList =(ArrayList<String>)request.getAttribute("ImageList");
	%>

			

		<div class="fh5co-listing">
			<div class="container">
				<div class="row">
				
 		<!-- <div class="fh5co-hero"> -->		
		<!-- <div class="fh5co-overlay"></div>  -->		
		<!-- <div class="fh5co-cover" > -->
		<!-- <form id="mform" name="mform"> -->
			<div class="desc animate-box fh5co-overlay">
					&nbsp;&nbsp;&nbsp;
					<form id="mform" name="mform">
					
					<label for="sel" class="desc">실시간 업로드 사진</label>
					<!-- <button id="Ggg" name="Ggg" value="ddd" onclick="go_AlbumList()"> -->
					<select id="sel" name="sel" class="btn btn-primary btn-lg">
						<option value="date" <%if(sel.equals("date")){%>selected<%}%>">날짜순</option>
						<option value="title" <%if(sel.equals("title")){%>selected<%}%>">제목순</option>
						<option value="hit" <%if(sel.equals("hit")){%>selected<%}%>">조회순</option>
					</select>
					<input type="button" id="b" name="b" value="bsww"onclick="go_AlbumList3()">
					<input type="text" name="name" value="aa">
					<input type="text" name="location" value="aa">
					</form>
			</div>
		<!-- </form> -->	
		<!--  </div> -->
		<!--  </div>  -->
				<br/><br/><br/><br/><br/>
				
				<%for(int i=0; i<ImageList.size(); i++){ %>
					<div class="col-md-4 col-sm-4 fh5co-item-wrap">
						<a class="fh5co-listing-item">
							<!-- 
							<img src="${commonURL}/upload/image/<%=ImageList.get(i)%>" alt="Free HTML5 Bootstrap Template by FreeHTML5.co" class="img-responsive" style="width: 100%; height: 100%;">
							 -->
							 
							<img src="${commonURL}/upload/image/<%=ImageList.get(i)%>" alt="Free HTML5 Bootstrap Template by FreeHTML5.co" class="img-responsive" style="width: 700px; height: 282px;">
							
							<div class="fh5co-listing-copy">
								<h2><%=ImageList.get(i) %></h2>
								<span class="icon">
									<i class="icon-chevron-right"></i>
								</span>
							</div>
						</a>
					</div>
				<% } %>

				</div>
			</div>
		</div>


		<div class="fh5co-section">
			<div class="container">
				<div class="row">
					<div class="col-md-6 fh5co-news">
						<h3>News</h3>
						<ul>
							<li>
								<a href="#">
									<span class="fh5co-date">Sep. 10, 2016</span>
									<h3>Newly done Bridge of London</h3>
									<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusamus reprehenderit!</p>
								</a>
							</li>
							<li>
								<a href="#">
									<span class="fh5co-date">Sep. 10, 2016</span>
									<h3>Newly done Bridge of London</h3>
									<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusamus reprehenderit!</p>
								</a>
							</li>
							<li>
								<a href="#">
									<span class="fh5co-date">Sep. 10, 2016</span>
									<h3>Newly done Bridge of London</h3>
									<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusamus reprehenderit!</p>
								</a>
							</li>
						</ul>
					</div>
					<div class="col-md-6 fh5co-testimonial">
						<img src="${commonURL}/resources/template/images/cover_bg_1.jpg" alt="Free HTML5 Bootstrap Template by FreeHTML5.co" class="img-responsive mb20">
						<img src="${commonURL}/resources/template/images/cover_bg_1.jpg" alt="Free HTML5 Bootstrap Template by FreeHTML5.co" class="img-responsive">
					</div>
				</div>
			</div>
		</div>
		
	<%@include file="../include/footer2.jsp"%>
	

	</div>
	<!-- END fh5co-page -->

	</div>
	<!-- END fh5co-wrapper -->

	</body>
</html>

<script>
function go_AlbumList()
{
	
	
	var sel = document.getElementById('sel').value;
	$("#b").val(sel);
	
	var data ={}
	data["sel"] = $('#sel').val();
	console.log(sel);
	
	var url="${commonURL}/home.do";
	//URLEncoder.encoding(param, "UTF-8");
//?sel="+encodeURI(sel)
	
 	$.ajax({
 		contentType:'appication/json',
		url:url,
		//data:{"sel":sel},
		data:JSON.stringify(data),
		dataType:'json',
		Type:'post',
		success:function(data){
			alert("조회가 완료 되었습니다.");
			//var data = JSON.parse(obj);

			console.log(data.message);

			//alert(data.id);
					
 
			//console.log(data);
			//현재 페이지 새로 고침하기 
			//location.reload();
		},
		error:function(request,status,error){
			alert(error);
			alert(request.message);
			//alert("조회 실패");
		}
	});	
	  
	//$("#mform").submit();
	
}


function go_AlbumList1()
{
	
	
	var sel = document.getElementById('sel').value;
	console.log(sel);
	
	var url="${commonURL}/ImageList1.do";

	
 	$.ajax({
 		contentType:'appication/json; charset=UTF-8',
		url:url,
		//data:{"sel":sel},
		data:{ "name": "John", "location": "Boston" },
		dataType:'json',
		type:'post',
		success:function(data){
			alert("조회가 완료 되었습니다.");
			
			console.log(data);
		},
		error:function(request,status,error){
			alert(error);
			alert(request.message);
			//alert("조회 실패");
		}
	});	
	  
	//$("#mform").submit();
	
}


function go_AlbumList2()
{

	var sel = document.getElementById('sel').value;
	
	var data = {}
	data["name"] = $('#name').val();
	data["location"] = $('#location').val();
	console.log(JSON.stringify(data));
	
	var url="${commonURL}/ImageList2.do";

 	$.ajax({
 		contentType:'appication/json',
		url:url,
		//data:{"sel":sel},
		data:JSON.stringify(data),
		dataType:'json',
		type:'post',
		success:function(data){
			alert("조회가 완료 되었습니다.");
			
			console.log(data);
		},
		error:function(request,status,error){
			alert(error);
			alert(request.message);
			//alert("조회 실패");
		}
	});	
	  
	//$("#mform").submit();
}

function go_AlbumList3()
{

	var sel = document.getElementById('sel').value;
	
	var data = {}
	data["name"] = $('#name').val();
	data["location"] = $('#location').val();
	console.log(JSON.stringify(data));
	
	var url="${commonURL}/ImageList3.do";

 	$.ajax({
 		contentType:'appication/json; charset=UTF-8',
		url:url,
		//data:{"sel":sel},
		data:JSON.stringify(data),
		dataType:'json',
		type:'post',
		success:function(data){
			alert("조회가 완료 되었습니다.");
			
			//console.log(data.message);
			console.log(data);
		},
		error:function(request,status,error){
			alert(error);
			alert(request.message);
			//alert("조회 실패");
		}
	});	
	  
	//$("#mform").submit();
}
</script>
