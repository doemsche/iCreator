Template.incidentDetailPage.helpers
	incident: ->
		Incidents.findOne( Session.get 'currentIncidentId' )

	incidentUserProfile: ->
		incidentUserId = Incidents.findOne(  Session.get('currentIncidentId') ).userId

		Meteor.users.findOne( incidentUserId )

	comments: ->
		Comments.find( incidentId: Session.get 'currentIncidentId' )

	isEditable: ->
		incident = Incidents.findOne( Session.get 'currentIncidentId' )
		if @ownsDocument Meteor.userId(), incident
			true
		else
			false



