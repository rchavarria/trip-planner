<!DOCTYPE html>
<html>
  <head>
    <title>Google Maps JavaScript API v3 Example: Map Simple</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <style>
      html, body, #map_canvas {
        margin: 0;
        padding: 0;
        height: 100%;
      }
    </style>

    <!-- javascript library jquery -->
    <g:javascript library="jquery" />
    <r:layoutResources/>
    <!-- end javascript library jquery -->
    
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false" type="text/javascript"></script>

    <script type="text/javascript">
      // GMaps js code
      var map;
      function initialize() {
        var mapOptions = {
          zoom: 4,
          center: new google.maps.LatLng(39.83333, -98.583333),
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        map = new google.maps.Map(document.getElementById('map_canvas'),
            mapOptions);
      }
      google.maps.event.addDomListener(window, 'load', initialize);

      // my own js code
      var airportMarkers = [];
      var line = null;

      function addAirport(airport, position) {
        var label = airport.iata + " -- " + airport.name;

        // update airport label in the form
        jQuery("#airport_" + position).html( label );

        if(airportMarkers[position] != null) {
          airportMarkers[position].setMap(null);
        }

        var airportLatLng = new google.maps.LatLng(airport.lat, airport.lng);
        var marker = new google.maps.Marker({
            position: airportLatLng,
            title: label
        });

        if(airport.iata != "NO IATA") {
          airportMarkers[position] = marker;
          marker.setMap(map);
        }

        //
        drawLine();
        showHotelsLink();
      }

      function drawLine() {
        if(line != null) {
          line.setMap( null );
        }

        if(airportMarkers.length == 2) {
          var pathPoints = [ airportMarkers[0].getPosition(), airportMarkers[1].getPosition() ];
          
          line = new google.maps.Polyline({
            path: pathPoints,
            strokeColor: '#FF0000',
            strokeOpacity: 1.0,
            strokeWeight: 2
            });
          line.setMap(map);
        }
      }

      function showHotelsLink() {
        if(airportMarkers[1] != null) {
          var hotels_link = document.getElementById("hotels_link")
          hotels_link.innerHTML = '<a href="#" onclick="loadHotels();">Show Nearby Hotels ...</a>'
        }
      }

      function loadHotels() {
        var url = "${createLink(controller: 'hotelStay', action: 'near')}";
        url += "?lat=" + airportMarkers[1].getPosition().lat();
        url += "&lng=" + airportMarkers[1].getPosition().lng();

        alert("loadHotels: " + url);

        jQuery.ajax( {
          type: 'GET',
          data: jQuery(this).serialize(), 
          url: url,
          success: function(data, textStatus) {
            showHotels(data);
          },
          error: function(XMLHttpRequest, textStatus, errorThrown){
            displayError(XMLHttpRequest);
          }
        });

      }

      function displayError(data) {
        alert("error: " + data);
      }

      function showHotels(data) {
        alert("show hotels: " + data);

        var resultCount = data.ResultSet.totalResultsReturned;

        var html = "<ul>";
        for(var i = 0; i < resultCount; i++) {
          html += "<li>" + data.ResultSet.Result[i].Title + "<br/>";
          html += "Distance: " + data.ResultSet.Result[i].Distance + "<br/>";
          html += "<hr/>";
          html += "</li>";
        }
        html += "</ul>";

        var hotels = document.getElementById("hotels");
        hotels.innerHTML = html;
      }
    </script>

  </head>
  <body>

    <div class="body">

      <div id="search" style="width: 25%; float: left">
        <h1>Where to?</h1>

        <g:formRemote name="from_form"
                      url="[controller: 'airport', action: 'iata']"
                      update="airport_0"
                      onSuccess="addAirport(data, 0);">
          From: <br/>
          <input type="text" name="id" size="3" />
          <input type="submit" value="Search" />
        </g:formRemote>
        <div id="airport_0"></div>

        <g:formRemote name="to_form"
                      url="[controller: 'airport', action: 'iata']"
                      update="airport_1"
                      onSuccess="addAirport(data, 1);">
          To: <br/>
          <input type="text" name="id" size="3" />
          <input type="submit" value="Search" />
        </g:formRemote>
        <div id="airport_1"></div>

        <div id="hotels_link"></div>
        <div id="hotels"></div>
      </div>

    </div>

    <div id="map_canvas" style="width: 75%; height: 100%; float: right"></div>

  </body>
</html>
