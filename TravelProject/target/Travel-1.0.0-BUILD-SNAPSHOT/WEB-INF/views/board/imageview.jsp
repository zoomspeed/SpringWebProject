<%@ page language="java" 
    contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.multi.travel.image.dto.*"%>
<%@page import="com.multi.travel.common.*"%>
 <%@include file="../include/common_main.jsp"%>	
<%@include file="../include/startheader.jsp"%>
<%@include file="../include/viewheader.jsp"%>
<%@include file="../include/mainheader.jsp"%>

<br/><br/><br/><br/>	
<%
ImageDto viewDto = (ImageDto)request.getAttribute("viewDto");
ImageDto prevDto = (ImageDto)request.getAttribute("prevDto");
ImageDto nextDto = (ImageDto)request.getAttribute("nextDto");


%>
<body class="admin" lang="en" >
<form name="mform" id="mform">
	<input type="hidden" name="pg" id="pg"
	     value="${param.pg}">
	<input type="hidden" name="sel" id="sel"
	     value="${param.sel}">
	<input type="hidden" name="key" id="key"
	     value="${param.key}">
	<input type="hidden" name="image_seq" id="image_seq"
	     value="${param.board_seq}">
	<input type="hidden" name="mode" id="mode"
	     value="">
	     
<!------ Include the above in your HEAD tag ---------->
<style>

#user_pic{
max-width:730px; 
max-height:730px;
}
/* body {
    background-image: url("${commonURL}/resources/table_template/images/simple_blue_background-t2.jpg"), url("./pexels-photo-531880.jpeg");

${commonURL}/resources/images/board/def/search_title.gif

}
body {
    background-image: url("${commonURL}/resources/table_template/images/view-image.jpg"), url("./pexels-photo-531880.jpeg");

}  */
</style>
 <div class="container" style="width:100%; height:100%; background-image:url('${commonURL}/resources/table_template/images/purple-gradient.png');">
<%-- <div class="container" style="width:100%; height:100%;""background-image= "url('${commonURL}/resources/table_template/images/simple_blue_background-t2.jpg')"> --%>
      <div class="row">
      <div class="col-md-5  toppad  pull-right col-md-offset-3 ">
           <A href="edit.html" >Edit Profile</A>

        <A href="edit.html" >Logout</A>
       <br>
<p class=" text-info">May 05,2014,03:00 pm </p>
      </div>
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xs-offset-0 col-sm-offset-0  toppad" >
   			<!-- class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" -->
          <div class="panel panel-info">
            <div class="panel-heading">
              <h3 class="panel-title">Sheena Shrestha</h3>
            </div>
            <div class="panel-body">
            
            
              <div class="row">
              <div class="col-md-8 col-lg-8 " align="left"> <img alt="User Pic" id="user_pic" name="user_pic" src="${commonURL}<%=CommonConst.IMAGE_PATH%>/<%=viewDto.getTitle() %>"> </div>
