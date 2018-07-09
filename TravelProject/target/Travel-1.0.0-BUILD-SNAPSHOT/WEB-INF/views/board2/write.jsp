<%@ page language="java" 
    contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
  
<%@include file="../include/common.jsp"%>


<body class="admin" lang="en">


<!-- site align S -->
<div class="sa">

	<%@include file="../include/header.jsp"%>

	<%@include file="../include/left.jsp"%>
	

	<!-- section S -->
	<div id="section">

		<div id="pagetitle">

			<h2>관리자 모드</h2>


		</div>

		<div id="content">

			<h3>관리자 쓰기</h3>

			<!-- bbs default write S -->
			<table cellspacing="0" summary="[프로그램 입력] 글쓰기 입력 양식입니다." class="bdw">
				<caption>글쓰기 입력 양식</caption>
				<colgroup><col width="125" /><col width="*" /></colgroup>
				<tbody>
					<tr>
						<th scope="row" class="first"><label for="title">제목</label></th>
						<td class="last"><input type="text" id="title" name="title" size="70" /></td>
					</tr>
					<tr>
						<th scope="row" class="first"><label for="userid">작성자</label></th>
						<td class="last">
							<input type="hidden" id="member_id" name="member_id" size="70" 
						         value="${member_id}"/> 
						    ${username}
						</td>
					</tr>

					<tr>
						<th scope="row" class="first"><label for="memo">내용</label></th>
						<td class="last"><textarea id="editor" name="contents" rows="10"></textarea></td>
					</tr>
					<tr>
						<th scope="row" class="first"><label for="atchfile">첨부파일</label></th>
						<td class="last"><input type="file" id="atchfile" name="atchfile" size="50" class="atchfile" /></td>
					</tr>
				</tbody>
			</table>
			<!-- bbs default write E -->

			<!-- bbs footer S -->
			<div class="bft">

				<div class="bb">
					<ul>
						<li><a href="#">취소</a></li>
						<li class="inputBtn"><input type="submit" value="확인" /></li>
					</ul>
				</div>

			</div>
			<!-- bbs footer E -->

			

		</div>
		<!-- content E -->

	</div>
	<!-- section E -->

	<%@include file="../include/footer.jsp"%>

</div>
<!-- site align E -->


</body>
</html>

<script>
initSample();

</script>




