<%@ page language="java" 
    contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="../include/common_main.jsp"%>  
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>jQuery Ajax File Uploader Widget</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">

    <!-- Custom styles -->
    <link href="${commonURL}/resources/uploader-master/dist/css/jquery.dm-uploader.min.css" rel="stylesheet">
    <link href="${commonURL}/resources/uploader-master/demo/styles.css" rel="stylesheet">
  </head>

  <body>
<form name="mform" id="mform" method="post" enctype="multipart/form-data">  

<input type="text" name="userid" id="userid" value="${userid }"/>
    <main role="main" class="container">

      <h1>jQuery Ajax File Uploader Widget</h1>
      <p class="lead mb-4">
        A very lightweight Plugin for file uploading using ajax(async) and includes support for queues, progress tracking and drag and drop.
        This page demostrates the default basic setup/config.
      </p>

      <div class="row">
        <div class="col-md-6 col-sm-12">
          
          <!-- Our markup, the important part here! -->
          <div id="drag-and-drop-zone" class="dm-uploader p-5">
            <h3 class="mb-5 mt-5 text-muted">Drag &amp; drop files here</h3>

            <div class="btn btn-primary btn-block mb-5">
                <span>Open the file Browser</span>
                 <input type="file" name="file" id="file" title='Click to add Files'/>
            </div>
          </div><!-- /uploader -->
          
          
          
        <!-- <input type="text" name="userid" id="userid" value="${userid }"/>  -->  
		<!-- <button type="text" name="btnWrite" id="btnWrite">전송하기</button> -->
		
		
		
		
        </div>
        <div class="col-md-6 col-sm-12">
          <div class="card h-100">
            <div class="card-header">
              File List
            </div>

            <ul class="list-unstyled p-2 d-flex flex-column col" id="files">
              <li class="text-muted text-center empty">No files uploaded.</li>
            </ul>
          </div>
        </div>
      </div><!-- /file list -->

      <div class="alert alert-info" role="alert">
        More setup demos on: <a href="https://danielmg.org/demo/java-script/uploader/basic">https://danielmg.org/demo/java-script/uploader/basic</a>
      </div>

      <div class="row">
        <div class="col-12">
           <div class="card h-100">
            <div class="card-header">
              Debug Messages
            </div>

            <ul class="list-group list-group-flush" id="debug">
              <li class="list-group-item text-muted empty">Loading plugin....</li>
            </ul>
          </div>
        </div>
      </div> <!-- /debug -->

    </main> <!-- /container -->

    <footer class="text-center">
        <p>&copy; Daniel Morales &middot; <a href="https://www.danielmg.org">www.danielmg.org</a></p>
    </footer>

    <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js" integrity="sha384-a5N7Y/aK3qNeh15eJKGWxsqtnX/wWdSZSKp+81YjTmS15nvnvxKHuzaWwXHDli+4" crossorigin="anonymous"></script>

    <script src="${commonURL}/resources/uploader-master/dist/js/jquery.dm-uploader.min.js"></script>
    <script src="${commonURL}/resources/uploader-master/demo/demo-ui.js"></script>
    <script src="${commonURL}/resources/uploader-master/demo/demo-config.js"></script>

    <!-- File item template -->
    <script type="text/html" id="files-template">
      <li class="media">
		
        <div class="media-body mb-1">
          <p class="mb-2">
            <strong>%%filename%%</strong> - Status: <span class="text-muted">Waiting</span>
          </p>
          <div class="progress mb-2">
            <div class="progress-bar progress-bar-striped progress-bar-animated bg-primary" 
              role="progressbar"
              style="width: 0%" 
              aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
            </div>
          </div>
          <hr class="mt-1 mb-1" />
        </div>
      </li>
    </script>

    <!-- Debug item template -->
    <script type="text/html" id="debug-template">
      <li class="list-group-item text-%%color%%"><strong>%%date%%</strong>: %%message%%</li>
    </script>
    
    
 <script>
 
	$(document).ready(function(){
		
		$("#btnWrite").click(function(event){
			//에러체크 (제목, 내용, 아이디)
			
			event.preventDefault();
			//데이타 전송하기 위해서 form에 있는
			//모든 값들을 parameter 화한다 
			var form = $("#mform")[0];
			
			var formData = new FormData(form);
			
			//alert(form.attachFile);
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
			console.log(formData.getAll("file").length);
			//return false;
			
			//파일의 경우 반드시 추가로 뭔가를 해줘야 한다 
						     
			var url="${commonURL}/image/save.do";
		    console.log(url);
		    alert(url);
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
						alert('사진이 등록되었습니다');
					
					//location.href="<%=commonURL%>/board/albumbbs.do";
				},
				error:function(request, status, error){
					//서버호출 실패시 
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					//console.log(status);
					//console.log(request);
					//console.log(error);
					alert("파일 용량이 너무 커서 못올립니다");
					
				}
			});
			
			
		});
	});
 </script>  
    
  </body>
</form>  
</html>
