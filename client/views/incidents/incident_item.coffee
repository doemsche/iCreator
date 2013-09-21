Template.incidentItem.helpers
	email: ->
		@name + "@gmx.ch"



Template.incidentItem.events
	"click .incident-item": (e,t) ->
		e.preventDefault()
		incident = Incidents.findOne(t.data._id)
		point = new google.maps.LatLng(incident.lat, incident.long)
		window.map.panTo(point)

		Session.set 'detail-view', t.data._id
