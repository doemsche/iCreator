Template.incidentDetailPage.helpers
	incident: ->
		Incidents.findOne( Session.get 'currentIncidentId' )

	incidentUser: ->
		Meteor.users.findOne()

	comments: ->
		Comments.find incidentId: Session.get 'currentIncidentId'

	isEditable: ->
		incident = Incidents.findOne( Session.get 'currentIncidentId' )
		if @ownsDocument Meteor.userId(), incident
			true
		else
			false



