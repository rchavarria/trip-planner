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
      </div>

    </div>

    <div id="map_canvas" style="width: 75%; height: 100%; float: right"></div>

  </body>
</html>