<!-- 여기부분이 사진 프로필 동그랗게 나옴 -->                
<!--
                 <div class="col-md-3 col-lg-3 " align="center"> <img alt="User Pic" src="http://babyinfoforyou.com/wp-content/uploads/2014/10/avatar-300x300.png" class="img-circle img-responsive"> </div>
 -->                
                <!--<div class="col-xs-10 col-sm-10 hidden-md hidden-lg"> <br>
                  <dl>
                    <dt>DEPARTMENT:</dt>
                    <dd>Administrator</dd>
                    <dt>HIRE DATE</dt>
                    <dd>11/12/2013</dd>
                    <dt>DATE OF BIRTH</dt>
                       <dd>11/12/2013</dd>
                    <dt>GENDER</dt>
                    <dd>Male</dd>
                  </dl>
                </div>-->
                <div class=" col-md-4 col-lg-4 " algin="right"> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td>userid:</td>
                        <td><%=viewDto.getUserid() %></td>
                      </tr>
                      <tr>
                        <td>username:</td>
                        <td><%=viewDto.getUsername()%></td>
                      </tr>
                      <tr>
                        <td>title</td>
                        <td><%=viewDto.getTitle()%></td>
                      </tr>
                      <tr>
                        <td>latitude</td>
                        <td><%if(viewDto.getLatitude()==null || viewDto.getLatitude()==""){%>
                        	위치정보가 등록되어 있지 않습니다.
                        	<%}else {
                        	out.println(viewDto.getLatitude());
                        	}%>
                        </td>
                      </tr>
                        <tr>
                        <td>longitude</td>
                        <td><%if(viewDto.getLongitude()==null || viewDto.getLongitude()==""){%>
                        	위치정보가 등록되어 있지 않습니다.
                        	<%}else {
                        	out.println(viewDto.getLongitude());
                        	}%>
                        </td>
                      </tr>
                      <tr>
                        <td>altitude</td>
                        <td><%if(viewDto.getAltitude()==null || viewDto.getAltitude()==""){%>
                        	위치정보가 등록되어 있지 않습니다.
                        	<%}else {
                        	out.println(viewDto.getAltitude());
                        	}%>
                        </td>
                      </tr>
                      <tr>
                        <td>regdate</td>
                        <td><%=viewDto.getRegdate()%></td>
                      </tr>
                      <tr>
                        <td>moddate</td>
                        <td><%=viewDto.getModdate()%></td>
                      </tr> 
                      <tr>
                        <td>filesize</td>
                        <td><%=viewDto.getFilesize()%></td>
                      </tr>                                                                  
                      <tr>
                      <tr>
                        <td>ip_addr</td>
                        <td><%=viewDto.getIp_addr()%></td>
                      </tr>                                                                  
                      <tr>
                      <tr>
                        <td>hit</td>
                        <td><%=viewDto.getHit()%></td>
                      </tr>                                                                  
                      <tr>                                            
                        <td>Email</td>
                        <td><a href="mailto:info@support.com">info@support.com</a></td>
                      </tr>
                        <td>Phone Number</td>
                        <td>123-4567-890(Landline)<br><br>555-4567-890(Mobile)
                        </td>
                           
                      </tr>
                    </tbody>
                  </table>
                  
                  <a href="#" class="btn btn-primary">My Sales Performance</a>
                  <a href="#" class="btn btn-primary">Team Sales Performance</a>
                </div>
              </div>
            </div>
                 <div class="panel-footer">
                        <a data-original-title="Broadcast Message" data-toggle="tooltip" type="button" class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-envelope"></i></a>
                        <span class="pull-right">
                            <a href="edit.html" data-original-title="Edit this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a>
                            <a data-original-title="Remove this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-danger"><i class="glyphicon glyphicon-remove"></i></a>
                        </span>
                    </div>
            
          </div>
        </div>
      </div>
         <br/><br/><br/><br/><br/> 
    </div>
<%@include file="../include/footer.jsp"%>
    
</form>


</body>
</html>

<style>
.user-row {
    margin-bottom: 14px;
}

.user-row:last-child {
    margin-bottom: 0;
}

.dropdown-user {
    margin: 13px 0;
    padding: 5px;
    height: 100%;
}

.dropdown-user:hover {
    cursor: pointer;
}

.table-user-information > tbody > tr {
    border-top: 1px solid rgb(221, 221, 221);
}

.table-user-information > tbody > tr:first-child {
    border-top: 0;
}


.table-user-information > tbody > tr > td {
    border-top: 0;
}
.toppad
{margin-top:20px;
}
</style>

<script>
$(document).ready(function() {
    var panels = $('.user-infos');
    var panelsButton = $('.dropdown-user');
    panels.hide();

    //Click dropdown
    panelsButton.click(function() {
        //get data-for attribute
        var dataFor = $(this).attr('data-for');
        var idFor = $(dataFor);

        //current button
        var currentButton = $(this);
        idFor.slideToggle(400, function() {
            //Completed slidetoggle
            if(idFor.is(':visible'))
            {
                currentButton.html('<i class="glyphicon glyphicon-chevron-up text-muted"></i>');
            }
            else
            {
                currentButton.html('<i class="glyphicon glyphicon-chevron-down text-muted"></i>');
            }
        })
    });


    $('[data-toggle="tooltip"]').tooltip();

    $('button').click(function(e) {
        e.preventDefault();
        alert("This is a demo.\n :-)");
    });
});
</script>