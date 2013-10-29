Template.incidentDetailPreview.helpers
	incident: ->
		Incidents.findOne( Session.get 'currentIncidentId' ) || Incidents.findOne()


Template.incidentDetailPreview.rendered = ->
	$el = $('#previewDetail-container')
	$el.animate
		backgroundColor: "rgb(95,195,95)"
		,300
		,->
			$el.animate
				backgroundColor: "rgb(212,212,212)"
				,300

