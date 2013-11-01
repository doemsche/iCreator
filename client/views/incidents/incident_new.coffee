Template.incidentNew.events
	'click .close-win': ->
		$('#myModal').modal('hide')
		$('#icidentNewForm').find("input[type=text], textarea").val("");
	'click .save-win': =>

		Errors.clearSeen()

		incident = 
			brand: $('#incidentBrand').val()
			color: $('#incidentColor input').val()
			story: $('#incidentStory').val()
			date: $('#incident-datepicker input').val()
			timeStart: $('#incidentTimeStart').val()
			timeEnd: $('#incidentTimeEnd').val()
			lat: Session.get('tmp-lat')
			lng: Session.get('tmp-lng')

		Meteor.call "incident", incident, (error, id) ->
			if error
				Errors.throw error.reason
			else
				point = new google.maps.LatLng(Session.get('tmp-lat'), Session.get('tmp-lng'))
				$('#myModal').modal('hide')
				$('#icidentNewForm').find("input[type=text], textarea").val("");
				marker = new google.maps.Marker(
					position: point
				)
				marker.setMap(map)
				addClickEventListener(marker)


Template.incidentNew.rendered = ->
	# $('#animated-switch').bootstrapSwitch()
	
	#$('#animated-switch').bootstrapSwitch('setAnimated',true)
	$('#inputLat').val( Session.get 'tmp-lat' )
	$('#inputLng').val( Session.get 'tmp-lng' )
	$('#incident-datepicker').datepicker()
	$('#incidentTimeStart').selectpicker()
	$('#incidentTimeEnd').selectpicker()
	$('#incidentColor').colorpicker()
	# $('.radio1').bootstrapSwitch()
	# $('.radio1').on 'switch-change', ->
	# 	$('.radio1').bootstrapSwitch('toggleRadioState')






	


