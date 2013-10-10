Template.incidentDetailPage.helpers
	incident: ->
		Incidents.findOne( Session.get 'currentIncidentId' )

	comments: ->
		Comments.find incidentId: Session.get 'currentIncidentId'

	isEditable: ->
		incident = Incidents.findOne( Session.get 'currentIncidentId' )
		incident.userId is Meteor.user()._id


