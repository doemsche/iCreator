Template.incidentsList.helpers
	incidents: ->
		Incidents.find {}


Template.incidentsList.events
	'click #checkCurrentPosition.btn': ->
		if navigator.geolocation
			navigator.geolocation.getCurrentPosition (position)->
				point = new google.maps.LatLng(position.coords.latitude, position.coords.longitude)
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
					alert "#{counter} Bike thefts reported within #{radius} meters"
				else
					alert "less than 2 Bike thefts rported within #{radius} meters. It is relatively save for bikes here."
		else
			alert "geo not supported"

	'click .toggle': (e) ->
		e.preventDefault()
		$('body').toggleClass('toc-open sidebar-open')

	'click #start-now': (e) ->
		e.preventDefault()
		$('#login-dropdown-list').addClass('open');

	'click .map-tab': (e) ->
		geocoder = new google.maps.Geocoder()
		geocoder.geocode
			address: e.target.id
			,
			(results, status) ->
				window.map.setCenter results[0].geometry.location


		
