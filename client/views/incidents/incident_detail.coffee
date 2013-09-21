Template.incidentDetail.helpers
	incident: ->
		Incidents.findOne( Session.get("detail-view") )