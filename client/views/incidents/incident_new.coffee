Template.incidentNew.helpers

Template.incidentNew.events
	'click .close-win': ->
		$('#myModal').modal('hide')

	'click .save-win': ->
		point = Session.get('tmp-latLong')
		incident = 
			title: $('#inputTitle').val()
			lat: point.ob
			long: point.pb
			descr: $('#areaDescription').val()

		Meteor.call "incident", incident, (error, id) ->
			if error
				throwError error.message
			else
				$('#myModal').modal('hide')
				marker = new google.maps.Marker(
					position: point
				)
				marker.setMap(map)


Template.incidentNew.rendered = ->
	$('#inputLat').val( Session.get('tmp-latLong').ob )
	$('#inputLong').val( Session.get('tmp-latLong').pb )


