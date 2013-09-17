
#Meteor.startup = ->
#	Deps.autorun = ->
#		console.log("bar")
#
#		unless Session.get("selected")
#			incident = incidents.findOne()
#			Session.set "selected", incident._id  if incident
#			console.log(Session)

if Meteor.isClient
	Template.geoList.greeting = ->
		'dominik'

	Template.geoList.geoLocations = ->
		incidents.find {}, sort: lat: 1

	Template.geoList.events
		'click #btn_addObj': (e,t) ->

			lat = t.find("#lat").value
			long = t.find("#long").value
			txt = t.find("#txt").value
			incidentId = incidents.insert({ lat:lat, long: long, txt: txt});
			#Meteor.call('createIncident', {
			#	lat: lat,
			#	long: long,
			#	txt: txt
			#})
			
		'click .incident': (e,t) ->
			Session.set "selected_incident", e.currentTarget.id


	Template.details.incident = ->
		incident = incidents.findOne Session.get('selected_incident')

	Template.details.events
		'click #btn_updateObj': (e,t) ->
			name = t.find("#updatetxt").value
			console.log Session.get("selected_incident")
			#incidents.update Session.get("selected_incident"),
			#	$txt:
			#		txt: name

			#incidents.update Session.get("selected_incident"),
			#	$txt:
			#		txt: txt



	Template.map.rendered = ->
		oneIncident = incidents.findOne()
		tmpPoint = new google.maps.LatLng(oneIncident.lat, oneIncident.long)
		mapOptions =
			zoom: 4
			center: tmpPoint
		map = new google.maps.Map( document.getElementById('map-canvas'), mapOptions )
		incidents.find({}).forEach (incident) ->		
			point = new google.maps.LatLng(incident.lat, incident.long)
			marker = new google.maps.Marker(
				position: point
			)
			marker.setMap(map)
			addDblClickEventListener(marker)


		google.maps.event.addListener map, "dblclick", (event) ->
			placeMarker(event.latLng, console.log('point added to db') )
			
		
		placeMarker = (point, callback) ->
			marker = new google.maps.Marker(
				position: point
			)
			window.point = point
			#incident = Meteor.call('createIncident', {
			#	lat: point.lat(),
			#	long: point.lng(),
			#	txt: ""
			#})

			incidentId = incidents.insert({ lat: point.lat(), long: point.lng() });
			marker.setMap(map)
			addDblClickEventListener(marker)

			Session.set "selected_incident", incidentId



	addDblClickEventListener = (marker) ->
		google.maps.event.addListener marker, "dblclick", (event) ->
			console.log 'dbl click'
			mapIncident = incidents.findOne( {lat:event.latLng.pb, long:event.latLng.qb} )
			Session.set "selected_incident", mapIncident



  				


if Meteor.isServer
	Meteor.startup ->