Template.map.rendered = ->
	point = new google.maps.LatLng 0, 0
	unless Meteor.user() is undefined or null
		userProfile=
			location: 'Basel'
			address: ''
	else
		userProfile = Meteor.user().profile

	mapOptions =
		zoom: 14
		center: point
		disableDoubleClickZoom: true

	window.map = new google.maps.Map( document.getElementById('map-canvas'), mapOptions )
	geocoder = new google.maps.Geocoder()
	geocoder.geocode
		address: userProfile.location
	, 	(results, status) ->
		if status is google.maps.GeocoderStatus.OK
			if results[0].types[0] is 'country'
				zoom = 8
			else if results[0].types[0] is 'locality'
				zoom = 15
			window.map.setCenter results[0].geometry.location
			window.map.setZoom zoom

	Incidents.find().forEach (incident) ->		
		point = new google.maps.LatLng(incident.lat, incident.lng)
		marker = new google.maps.Marker(
			position: point
		)
		marker.setMap(map)
		#
		addClickEventListener(marker)
		

	google.maps.event.addListener map, "dblclick", (event) ->
		Session.set 'tmp-lat', event.latLng.lat()
		Session.set 'tmp-lng', event.latLng.lng()
		fragment = Meteor.render( ->
			tmp = Template["incidentNew"]() # this calls the template and returns the HTML.
		)
		document.body.appendChild(fragment);
		$('#myModal').modal()
		


@addClickEventListener = (marker) ->
	google.maps.event.addListener marker, "click", (event) ->
		lat = event.latLng.lat()
		lng = event.latLng.lng()

		mapIncident = Incidents.findOne( lat:lat, lng:lng )
		Session.set 'currentIncidentId', mapIncident._id
		point = new google.maps.LatLng(lat, lng)
		window.map.panTo(point)


# Template.map_detail.helpers
# 	incident: -> 
# 		Incidents.findOne( Session.get 'currentIncidentId' )

Template.map_detail.rendered = ->
	# incident = Incidents.findOne( Session.get 'currentIncidentId' )
	# point = new google.maps.LatLng(incident.lat, incident.lng)
	# mapOptions =
	# 	zoom: 10
	# 	center: point
	# window.map = new google.maps.Map( document.getElementById('map-canvas'), mapOptions )
	# marker = new google.maps.Marker(
	# 		position: point
	# 	)
	# marker.setMap(map)
