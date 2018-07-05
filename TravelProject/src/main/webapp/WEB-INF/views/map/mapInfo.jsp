<%@ page language="java" 
    contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.*"%>    
<%@page import="com.multi.travel.common.*"%>
<%@include file="../include/common4.jsp"%>

<!-- 
https://console.cloud.google.com/home/dashboard?consoleReturnUrl=https:%2F%2Fcloud.google.com%2Fmaps-platform%2Fpricing%2F%3Fhl%3Dko&consoleUI=CLOUD&hl=ko&mods=metropolis_maps&project=travelproject-1530758275468

api key
	AIzaSyDDSFJk-gBENhgfxPZ5I8BLrdMcYJdJP2c
 -->



	<%@include file="../include/header2.jsp"%>

    <!-- This stylesheet contains specific styles for displaying
         the map on this page. Replace it with your own styles as
         described in the documentation:
         https://developers.google.com/maps/documentation/javascript/tutorial
    -->
    <!-- 
    <link rel="stylesheet" href="/maps/documentation/javascript/cgc/demos.css">
	 -->

  <br/><br/><br/><br/>
    <div id="map"></div>
    <script>
      function initMap() {
        //var myLatLng = {lat: -25.363, lng: 131.044};
        //47° 24' 1.8" N
        //12° 39' 5.4" E
        var myLatLng = {lat: "47° 24' 1.8\" N", lng: "12° 39' 5.4\" E"};
        // Create a map object and specify the DOM element
        // for display.
        var map = new google.maps.Map(document.getElementById('map'), {
          center: myLatLng,
          zoom: 6
        });

        // Create a marker and set its position.
        var marker = new google.maps.Marker({
          map: map,
          position: myLatLng,
          title: 'Hello World!'
        });
      }

    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDDSFJk-gBENhgfxPZ5I8BLrdMcYJdJP2c&callback=initMap"
        async defer></script>
        	<%@include file="../include/footer2.jsp"%>
  </body>
</html>


