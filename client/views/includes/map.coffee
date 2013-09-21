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

		Session.set 'tmp-latLong', event.latLng
		console.log Session.get 'tmp-latLong'
		fragment = Meteor.render( ->
			tmp = Template["incidentNew"]() # this calls the template and returns the HTML.
		)
		document.body.appendChild(fragment);
		$('#myModal').modal()


		#placeMarker(event.latLng, console.log('point added to db') )

	placeMarker = (point, callback) ->
		marker = new google.maps.Marker(
			position: point
		)
		incidentId = Incidents.insert({ lat: point.lat(), long: point.lng() });
		marker.setMap(map)
		

	centerMarker = (map,point) ->
		 map.setCenter(point)
