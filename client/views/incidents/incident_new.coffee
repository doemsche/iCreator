Template.incidentNew.events
	'click .close-win': ->
		$('#myModal').modal('hide')

	'click .save-win': =>

		Errors.clearSeen()

		incident = 
			title: $('#inputTitle').val()
			lat: Session.get('tmp-lat')
			lng: Session.get('tmp-lng')
			descr: $('#areaDescription').val()

		Meteor.call "incident", incident, (error, id) ->
			if error
				Errors.throw error.reason
			else
				point = new google.maps.LatLng(Session.get('tmp-lat'), Session.get('tmp-lng'))
				$('#myModal').modal('hide')
				marker = new google.maps.Marker(
					position: point
				)
				marker.setMap(map)
				addClickEventListener(marker)


Template.incidentNew.rendered = ->
	$('#inputLat').val( Session.get 'tmp-lat'  )
	$('#inputLng').val( Session.get 'tmp-lng' )


