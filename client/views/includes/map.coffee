Template.map.rendered = ->
	point = new google.maps.LatLng 14.1222, 12.111
	mapOptions =
		zoom: 4
		center: point

	window.map = new google.maps.Map( document.getElementById('map-canvas'), mapOptions )

	Incidents.find().forEach (incident) ->		
		point = new google.maps.LatLng(incident.lat, incident.long)
		marker = new google.maps.Marker(
			position: point
		)
		marker.setMap(map)
		

	google.maps.event.addListener map, "dblclick", (event) ->
		Session.set 'tmp-lat', event.latLng.lat()
		Session.set 'tmp-lng', event.latLng.lng()
		fragment = Meteor.render( ->
			tmp = Template["incidentNew"]() # this calls the template and returns the HTML.
		)
		document.body.appendChild(fragment);
		$('#myModal').modal()
		

	centerMarker = (map,point) ->
		 map.setCenter(point)
