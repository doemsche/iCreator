Template.incidentDetailPage.helpers
	incident: ->
		Incidents.findOne( Session.get 'currentIncidentId' )