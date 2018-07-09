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




		<div class="fh5co-hero">
			<div class="fh5co-overlay"></div>
			<div class="fh5co-cover text-center" data-stellar-background-ratio="0.5" style="background-image: url(images/cover_bg_1.jpg);">
				<div class="desc animate-box">
					<h2>Listing of Places</h2>
					<span><a class="btn btn-primary btn-lg" href="#">Get Started</a></span>
				</div>
			</div>

		</div>


		<div class="fh5co-listing">
			<div class="container">
				<div class="row">
				
				
				
				<form id="mform" name="mform"> 
					<label for="sel" class="desc">실시간 업로드 사진</label>
					<!-- <button id="Ggg" name="Ggg" value="ddd" onclick="go_AlbumList()"> -->
<%-- 					
					<select id="sel" name="sel" class="btn btn-primary btn-lg">
						<option value="date" <%if(sel.equals("date")){%>selected<%}%>" onclick="go_AlbumList()">날짜순</option>
						<option value="title" <%if(sel.equals("title")){%>selected<%}%>" onclick="go_AlbumList()">제목순</option>
						<option value="hit" <%if(sel.equals("hit")){%>selected<%}%>" onclick="go_AlbumList()">조회순</option>
					</select>
					 --%>
		
					 <br/><br/><br/><br/><br/><br/>
			 
					 					<input type="text" id="sel" name="sel" value=""/>
					<input type="button" onclick="go_AlbumList('date')"   value="날짜순"/>
					<input type="text" onclick="go_AlbumList('title')" value="제목순"/>
					<input type="text" onclick="go_AlbumList('hit')" value="조회순"/>
					<!-- <input type="hidden" name="num"  value="6"/>	 -->			
				
					<br/><br/><br/>
				
				
	<% 
		List<String> ImageList =(ArrayList<String>)request.getAttribute("ImageList");
	%>
	
			<%for(int i=0; i<ImageList.size(); i++){ %>
				
					<div class="col-md-4 fh5co-item-wrap">
						<a class="fh5co-listing-item">
							<img id="ImageSrc<%=(i+1)%>" name="ImageSrcs" src="${commonURL}/upload/image/<%=ImageList.get(i)%>" alt="Free HTML5 Bootstrap Template by FreeHTML5.co" class="img-responsive">
							<div class="fh5co-listing-copy">
								<h2 id="h<%=(i+1)%>" name="h<%=(i+1)%>"><%=ImageList.get(i) %></h2>
								<span class="icon">
									<i class="icon-chevron-right"></i>
								</span>
							</div>
						</a>
					</div>
				
			<%} %>
				</form>
					<!-- END 3 row -->

				</div>
			</div>
		</div>


		
	<%@include file="../include/footer2.jsp"%>
	


<!-- 
	</div>
	END fh5co-page

	</div>
	END fh5co-wrapper
 -->
	</body>
</html>





<script>
function go_AlbumList(recvData)
{

	//var sel = document.getElementById('sel').value;
	$('#sel').val(recvData);
	var sel = recvData;
	console.log(sel);
	var data = {}
/* 	data["name"] = $('#name').val(); */
	//data["name"] = "aa";
/* 	data["location"] = $('#location').val();
	data["sel"] = sel;
	console.log(JSON.stringify(data)); */

  
 	$.ajax({
 		contentType:'application/json; charset=utf-8',
		url:"${commonURL}/ImageList.do",
		//data:{"sel":sel},
		//data:JSON.stringify(data),
		//data:JSON.stringify({"name":"kim","location":"seoul","title":"aaa"}),
		data:JSON.stringify({"sel":sel,"mod":"album"}),
		dataType:'json',
		type:'POST',
		success:function(data){
			alert("조회가 완료 되었습니다.");
			
			console.log(data);
			changeImage(data);
 
			//console.log(data.ImageList1);
			//console.log(data.ImageList2);
			
		},
		error:function(request,status,error){
			alert(error);
			alert(status);
			alert(request.message);
			//alert("조회 실패");
		}
	});	
	  
	//$("#mform").submit();
}


 function changeImage(data){
	

		<%
			for(int i=0; i<ImageList.size(); i++){
		%>	
				var imageSrc = '#ImageSrc'+<%=(i+1)%>;
				var h = '#h'+<%=(i+1)%>;
				var image = eval('data.ImageList'+<%=(i+1)%>);
				//console.log(h);
				//console.log(image);
				$(h).html(image);
				$(imageSrc).attr("src","${commonURL}/upload/image/"+image); 
				console.log($(imageSrc).html());
				console.log($(h).html(image));
		<%		
			}
		%>
		
		//$("#ImageSrc").attr("src","${commonURL}/upload/image/"+ImageList1);
		
} 
</script>
