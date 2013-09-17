Template.map.rendered = ->
	point = new google.maps.LatLng 14.1222, 12.111
	mapOptions =
		zoom: 4
		center: point

	map = new google.maps.Map( document.getElementById('map-canvas'), mapOptions )

	Incidents.find().forEach (incident) ->		
		console.log point
		point = new google.maps.LatLng(incident.lat, incident.long)
		marker = new google.maps.Marker(
			position: point
		)
		marker.setMap(map)

	google.maps.event.addListener map, "dblclick", (event) ->
		placeMarker(event.latLng, console.log('point added to db') )

	placeMarker = (point, callback) ->
		marker = new google.maps.Marker(
			position: point
		)
		incidentId = Incidents.insert({ lat: point.lat(), long: point.lng() });
		marker.setMap(map)
