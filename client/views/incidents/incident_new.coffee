Template.incidentNew.events
	'click .close-win': ->
		$('#myModal').modal('hide')

	'click .save-win': ->
		clearErrors()

		incident = 
			title: $('#inputTitle').val()
			lat: Session.get('tmp-lat')
			long: Session.get('tmp-lng')
			descr: $('#areaDescription').val()

		Meteor.call "incident", incident, (error, id) ->

			if error
				throwError error.reason
			else
				$('#myModal').modal('hide')
				marker = new google.maps.Marker(
					position: point
				)
				marker.setMap(map)


Template.incidentNew.rendered = ->
	$('#inputLat').val( Session.get 'tmp-lat'  )
	$('#inputLong').val( Session.get 'tmp-lng' )


