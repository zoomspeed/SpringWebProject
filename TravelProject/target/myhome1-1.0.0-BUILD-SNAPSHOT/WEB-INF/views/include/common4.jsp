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


















