<%@ page language="java" 
    contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.*"%>    
<%@page import="com.multi.travel.common.*"%>
<%@include file="../include/common_main.jsp"%>
<%@include file="../include/startheader.jsp"%>
<%@include file="../include/animateheader.jsp"%>
<%@include file="../include/mainheader.jsp"%>



    
<!-- AIzaSyDDSFJk-gBENhgfxPZ5I8BLrdMcYJdJP2c
 -->
    <div id="map"></div>
    <div id="right-panel">
      <h2>Results</h2>
      <ul id="places"></ul>
      <div id="markup"></div>
      <button id="more">More results</button>
    </div>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDDSFJk-gBENhgfxPZ5I8BLrdMcYJdJP2c&libraries=places&callback=initMap" async defer></script>
  </body>
</html>


<style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #right-panel {
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }

      #right-panel select, #right-panel input {
        font-size: 15px;
      }

      #right-panel select {
        width: 100%;
      }

      #right-panel i {
        font-size: 12px;
      }
      #right-panel {
        font-family: Arial, Helvetica, sans-serif;
        position: absolute;
        right: 5px;
        top: 60%;
        margin-top: -195px;
        height: 330px;
        width: 200px;
        padding: 5px;
        z-index: 5;
        border: 1px solid #999;
        background: #fff;
      }

      ul {
        list-style-type: none;
        padding: 0;
        margin: 0;
        height: 271px;
        width: 200px;
        overflow-y: scroll;
      }
      li {
        background-color: #f1f1f1;
        padding: 10px;
        text-overflow: ellipsis;
        white-space: nowrap;
        overflow: hidden;
      }
      li:nth-child(odd) {
        background-color: #fcfcfc;
      }
      #more {
        width: 100%;
        margin: 5px 0 0 0;
      }
    </style>
    <script>
      // This example requires the Places library. Include the libraries=places
      // parameter when you first load the API. For example:
      // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

      
      var map;

      function initMap() {
    	  
    	  

    	  
    	  
    	//var myLatLng = {lat: 39.74633333333333, lng: -105.02483333333333};  
    	  
        // Create the map.
        //var pyrmont = {lat: -33.866, lng: 151.196};
        var myLatLng = {lat: -33.866, lng: 151.196};
        map = new google.maps.Map(document.getElementById('map'), {
          center: myLatLng,
          //center: pyrmont,
          zoom: 17
        });
        
/*     	  google.maps.event.addListener(map, 'click', function(event) {
  		    addMarker(event.latLng, map);
  		  });      */

        // Create the places service.
        var service = new google.maps.places.PlacesService(map);
        var getNextPage = null;
        var moreButton = document.getElementById('more');
        moreButton.onclick = function() {
          moreButton.disabled = true;
          if (getNextPage) getNextPage();
        };

        // Perform a nearby search.
        service.nearbySearch(
            //{location: pyrmont, radius: 500, type: ['store']},
            {location: myLatLng, radius: 500, type: ['store']},
            function(results, status, pagination) {
              if (status !== 'OK') return;

              createMarkers(results);
              moreButton.disabled = !pagination.hasNextPage;
              getNextPage = pagination.hasNextPage && function() {
                pagination.nextPage();
              };
            });
        
/*         var marker = new google.maps.Marker({
            map: map,
            title: place.name,
            position: myLatLng
            //position: myLatLng
          }); */
          
          
     
      }

      function createMarkers(places) {
        var bounds = new google.maps.LatLngBounds();
        var placesList = document.getElementById('places');
        var markup1 = document.getElementById('markup');

        for (var i = 0, place; place = places[i]; i++) {
          var image = {
            url: place.icon,
            size: new google.maps.Size(71, 71),
            origin: new google.maps.Point(0, 0),
            anchor: new google.maps.Point(17, 34),
            scaledSize: new google.maps.Size(25, 25)
          };

          var marker = new google.maps.Marker({
            map: map,
            icon: image,
            title: place.name,
            position: place.geometry.location
            //position: myLatLng
          });

          var li = document.createElement('li');
          li.textContent = place.name;
          placesList.appendChild(li);
			
          bounds.extend(place.geometry.location);
        }

        map.fitBounds(bounds);
      }
    </script>