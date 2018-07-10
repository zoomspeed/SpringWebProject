<%@ page language="java" 
    contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%
request.setAttribute("title", "travel");
request.setAttribute("commonURL", "/travel");
String commonURL="/travel";
String pg="0";
if(request.getParameter("pg")!=null)
	pg = request.getParameter("pg");
%>
<%=request.getRealPath("/") %>


<!DOCTYPE html">
<html>
<head>
<meta charset="utf-8">
<title>${title}</title>
	<meta http-equiv="Content-Script-Type" content="text/javascript" />
	<meta http-equiv="Content-Style-Type" content="text/css" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<link href="${commonURL}/resources/css/admin.css" rel="stylesheet" type="text/css" />
	
	<script src="${commonURL}/resources/ckeditor/ckeditor.js"></script>
	<script src="${commonURL}/resources/ckeditor/samples/js/sample.js"></script>
	<link rel="stylesheet" 
	    href="${commonURL}/resources/ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css">
	<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
	
	
	<!--  프로필 템플릿 시작 -->
	<%@include file="../include/viewheader.jsp"%>
	<!-- 프로필 템플릿 종료 -->
</head>
