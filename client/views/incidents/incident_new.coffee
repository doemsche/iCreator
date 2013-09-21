Template.incidentNew.rendered = ->
	$('#inputLat').val( Session.get('tmp-latLong').ob )
	$('#inputLong').val( Session.get('tmp-latLong').pb )


