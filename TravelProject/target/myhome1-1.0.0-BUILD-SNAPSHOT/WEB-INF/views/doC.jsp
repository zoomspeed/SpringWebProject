<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<%
request.setAttribute("name", "Jane");
request.setAttribute("age", 23);
request.setAttribute("address", "Seoul");
%>
<body>
표현식 : ${msg}<br>
${x}+${y}=${x+y}<br>
${x}-${y}=${x-y}<br>
${x}*${y}=${x*y}<br>
${x}/${y}=${x/y}<br>

이름 : ${name}<br>
나이 : ${age}<br>
주소 : ${address}<br>

<!--  request.getParameter("x") -->
파라미터1 : ${param.x}<br>
파라미터2 : ${param.y}<br>
파라미터3 : ${param.msg}<br>

<!-- 파라미터가 배열로 전달될때  -->
${paramValues.name[0]}<br>
${paramValues.name[1]}<br>

</body>
</html>


