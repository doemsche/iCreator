Template.map.rendered = ->
	point = new google.maps.LatLng 0, 0
	user = Meteor.user()
	if user is null 
		user = {area: 'Zurich'}

	mapOptions =
		zoom: 14
		center: point

	window.map = new google.maps.Map( document.getElementById('map-canvas'), mapOptions )
	geocoder = new google.maps.Geocoder()
	geocoder.geocode
		address: user.area
	, 	(results, status) ->
		if status is google.maps.GeocoderStatus.OK
			console.log 'set map to address' + user.area
			window.map.setCenter results[0].geometry.location
		else
			console.log 'no result'

	Incidents.find().forEach (incident) ->		
		point = new google.maps.LatLng(incident.lat, incident.lng)
		marker = new google.maps.Marker(
			position: point
		)
		marker.setMap(map)
		#
		addDblClickEventListener(marker)
		

	google.maps.event.addListener map, "dblclick", (event) ->
		Session.set 'tmp-lat', event.latLng.lat()
		Session.set 'tmp-lng', event.latLng.lng()
		fragment = Meteor.render( ->
			tmp = Template["incidentNew"]() # this calls the template and returns the HTML.
		)
		document.body.appendChild(fragment);
		$('#myModal').modal()


@addDblClickEventListener = (marker) ->
	google.maps.event.addListener marker, "dblclick", (event) ->
		lat = event.latLng.lat()
		lng = event.latLng.lng()

		mapIncident = Incidents.findOne( lat:lat, lng:lng )

		console.log 'dbl click'
		#mapIncident = incidents.findOne( {lat:event.latLng.pb, long:event.latLng.qb} )
		Session.set 'growl-view', mapIncident._id
		point = new google.maps.LatLng(lat, lng)
		window.map.panTo(point)


# Template.map_detail.helpers
# 	incident: -> 
# 		Incidents.findOne( Session.get 'currentIncidentId' )

Template.map_detail.rendered = ->
	incident = Incidents.findOne( Session.get 'currentIncidentId' )
	point = new google.maps.LatLng(incident.lat, incident.lng)
	mapOptions =
		zoom: 10
		center: point
	window.map = new google.maps.Map( document.getElementById('map-canvas'), mapOptions )
	marker = new google.maps.Marker(
			position: point
		)
	marker.setMap(map)
