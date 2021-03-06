Template.incidentsList.helpers
	incidents: ->
		Incidents.find {}

Template.incidentsList.rendered = ->
	$('#create-incident').popover({trigger:'hover'})
	if Session.get 'gui-state' 
		$('#title-modal').hide()
		$('#gui-state-container').addClass('gui-state-2')
	else
		$('#title-modal').show()
		$('#gui-state-container').removeClass('gui-state-2')


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
		$el = $('.nav .pull-right')
		I_animate($el, {
			cycle: 4,
			property:'backgroundColor',
			time:300,
			startColor:'rgb(0,0,0,0)',
			endColor:'#18bc9c'
		})
	
	'click .map-tab': (e) ->
		geocoder = new google.maps.Geocoder()
		geocoder.geocode
			address: e.target.id
			,
			(results, status) ->
				window.map.setCenter results[0].geometry.location

	'click #title-modal-close' : (e) ->
		e.preventDefault()
		$('#title-modal').hide()
		$('#gui-state-container').addClass('gui-state-2');
		Session.set('gui-state', 1)

	'click #gui-state-2-close' : (e) ->
		e.preventDefault()
		$('#title-modal').show()
		$('#gui-state-container').removeClass('gui-state-2');
		Session.set('gui-state', 0)


	'click #create-incident': (e) ->
		$el = $('#map-container')
		#$('#map-container').css('backgroundColor','red')
		$el.animate
			backgroundColor: "#18bc9c"
			,300
			,->
				$el.animate
					backgroundColor: "white"
					,300
					,->
						$el.animate
							backgroundColor: "#18bc9c"
							,300
							,->
								$el.animate
									backgroundColor: "white"
									,300
									,->
										$el.animate
											backgroundColor: "#18bc9c"
											,300






		
