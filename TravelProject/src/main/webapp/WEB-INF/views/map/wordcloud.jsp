<%@ page language="java" 
    contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.*"%>    
<%@page import="com.multi.travel.common.*"%>
<%@include file="../include/common_main.jsp"%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Listing &mdash; 100% Free Fully Responsive HTML5 Template by FREEHTML5.co</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	<meta name="author" content="FREEHTML5.CO" />
	
	
    <script src="${commonURL}/resources/d3-wordcloud-master/lib/d3/d3.js"></script>
    <script src="${commonURL}/resources/d3-wordcloud-master/lib/d3/d3.layout.cloud.js"></script>
    <script src="${commonURL}/resources/d3-wordcloud-master/d3.wordcloud.js"></script>
    <script src="${commonURL}/resources/d3-wordcloud-master/example/example.words.js"></script>
	
	
    <title>Word Cloud</title>
  </head>
  <body style="text-align: center">
    <h1>Word Cloud</h1>
    <div id='wordcloud'></div>
    <p>This is a word cloud of the first two chapters of Oliver Twist. Some words are clickable.</p>
    <p><a href="https://github.com/wvengen/d3-wordcloud">https://github.com/wvengen/d3-wordcloud</a></p>
    <script>
      d3.wordcloud()
        .size([500, 300])
        .fill(d3.scale.ordinal().range(["#884400", "#448800", "#888800", "#444400"]))
        .words(words)
        .onwordclick(function(d, i) {
          if (d.href) { window.location = d.href; }
        })
        .start();
    </script>
  </body>
</html>

