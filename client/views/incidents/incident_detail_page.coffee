Template.incidentDetailPage.helpers
	incident: ->
		Incidents.findOne( Session.get 'currentIncidentId' )

	comments: ->
		Comments.find incidentId: Session.get 'currentIncidentId'