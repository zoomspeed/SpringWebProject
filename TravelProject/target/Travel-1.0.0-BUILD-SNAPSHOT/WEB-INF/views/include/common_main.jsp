<%@ page language="java" 
    contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%

request.setAttribute("title", "travel");
request.setAttribute("commonURL", request.getContextPath());
String commonURL=request.getContextPath();
String pg="0";
if(request.getParameter("pg")!=null)
	pg = request.getParameter("pg");
String sel="all";
if(request.getParameter("sel")!=null)
	sel = request.getParameter("sel");
String key="";
if(request.getParameter("key")!=null)
	key = request.getParameter("key");

%>

<%String basePath = request.getRealPath("/"); %>	
<%
//System.out.println("getContextPath:~~~ "+request.getContextPath());
//System.out.println("getClientIp   "+request.getLocalAddr());
%>

















