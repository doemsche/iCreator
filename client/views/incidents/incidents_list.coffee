Template.incidentsList.helpers
	incidents: ->
		Incidents.find {}


Template.incidentsList.events
	'click #checkCurrentPosition.btn': ->
		statLat = 47.55376536118506
		statLng = 7.577385306358337
		point = new google.maps.LatLng(statLat, statLng)
		radius = 200

		circleOptions =
			strokeColor: '#FF0000'
			strokeOpacity: 0.8
			strokeWeight: 2
			fillColor: '#FF0000'
			fillOpacity: 0.35
			map: map
			center: point
			radius: radius
		circle = new google.maps.Circle circleOptions
		bounds = circle.getBounds()
		counter = 0;
		Incidents.find({}).forEach (incident) ->
			tmpPoint = new google.maps.LatLng( incident.lat, incident.lng )
			if bounds.contains tmpPoint
				counter += 1

			if counter > 2
				alert "2 Bike thefts reported within #{radius} meters"


				

